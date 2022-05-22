/*
	This procedure returns the number mothers received at least 
	two injections for tetanus during pregnancy with YL chi
*/

CREATE or ALTER PROCEDURE SP_Mothers_Injections
@cnt int OUTPUT 
AS
	SET NOCOUNT ON;
	SELECT  @cnt = count( DISTINCT childid )
	from t_immunisation
	where tetanus = 1 
RETURN @cnt
GO

DECLARE @ret nvarchar(15);  
EXEC @ret = SP_Mothers_Injections @cnt = 0; 
SELECT N'Result: ' + @ret; 