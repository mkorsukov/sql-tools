select
  t.NAME as [TableName],
  p.rows as [Rows],
  cast(round(((sum(a.total_pages) * 8) / 1024.00), 2) as decimal(12,2)) as [TotalSpaceMB],
  cast(round(((sum(a.used_pages) * 8) / 1024.00), 2) as decimal(12,2)) as [UsedSpaceMB]
from sys.tables t
inner join sys.indexes i on t.OBJECT_ID = i.object_id
inner join sys.partitions p on i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
inner join sys.allocation_units a on p.partition_id = a.container_id
where
  t.NAME not like 'dt%'
  and t.is_ms_shipped = 0
  and i.OBJECT_ID > 255
group by
  t.Name, p.Rows
order by
  TotalSpaceMB desc, t.Name;