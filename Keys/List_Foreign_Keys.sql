set nocount on;

select
  RC.CONSTRAINT_NAME as "FK_Name",
  KF.TABLE_NAME as "FK_Table",
  KF.COLUMN_NAME as "FK_Column",
  RC.UNIQUE_CONSTRAINT_NAME as "PK_Name",
  KP.TABLE_NAME as "PK_Table",
  KP.COLUMN_NAME as "PK_Column",
  RC.DELETE_RULE as "DeleteRule"
FROM
  INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC
  JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KF ON RC.CONSTRAINT_NAME = KF.CONSTRAINT_NAME
  JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KP ON RC.UNIQUE_CONSTRAINT_NAME = KP.CONSTRAINT_NAME
where
  KP.TABLE_NAME = N'User' and KP.COLUMN_NAME = N'Id'
order by
  RC.CONSTRAINT_NAME;