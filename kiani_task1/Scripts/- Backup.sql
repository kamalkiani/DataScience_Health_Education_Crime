
	BACKUP DATABASE [kiani_t1] 
	TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\kiani_t1' 
	WITH NOFORMAT, NOINIT,  NAME = N'kiani_t1-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
	GO

