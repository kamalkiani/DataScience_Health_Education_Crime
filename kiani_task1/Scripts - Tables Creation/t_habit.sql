/*
	This code will create the t_habit table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_habit;  

	create table t_habit (
		childid	varchar(15)	,
		[round]	int	,
		chsmoke	int	,
		chalcohol	int	,
		chrephealth1	int	,
		chrephealth2	int	,
		chrephealth3	int	,
		chrephealth4	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_habit FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);


	INSERT INTO t_habit 
		select childid,	[round],	chsmoke,	chalcohol,	chrephealth1,	chrephealth2,	chrephealth3,	chrephealth4
		from main_ethiopia
	
	INSERT INTO t_habit 
		select childid,	[round],	chsmoke,	chalcohol,	chrephealth1,	chrephealth2,	chrephealth3,	chrephealth4
		from main_india

	INSERT INTO t_habit 
		select childid,	[round],	chsmoke,	chalcohol,	chrephealth1,	chrephealth2,	chrephealth3,	chrephealth4
		from main_peru

	INSERT INTO t_habit 
		select childid,	[round],	chsmoke,	chalcohol,	chrephealth1,	chrephealth2,	chrephealth3,	chrephealth4
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
