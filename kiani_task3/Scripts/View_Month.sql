/*
	this code creates a view and counts the Greater Manchester 
	crimes, in each month from 2017 to 2018
*/
CREATE or ALTER view View_Month AS
	with Q1 as(
		select unid, SUBSTRING(Month,6,2) as crime_month
		from Manchester_Crimes
	)
	select crime_month, 
		CASE
			WHEN crime_month =   '01' THEN 'Jan'
			WHEN crime_month =   '02' THEN 'Feb'
			WHEN crime_month =   '03' THEN 'Mar'
			WHEN crime_month =   '04' THEN 'Apr'
			WHEN crime_month =   '05' THEN 'May'
			WHEN crime_month =   '06' THEN 'Jun'
			WHEN crime_month =   '07' THEN 'Jul'
			WHEN crime_month =   '08' THEN 'Aug'
			WHEN crime_month =   '09' THEN 'Sep'
			WHEN crime_month =   '10' THEN 'Oct'
			WHEN crime_month =   '11' THEN 'Nov'
			WHEN crime_month =   '12' THEN 'Dec'
		END AS month_name,
	count(unid) as crimes_cnt
	from Q1
	group By crime_month

