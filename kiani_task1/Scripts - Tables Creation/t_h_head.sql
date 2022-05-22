
/*
	This code will create the t_h_head table
	and inserts the values from main country tables
*/

BEGIN TRY	
	DROP TABLE IF EXISTS t_h_head;  

	create table t_h_head (
		childid	varchar(15)	,
		[round]	int	,
		headid	int	,
		headedu	int	,
		headage	int	,
		headsex	int	,
		headrel	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_h_head FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_h_head 
		select childid,	[round],headid,headedu,headage,headsex,headrel
		from main_ethiopia
	
	INSERT INTO t_h_head 
		select childid,	[round],headid,headedu,headage,headsex,headrel
		from main_india

	INSERT INTO t_h_head 
		select childid,	[round],headid,null, headage,headsex,headrel
		from main_peru

	INSERT INTO t_h_head 
		select childid,	[round],headid,headedu,headage,headsex,headrel
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
