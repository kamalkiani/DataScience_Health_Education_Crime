/*
	this code creates a view and finds the top 10 
	commiting crimes locations in Salford along  
	with the population of each location
*/
CREATE or ALTER view View_Salford AS
	select TOP 10 Manchester_Crimes.[LSOA name], 
	count(*) as crimes_cnt, 
	avg([All Ages]) as population
	from Manchester_Crimes inner join LSOA2018_Code
	on Manchester_Crimes.[LSOA code] = LSOA2018_Code.[LSOA code]
	where Manchester_Crimes.[LSOA name] like '%Salford%'
	group by Manchester_Crimes.[LSOA name]
	order by crimes_cnt DESC

