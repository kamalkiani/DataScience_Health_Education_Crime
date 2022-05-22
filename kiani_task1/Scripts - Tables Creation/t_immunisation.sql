/*
	This code will create the t_immunisation table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_immunisation;  

	create table t_immunisation (
		childid	varchar(15)	,
		[round]	int	,
		bwght	int	,
		bwdoc	int	,
		numante	int	,
		delivery	int	,
		tetanus	int	,
		bcg	int	,
		measles	int	,
		polio	int	,
		dpt	int	,
		hib	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_immunisation FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_immunisation 
		select childid	,[round],	bwght	,bwdoc,	numante	,delivery,	tetanus	,bcg	,measles	,polio,	dpt,	hib
		from main_ethiopia
	
	INSERT INTO t_immunisation 
		select childid	,[round],	bwght	,bwdoc,	numante	,delivery,	tetanus	,bcg	,measles	,polio,	dpt,	hib
		from main_india

	INSERT INTO t_immunisation 
		select childid	,[round],	bwght	,bwdoc,	numante	,delivery,	tetanus	,bcg	,measles	,polio,	dpt,	hib
		from main_peru

	INSERT INTO t_immunisation 
		select childid	,[round],	bwght	,bwdoc,	numante	,delivery,	tetanus	,bcg	,measles	,polio,	dpt,	hib
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
