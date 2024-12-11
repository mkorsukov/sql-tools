select top 25
  o.name as "TableName",
  i.name as "IndexName",
--, i.index_id as "IndexID"
  dm_ius.user_seeks as "UserSeek",
  dm_ius.user_scans as "UserScans",
  dm_ius.user_lookups as "UserLookups",
  dm_ius.user_updates as "UserUpdates",
  p.TableRows,
  'drop index ' + quotename(i.name) + ' on ' + quotename(s.name) + '.' + quotename(object_name(dm_ius.OBJECT_ID)) as "Statement"
from
  sys.dm_db_index_usage_stats dm_ius
  inner join sys.indexes i on i.index_id = dm_ius.index_id and dm_ius.OBJECT_ID = i.OBJECT_ID
  inner join sys.objects o on dm_ius.OBJECT_ID = o.OBJECT_ID
  inner join sys.schemas s on o.schema_id = s.schema_id
  inner join (
    select sum(p.rows) TableRows, p.index_id, p.OBJECT_ID
    from sys.partitions p group by p.index_id, p.OBJECT_ID) p
    on p.index_id = dm_ius.index_id and dm_ius.OBJECT_ID = p.OBJECT_ID
where
  objectproperty(dm_ius.OBJECT_ID, 'IsUserTable') = 1
  and dm_ius.database_id = db_id()
  and i.type_desc = 'nonclustered'
  and i.is_primary_key = 0
  and i.is_unique_constraint = 0
order by
  (dm_ius.user_seeks + dm_ius.user_scans + dm_ius.user_lookups) asc;