
/*
	This code will create the t_educatin_fac table
	and inserts the values from vietnam tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_educatin_fac;

	  Create Table t_educatin_fac (
		UNIQUEID	varchar(50)	,
		STNMBOOK	int	,
		STPLSTDY	int	,
		STHVDESK	int	,
		STHVCHR		int	,
		STHVLAMP	int	
		PRIMARY KEY (UNIQUEID));

	INSERT INTO t_educatin_fac
		SELECT   UNIQUEID, STNMBOOK,	STPLSTDY,	STHVDESK,	STHVCHR,	STHVLAMP
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
