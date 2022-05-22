/*
	This code will create the t_time_use table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_time_use;  

	create table t_time_use (
		childid	varchar(15)	,
		[round]	int	,
		hsleep	float	,
		hcare	float	,
		hchore	float	,
		htask	float	,
		hwork	float	,
		hschool	float	,
		hstudy	float	,
		hplay	float	,
		commwork	float	,
		commsch	float	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_time_use FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_time_use  
		select childid,	[round],	hsleep,	hcare,	hchore,	htask,	hwork,	hschool,	hstudy,	hplay,	commwork,	commsch
		from main_ethiopia

	INSERT INTO t_time_use 
		select childid,	[round],	hsleep,	hcare,	hchore,	htask,	hwork,	hschool,	hstudy,	hplay,	commwork,	commsch
		from main_india

	INSERT INTO t_time_use 
		select childid,	[round],	hsleep,	hcare,	hchore,	htask,	hwork,	hschool,	hstudy,	hplay,	commwork,	commsch
		from main_peru

	INSERT INTO t_time_use  
		select childid,	[round],	hsleep,	hcare,	hchore,	htask,	hwork,	hschool,	hstudy,	hplay,	commwork,	commsch
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
