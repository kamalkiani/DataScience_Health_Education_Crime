
/*
	This code creates the t_w2 table and inserts the values from vietnam_w2
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_w2;

	Create Table t_w2 (
		UNIQUEID	varchar(50)	,
		STCMPSCH	int	,
		STCMPHME	int	,
		STPRVMT		int	,
		STPRVEN		int	,
		STPRVOT		int	,
		PRIMARY KEY (UNIQUEID));

	INSERT INTO t_w2 
		SELECT UNIQUEID,	STCMPSCH,	STCMPHME,	STPRVMT,	STPRVEN,	STPRVOT	
		FROM vietnam_w2;
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

