declare @TimeOffset int = -300;

set nocount on;
set datefirst 1;

declare @NowTime date = switchoffset(getutcdate(), @TimeOffset);
declare @Last7DaysStartTime datetimeoffset(0) = todatetimeoffset(dateadd(dd, -7, @NowTime), @TimeOffset);
declare @Last30DaysStartTime datetimeoffset(0) = todatetimeoffset(dateadd(dd, -30, @NowTime), @TimeOffset);
declare @Last90DaysStartTime datetimeoffset(0) = todatetimeoffset(dateadd(dd, -90, @NowTime), @TimeOffset);

print @Last7DaysStartTime;
print @Last30DaysStartTime;
print @Last90DaysStartTime;