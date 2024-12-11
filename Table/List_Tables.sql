set nocount on;

select
  t.table_schema,
  t.table_name
from
  INFORMATION_SCHEMA.TABLES t
where
  t.table_type = 'BASE TABLE'
order by
  t.table_name;