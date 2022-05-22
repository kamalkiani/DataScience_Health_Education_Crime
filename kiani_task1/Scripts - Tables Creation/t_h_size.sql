/*
	This code will create the t_h_size table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_h_size;  

	create table t_h_size (
		childid	varchar(15)	,
		[round]	int	,
		hhsize	int	,
		male05	int	,
		male612	int	,
		male1317	int	,
		male1860	int	,
		male61	int	,
		female05	int	,
		female612	int	,
		female1317	int	,
		female1860	int	,
		female61	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_h_size FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_h_size 
		select childid,[round],hhsize,male05,male612,male1317,male1860,male61,female05,female612,female1317,female1860,female61
		from main_ethiopia
	
	INSERT INTO t_h_size
		select childid,[round],hhsize,male05,male612,male1317,male1860,male61,female05,female612,female1317,female1860,female61
		from main_india

	INSERT INTO t_h_size 
		select childid,[round],hhsize,male05,male612,male1317,male1860,male61,female05,female612,female1317,female1860,female61
		from main_peru

	INSERT INTO t_h_size 
		select childid,[round],hhsize,male05,male612,male1317,male1860,male61,female05,female612,female1317,female1860,female61
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

