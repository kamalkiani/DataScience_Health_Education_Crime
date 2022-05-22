
/*
	This code will create the t_cohabited table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_cohabited;  

	create table t_cohabited (
		childid	varchar(15)	,
		[round]	int	,
		marrcohab	int		,
		marrcohab_age	int		,
		birth	int		,
		birth_age	int		,

		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_cohabited FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_cohabited 
		select childid,	[round],	marrcohab,	marrcohab_age,	birth,	birth_age
		from main_ethiopia
	
	INSERT INTO t_cohabited 
		select childid,	[round],	marrcohab,	marrcohab_age,	birth,	birth_age
		from main_india

	INSERT INTO t_cohabited 
		select childid,	[round],	marrcohab,	marrcohab_age,	birth,	birth_age
		from main_peru

	INSERT INTO t_cohabited 
		select childid,	[round],	marrcohab,	marrcohab_age,	birth,	birth_age
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
