/*
	This code will create the t_Identification table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_Identification;  

	create table t_Identification (
		childid	varchar(15)	,
		[round]	int	,
		clustid	int	,
		commid	varchar(15)	,
		typesite	int	,
		region	int	,
		childloc	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_Identification FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_Identification 
		select childid,	[round]	,clustid	,commid	,typesite	,region,	childloc
		from main_ethiopia
	
	INSERT INTO t_Identification
		select childid,	[round]	,clustid	,commid	,typesite	,region,	childloc
		from main_india

	INSERT INTO t_Identification 
		select childid,	[round]	,clustid	,commid	,typesite	,region,	childloc
		from main_peru

	INSERT INTO t_Identification
		select childid,	[round]	,clustid	,commid	,typesite	,region,	childloc
		from main_vietnam
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
