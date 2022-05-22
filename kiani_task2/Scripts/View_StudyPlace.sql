/*
	This code creates a view to calculate the number and percentage of students 
	in each ETHNICITY who have study place and basic study facilities

*/

CREATE or ALTER VIEW View_StudyPlace AS
with Q1 as (
SELECT 	
	Case
		WHEN ETHNICITY =1 THEN 'Kinh'
		WHEN ETHNICITY =2 THEN 'H Mong'
		WHEN ETHNICITY =3 THEN 'Cham-HRoi'   
		WHEN ETHNICITY =4 THEN 'Ede'   
		WHEN ETHNICITY =5 THEN 'Ba Na'   
		WHEN ETHNICITY =6 THEN 'Nung'   
		WHEN ETHNICITY =7 THEN 'Tay'   
		WHEN ETHNICITY =8 THEN 'Dao'   
		WHEN ETHNICITY =9 THEN 'Giay'   
		WHEN ETHNICITY =10 THEN 'Other'
		WHEN ETHNICITY =99 THEN 'Missing'
		WHEN ETHNICITY =88 THEN 'NA'
		ELSE 'NA'
	END as ETHNICITY_Label, ETHNICITY, count(*) as Total
FROM t_student 
group by ETHNICITY 
),
Q2 as (
	SELECT ETHNICITY, count(*) as StudyPlace_and_Facilities
	FROM t_student inner join t_educatin_fac 
	on t_student.UNIQUEID = t_educatin_fac.UNIQUEID
	where STPLSTDY=1 and STHVDESK=1 and STHVCHR=1
	group by ETHNICITY 
)

select ETHNICITY_Label, Total, StudyPlace_and_Facilities, 
		Round (CAST(StudyPlace_and_Facilities AS DECIMAL(7,2)) / CAST(Total AS DECIMAL(7,2)) *100 , 2 ) as [percent]
from Q1 inner join Q2 on Q1.ETHNICITY = Q2.ETHNICITY