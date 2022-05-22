
/*
	This code will create the t_mfc_info table
	and inserts the values from main country tables
*/

BEGIN TRY
	DROP TABLE IF EXISTS t_mfc_info;  

	create table t_mfc_info (
		childid	varchar(15)	,
		[round]	int	,
		careid	int	,
		caredu	int	,
		carehead	int	,
		careage	int	,
		caresex	int	,
		carerel	int	,
		carecantread	int	,
		careladder	int	,
		careldr4yrs	int	,
		dadid	int	,
		dadedu	int	,
		dadlive	int	,
		dadage	int	,
		dadcantread	int	,
		dadyrdied	int	,
		momid	int	,
		momedu	int	,
		momlive	int	,
		momage	int	,
		momcantread	int	,
		momyrdied	int	,
		PRIMARY KEY (childid, [round]),
		CONSTRAINT FK_t_mfc_info FOREIGN KEY (childid) REFERENCES t_general_info(childid)
	);

	INSERT INTO t_mfc_info 
		select childid,[round],careid,caredu,carehead,careage,caresex,carerel,carecantread,careladder,careldr4yrs,dadid,dadedu,dadlive,dadage,dadcantread,dadyrdied,momid,momedu,momlive,momage,momcantread,momyrdied
		from main_ethiopia
	
	INSERT INTO t_mfc_info 
		select childid,[round],careid,caredu,carehead,careage,caresex,carerel,carecantread,careladder,careldr4yrs,dadid,dadedu,dadlive,dadage,dadcantread,dadyrdied,momid,momedu,momlive,momage,momcantread,momyrdied
		from main_india

	INSERT INTO t_mfc_info  
		select childid,[round],careid,caredu,carehead,careage,caresex,carerel,carecantread,careladder,careldr4yrs,dadid,dadedu,dadlive,dadage,dadcantread,dadyrdied,momid,momedu,momlive,momage,momcantread,momyrdied
		from main_peru

	INSERT INTO t_mfc_info 
		select childid,[round],careid,caredu,carehead,careage,caresex,carerel,carecantread,careladder,careldr4yrs,dadid,dadedu,dadlive,dadage,dadcantread,dadyrdied,momid,momedu,momlive,momage,momcantread,momyrdied
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
