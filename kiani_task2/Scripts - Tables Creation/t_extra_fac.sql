
/*
	This code will create the t_extra_fac table
	and inserts the values from vietnam tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_extra_fac;

	  Create Table t_extra_fac (
		UNIQUEID	varchar(50)	,
		STHVEFAN	int	,
		STHVAIRC	int	,
		STHVFRDG	int	,
		STHVMCRO	int	,
		STHVBIKE	int	,
		STHVCAR		int	,
		STHVMTBK	int	
		PRIMARY KEY (UNIQUEID));

	INSERT INTO t_extra_fac 
		SELECT 	UNIQUEID,	STHVEFAN,	STHVAIRC,	STHVFRDG,	STHVMCRO,	STHVBIKE,	STHVCAR,	STHVMTBK	
		FROM vietnam_w1;
END TRY
BEGIN CATCH
	  SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO
