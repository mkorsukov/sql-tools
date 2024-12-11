select
  f.file_id,
  f.name,
  cast(fileproperty(f.name, 'SpaceUsed') as bigint) * 8 / 1024.0 as [space_used_mb],
  cast(f.size as bigint) * 8 / 1024.0 as [space_allocated_mb],
  cast(f.max_size as bigint) * 8 / 1024.0 as [max_file_size_mb]
FROM sys.database_files f
where
  f.type_desc in ('ROWS', 'LOG');

-- dbcc shrinkdatabase (N'database_name');
-- update indexes after shrink!