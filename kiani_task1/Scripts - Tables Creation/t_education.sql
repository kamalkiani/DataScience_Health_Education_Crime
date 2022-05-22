
/*
	This code will create the t_education table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_education;  

	create table t_education (
		childid	varchar(15)	,
		[round]	int	,
		preprim	int	,
		agegr1	int	,
		enrol	int	,
		engrade	int	,
		entype	int	,
		hghgrade	int	,
		timesch	int	,
		levlread	int	,
		levlwrit	int	,
		literate	int	,

		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_education FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_education 
		select childid,	[round],	preprim,	agegr1,	enrol,	engrade, entype,	hghgrade,	timesch,	levlread,	levlwrit, literate
		from main_ethiopia
	
	INSERT INTO t_education 
		select childid,	[round],	preprim,	agegr1,	enrol,	engrade, entype,	hghgrade,	timesch,	levlread,	levlwrit, literate
		from main_india

	INSERT INTO t_education 
		select childid,	[round],	preprim,	agegr1,	enrol,	engrade, entype,	null , timesch,	levlread,	levlwrit, literate
		from main_peru

	INSERT INTO t_education 
		select childid,	[round],	preprim,	agegr1,	enrol,	engrade, entype,	hghgrade,	timesch,	levlread,	levlwrit, literate
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
