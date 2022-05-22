
/*
	This code will create the t_comunication_fac table
	and inserts the values from vietnam tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_comunication_fac;

	Create Table t_comunication_fac (
		UNIQUEID	varchar(50)	,
		STHVCOMP	int	,
		STHVINTR	int	,
		STHVDVD		int	,
		STHVCBLE	int	,
		STHVMTEL	int	,
		STHVRADO	int	,
		STHVTELE	int	,
		PRIMARY KEY (UNIQUEID));

	INSERT INTO t_comunication_fac 
		SELECT 	UNIQUEID,	STHVCOMP,	STHVINTR,	STHVDVD	,	STHVCBLE,	STHVMTEL,	STHVRADO,	STHVTELE	
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
