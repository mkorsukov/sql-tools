set nocount on;
set datefirst 1;

declare @TimeOffset int = -360;
declare @NowTime datetimeoffset(0) = switchoffset(getutcdate(), @TimeOffset);
declare @FirstWeek date = dateadd(dd, 1 - datepart(dw, @NowTime) - 5 * 7, @NowTime);

declare @Week1StartTime datetimeoffset(0) = todatetimeoffset(datetimefromparts(datepart(yy, @FirstWeek), datepart(mm, @FirstWeek), datepart(dd, @FirstWeek), 0, 0, 0, 0), @TimeOffset);
declare @Week1EndTime datetimeoffset(0) = dateadd(ss, -1, dateadd(dd, 7, @Week1StartTime));
declare @Week2StartTime datetimeoffset(0) = dateadd(dd, 7, @Week1StartTime);
declare @Week2EndTime datetimeoffset(0) = dateadd(ss, -1, dateadd(dd, 7, @Week2StartTime));
declare @Week3StartTime datetimeoffset(0) = dateadd(dd, 7, @Week2StartTime);
declare @Week3EndTime datetimeoffset(0) = dateadd(ss, -1, dateadd(dd, 7, @Week3StartTime));
declare @Week4StartTime datetimeoffset(0) = dateadd(dd, 7, @Week3StartTime);
declare @Week4EndTime datetimeoffset(0) = dateadd(ss, -1, dateadd(dd, 7, @Week4StartTime));
declare @Week5StartTime datetimeoffset(0) = dateadd(dd, 7, @Week4StartTime);
declare @Week5EndTime datetimeoffset(0) = dateadd(ss, -1, dateadd(dd, 7, @Week5StartTime));
declare @Week6StartTime datetimeoffset(0) = dateadd(dd, 7, @Week5StartTime);
declare @Week6EndTime datetimeoffset(0) = dateadd(ss, -1, dateadd(dd, 7, @Week6StartTime));

print @Week1StartTime;
print @Week1EndTime;
print @Week2StartTime;
print @Week2EndTime;
print @Week3StartTime;
print @Week3EndTime;
print @Week4StartTime;
print @Week4EndTime;
print @Week5StartTime;
print @Week5EndTime;
print @Week6StartTime;
print @Week6EndTime;