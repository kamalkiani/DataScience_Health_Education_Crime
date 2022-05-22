
/*
	This code will create the t_h_shocks table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_h_shocks;  

	create table t_h_shocks (
		childid	varchar(15)	,
		[round]	int	,
		shcrime1	int	,
		shcrime2	int	,
		shcrime3	int	,
		shcrime4	int	,
		shcrime5	int	,
		shenv1	int	,
		shenv2	int	,
		shenv3	int	,
		shenv4	int	,
		shenv5	int	,
		shfam1	int	,
		shfam2	int	,
		shfam3	int	,
		shfam4	int	,
		shfam5	int	,
		shother	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_h_shocks FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_h_shocks 
		select childid,[round]	,shcrime1	,shcrime2	,shcrime3	,shcrime4	,shcrime5	,shenv1	,shenv2	,shenv3	,shenv4	,shenv5	,shfam1	,shfam2	,shfam3	,shfam4	,shfam5	,shother

		from main_ethiopia

	INSERT INTO t_h_shocks 
		select childid,[round]	,shcrime1	,shcrime2	,shcrime3	,shcrime4	,shcrime5	,shenv1	,shenv2	,shenv3	,shenv4	,shenv5	,shfam1	,shfam2	,shfam3	,shfam4	,shfam5	,shother
		from main_india

	INSERT INTO t_h_shocks 
		select childid,[round]	,shcrime1	,shcrime2	,shcrime3	,shcrime4	,shcrime5	,shenv1	,shenv2	,shenv3	,shenv4	,shenv5	,shfam1	,shfam2	,shfam3	,shfam4	,shfam5	,shother
		from main_peru

	INSERT INTO t_h_shocks 
		select childid,[round]	,shcrime1	,shcrime2	,shcrime3	,shcrime4	,shcrime5	,shenv1	,shenv2	,shenv3	,shenv4	,shenv5	,shfam1	,shfam2	,shfam3	,shfam4	,shfam5	,shother
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
