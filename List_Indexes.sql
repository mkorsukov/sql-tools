select
  i.[name] as [Name],
  substring(column_names, 1, len(column_names) - 1) as [Columns],
  case
    when i.[type] = 1 then N'Clustered index'
    when i.[type] = 2 then N'Nonclustered unique index'
    when i.[type] = 3 then N'XML index'
    when i.[type] = 4 then N'Spatial index'
    when i.[type] = 5 then N'Clustered columnstore index'
    when i.[type] = 6 then N'Nonclustered columnstore index'
    when i.[type] = 7 then N'Nonclustered hash index'
  end as [Type],
  case
    when i.is_unique = 1 then N'Unique'
    else N'Not unique'
  end as [IsUnique],
  schema_name(t.schema_id) + '.' + t.[name] as [TableView]
  -- case when t.[type] = 'U' then 'Table'
  --   when t.[type] = 'V' then 'View'
  --   end as [object_type]
from sys.objects t
inner join sys.indexes i on t.object_id = i.object_id
cross apply (
  select col.[name] + ', '
  from sys.index_columns ic
  inner join sys.columns col on ic.object_id = col.object_id and ic.column_id = col.column_id
  where ic.object_id = t.object_id and ic.index_id = i.index_id
  order by key_ordinal
  for xml path ('')) D (column_names)
where
  t.is_ms_shipped <> 1
  and index_id > 0
  and [column_names] like '%UserId%'
order by
  i.[name];