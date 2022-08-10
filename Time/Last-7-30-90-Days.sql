declare @TimeOffset int = -300;

set nocount on;
set datefirst 1;

declare @NowTime datetimeoffset(0) = switchoffset(getutcdate(), @TimeOffset);
declare @Last7Days date = dateadd(dd, -7, @NowTime);
declare @Last30Days date = dateadd(dd, -30, @NowTime);
declare @Last90Days date = dateadd(dd, -90, @NowTime);

declare @Last7DaysStartTime datetimeoffset(0) = todatetimeoffset(datetimefromparts(datepart(yy, @Last7Days), datepart(mm, @Last7Days), datepart(dd, @Last7Days), 0, 0, 0, 0), @TimeOffset);
declare @Last30DaysStartTime datetimeoffset(0) = todatetimeoffset(datetimefromparts(datepart(yy, @Last30Days), datepart(mm, @Last30Days), datepart(dd, @Last30Days), 0, 0, 0, 0), @TimeOffset);
declare @Last90DaysStartTime datetimeoffset(0) = todatetimeoffset(datetimefromparts(datepart(yy, @Last90Days), datepart(mm, @Last90Days), datepart(dd, @Last90Days), 0, 0, 0, 0), @TimeOffset);

print @Last7DaysStartTime;
print @Last30DaysStartTime;
print @Last90DaysStartTime;