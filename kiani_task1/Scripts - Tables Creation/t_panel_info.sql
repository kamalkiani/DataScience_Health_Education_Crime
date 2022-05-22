/*
	This code will create the t_panel_info table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_panel_info;  

	create table t_panel_info (
		childid	varchar(15)	,
		[round]	int	,
		inround	int	,
		deceased	int	,
		agemon	int	,
		dint date	,	   
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_panel_info FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_panel_info 
		select childid	,[round]	,inround	,deceased	,agemon	,dint
		from main_ethiopia	

	INSERT INTO t_panel_info 
		select childid	,[round]	,inround	,deceased	,agemon	,dint
		from main_india

	INSERT INTO t_panel_info  
		select childid	,[round]	,inround	,deceased	,agemon	,dint
		from main_peru

	INSERT INTO t_panel_info 
		select childid	,[round]	,inround	,deceased	,agemon	,dint
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
