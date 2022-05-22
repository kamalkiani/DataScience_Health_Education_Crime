
	BACKUP DATABASE [kiani_t2] 
	TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\kiani_t2' 
	WITH NOFORMAT, NOINIT,  NAME = N'kiani_t2-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
	GO


