	/*
		This code, creates a view to find the number of students who do not 
		attend any private classes in English or Math, separated by providence

		Value label information for STPRVMT :
		Value = 88.0	Label = NA
		Value = 1.0	Label = Yes, to excel in class
		Value = 2.0	Label = Yes, to keep up in class
		Value = 3.0	Label = No
		Value = 79.0	Label = Missing

		Value label information for STPRVEN :
		Value = 88.0	Label = NA
		Value = 1.0	Label = Yes, to excel in class
		Value = 2.0	Label = Yes, to keep up in class
		Value = 3.0	Label = No
		Value = 79.0	Label = Missing
	*/
	CREATE or ALTER VIEW View_PrivateClasses AS
	SELECT  
		Case
			WHEN PROVINCE =1 THEN 'Ben Tre'
			WHEN PROVINCE =2 THEN 'Da Nang'
			WHEN PROVINCE =3 THEN 'Hung Yen'   
			WHEN PROVINCE =4 THEN 'Lao Cai'   
			WHEN PROVINCE =5 THEN 'Phu Yen'   
			ELSE 'NA'
		END as PROVINCE, count(distinct t_student.UNIQUEID) as No_Private_Classes
	FROM t_student inner join t_w2 
	on t_student.UNIQUEID = t_w2.UNIQUEID
	where STPRVMT = 3 or STPRVEN = 3
	group by PROVINCE

