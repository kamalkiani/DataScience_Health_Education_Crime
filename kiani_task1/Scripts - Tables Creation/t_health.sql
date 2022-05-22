/*
	This code will create the t_health table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_health;  

	create table t_health (
		childid	varchar(15)	,
		[round]	int	,
		chmightdie	int	,
		chillness	int	,
		chinjury	int	,
		chhprob	int	,
		chdisability	int	,
		chdisscale	int	,
		chhrel	int	,
		chhealth	int	,
		cladder	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_health FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_health  
		select childid	,[round], chmightdie,	chillness,	chinjury,	chhprob,	chdisability,	chdisscale,	chhrel,	chhealth,	cladder
		from main_ethiopia
	
	INSERT INTO t_health  
		select childid	,[round], chmightdie,	chillness,	chinjury,	chhprob,	chdisability,	chdisscale,	chhrel,	chhealth,	cladder
		from main_india
	
	INSERT INTO t_health  
		select childid	,[round], chmightdie,	chillness,	chinjury,	chhprob,	chdisability,	chdisscale,	chhrel,	chhealth,	cladder
		from main_peru
	
	INSERT INTO t_health  
		select childid	,[round], chmightdie,	chillness,	chinjury,	chhprob,	chdisability,	chdisscale,	chhrel,	chhealth,	cladder
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
