
	BACKUP DATABASE [kiani_t3] 
	TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\kiani_t3' 
	WITH NOFORMAT, NOINIT,  NAME = N'kiani_t3-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
	GO

