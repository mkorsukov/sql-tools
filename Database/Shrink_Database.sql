dbcc shrinkdatabase ('dispatcher');

select top 1 storage_in_megabytes as [SpaceUsedMb]
from sys.resource_stats
where database_name = 'dispatcher'
order by end_time desc;

 -- alter index all on HumanResources.Employee reorganize;