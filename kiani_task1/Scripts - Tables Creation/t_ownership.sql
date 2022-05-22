/*
	This code will create the t_ownership table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_ownership;  

	create table t_ownership (
		childid	varchar(15)	,
		[round]	int	,
		aniany	int	,
		animilk	int	,
		anidrau	int	,
		anirumi	int	,
		anicowm	int	,
		anicowt	int	,
		anicalv	int	,
		ownlandhse	int	,
		ownhouse	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_ownership FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_ownership 
		select childid,	[round],	aniany,	animilk,	anidrau,	anirumi,	anicowm,	anicowt,	anicalv,	ownlandhse,	ownhouse
		from main_ethiopia

	INSERT INTO t_ownership  
		select childid,	[round],	aniany,	animilk,	anidrau,	anirumi,	anicowm,	anicowt,	anicalv,	ownlandhse,	ownhouse
		from main_india

	INSERT INTO t_ownership  
		select childid,	[round],	aniany,	animilk,	anidrau,	anirumi,	anicowm,	anicowt,	null,        ownlandhse, ownhouse
		from main_peru

	INSERT INTO t_ownership 
		select childid,	[round],	aniany,	animilk,	anidrau,	anirumi,	anicowm,	anicowt,	anicalv,	ownlandhse,	ownhouse
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
