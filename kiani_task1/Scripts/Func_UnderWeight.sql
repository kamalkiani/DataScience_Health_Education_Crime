

/*
	The Function calculates number of childs with the given underweight stage (0/1/2)

	Value label information for underweight:
	Value = 0.0	Label = not underweight
	Value = 1.0	Label = moderately underweight
	Value = 2.0	Label = severely underweight
*/

CREATE or ALTER FUNCTION Func_UnderWeight(@UnderWeight_stage int)  
RETURNS int   
AS   
BEGIN  
    DECLARE @child_cnt int;  
    SELECT @child_cnt = count(distinct childid)
    FROM t_antro_info
    WHERE underweight = @UnderWeight_stage
    RETURN @child_cnt;  
END; 
Go

DECLARE @ret nvarchar(15);  
EXEC @ret = dbo.Func_UnderWeight @UnderWeight_stage = 2; 
SELECT N'Result: ' + @ret; 

