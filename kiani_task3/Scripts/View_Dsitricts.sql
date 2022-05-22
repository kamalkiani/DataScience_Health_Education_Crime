
/*
	this code creates a view and counts the crimes 
	in each district of greater manchester along  
	with the population of each district
*/
CREATE or ALTER view View_Dsitricts AS
	select  Manchester_Crimes.district, count(*) as crimes_cnt,	
			LSOA2018_District.[All Ages] as population
	from Manchester_Crimes inner join LSOA2018_District
	on Manchester_Crimes.district = LSOA2018_District.district
	group by Manchester_Crimes.district , LSOA2018_District.[All Ages]

