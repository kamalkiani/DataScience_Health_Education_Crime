/*
	This code will create the t_general_info table
	and inserts the values from main country tables
*/
BEGIN TRY
	DROP TABLE IF EXISTS t_general_info;   
	create table t_general_info (
		childid VARCHAR(15) , chsex	int, chlang	int, chethnic int,
		chldrel	int, panel12345	int, yc	int, country varchar(10),
		PRIMARY KEY (childid)
	);
	INSERT INTO t_general_info
		select distinct childid,chsex,chlang,chethnic,chldrel,panel12345,yc,'ethiopia'
		from main_ethiopia
	INSERT INTO t_general_info
		select distinct childid,chsex,chlang,chethnic,chldrel,panel12345,yc,'india'
		from main_india
	INSERT INTO t_general_info
		select distinct childid,chsex,chlang,chethnic,chldrel,panel12345,yc,'peru'
		from main_peru
	INSERT INTO t_general_info
		select distinct childid,chsex,chlang,chethnic,chldrel,panel12345,yc,'vietnam'
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