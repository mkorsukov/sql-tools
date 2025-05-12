declare @TableName varchar(255);
declare @Sql nvarchar(500);
declare @FillFactor int = 80;

declare TableCursor cursor for
  select quotename(object_schema_name([object_id]))+'.' + quotename(name) as "TableName"
  from sys.tables;

open TableCursor
  fetch next from TableCursor into @TableName
  while @@FETCH_STATUS = 0
  begin
    set @Sql = 'ALTER INDEX ALL ON ' + @TableName + ' REBUILD WITH (FILLFACTOR = ' + convert(varchar(3), @FillFactor) + ')';
    exec (@Sql);
    fetch next from TableCursor into @TableName;
  end

close TableCursor;
deallocate TableCursor;

go
