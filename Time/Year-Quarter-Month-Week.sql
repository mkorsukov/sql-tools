set nocount on;
set datefirst 1;

declare @TimeOffset int = -360;
declare @NowTime datetimeoffset(0) = switchoffset(getutcdate(), @TimeOffset);
declare @Week date = dateadd(dd, 1 - datepart(dw, @NowTime), @NowTime);

declare @WeekStartTime datetimeoffset(0) = todatetimeoffset(datetimefromparts(datepart(yy, @Week), datepart(mm, @Week), datepart(dd, @Week), 0, 0, 0, 0), @TimeOffset);
declare @MonthStartTime datetimeoffset(0) = todatetimeoffset(datefromparts(year(@NowTime), month(@NowTime), 1), @TimeOffset);
declare @QuarterStartTime datetimeoffset(0) = todatetimeoffset(datefromparts(year(@NowTime), (((month(@NowTime) - 1) / 3) * 3 + 1), 1), @TimeOffset);
declare @YearStartTime datetimeoffset(0) = todatetimeoffset(datefromparts(year(@NowTime), 1, 1), @TimeOffset);

print @WeekStartTime;
print @MonthStartTime;
print @QuarterStartTime;
print @YearStartTime;