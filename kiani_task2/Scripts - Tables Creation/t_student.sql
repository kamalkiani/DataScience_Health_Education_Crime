
/*
	This code will create the t_student table
	and inserts the values from vietnam tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_student;

	Create Table t_student (
		UNIQUEID	varchar(50)	,
		SCHOOLID	int	,
		CLASSID	int	,
		STUDENTID	int	,
		YLCHILDID	varchar(50)	,
		PROVINCE	int	,
		DISTRICTCODE	int	,
		LOCALITY	int	,
		GENDER	int	,
		AGE	int	,
		ABSENT_DAYS	int	,
		ETHNICITY	int	,
		PRIMARY KEY (UNIQUEID));

	INSERT INTO t_student 
		SELECT UNIQUEID,SCHOOLID,CLASSID,STUDENTID,YLCHILDID,PROVINCE,DISTRICTCODE,LOCALITY,GENDER,AGE,ABSENT_DAYS,ETHNICITY	
		FROM vietnam_w1;
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

