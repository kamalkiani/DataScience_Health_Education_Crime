
	/*
	This code creates a view and counts number of males and females based on 
	how often do they use a computer for schoolwork -At home

		Value label information for STCMPHME
		Value = 1.0	Label = Never or almost never
		Value = 2.0	Label = Once or twice a month
		Value = 3.0	Label = Once or twice a week
		Value = 4.0	Label = Every day or almost every day
	*/

	CREATE or ALTER view View_UsingComp as
	select 
		Case
			WHEN STCMPHME =1 THEN 'Never or almost never'
			WHEN STCMPHME =2 THEN 'Once or twice a month'
			WHEN STCMPHME =3 THEN 'Once or twice a week'   
			WHEN STCMPHME =4 THEN 'Every day or almost every day'     
			ELSE 'NA'
		END as Type, 
		Case
			WHEN GENDER =1 THEN 'Male'
			WHEN GENDER =2 THEN 'Female'
			ELSE 'NA'
		END as Gender,
		count(*) as 'Computer for schoolwork at home'
	from t_w2 inner join t_student on t_w2.UNIQUEID =  t_student.UNIQUEID
	where Gender in (1,2) and STCMPHME in(1,2,3,4)
	group by STCMPHME , GENDER

