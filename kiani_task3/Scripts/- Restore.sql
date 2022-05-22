
	USE [master]
	RESTORE DATABASE [kiani_t3] 
	FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\kiani_t3' 
	WITH  FILE = 1,  NOUNLOAD,  STATS = 5
	GO


