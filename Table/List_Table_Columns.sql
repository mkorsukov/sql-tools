set nocount on;

select
  COLUMN_NAME,
  case DATA_TYPE
    when 'nvarchar' then DATA_TYPE + '(' + cast(CHARACTER_MAXIMUM_LENGTH as varchar) + ')'
    when 'varchar' then DATA_TYPE + '(' + cast(CHARACTER_MAXIMUM_LENGTH as varchar) + ')'
    when 'decimal' then DATA_TYPE + '(' + cast(NUMERIC_PRECISION as varchar) + ',' + cast(NUMERIC_SCALE as varchar) + ')'
    else DATA_TYPE
  end as "DATA_TYPE",
  IS_NULLABLE
from
  INFORMATION_SCHEMA.COLUMNS
where
  TABLE_NAME = 'Table'
order by
  ORDINAL_POSITION;