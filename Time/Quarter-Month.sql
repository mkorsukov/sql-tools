set nocount on;

declare @Year int = 2022;
declare @Quarter int = 3;
declare @TimeOffset int = -360;
declare @NowTime date = switchoffset(getutcdate(), @TimeOffset);

declare @Month1Start date = datefromparts(@Year, (@Quarter - 1) * 3 + 1, 1);
declare @Month1End date = dateadd(dd, -1, dateadd(mm, 1, @Month1Start));
declare @Month2Start date = dateadd(mm, 1, @Month1Start);
declare @Month2End date = dateadd(dd, -1, dateadd(mm, 1, @Month2Start));
declare @Month3Start date = dateadd(mm, 2, @Month1Start);
declare @Month3End date = dateadd(dd, -1, dateadd(mm, 1, @Month3Start));

print @Month1Start;
print @Month1End;
print @Month2Start;
print @Month2End;
print @Month3Start;
print @Month3End;