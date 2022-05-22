
update Manchester_Crimes set  district = 
	(Case
    WHEN [LSOA name] LIKE 'Salford%' THEN 'Salford'
    WHEN [LSOA name] LIKE 'Bolton%' THEN 'Bolton'
	WHEN [LSOA name] LIKE 'Wigan%' THEN 'Wigan'   
    WHEN [LSOA name] LIKE 'Bury%' THEN 'Bury'   
    WHEN [LSOA name] LIKE 'Manchester%' THEN 'Manchester'   
    WHEN [LSOA name] LIKE 'Oldham%' THEN 'Oldham'   
    WHEN [LSOA name] LIKE 'Rochdale%' THEN 'Rochdale'   
    WHEN [LSOA name] LIKE 'Stockport%' THEN 'Stockport'   
    WHEN [LSOA name] LIKE 'Tameside%' THEN 'Tameside'   
	WHEN [LSOA name] LIKE 'Trafford%' THEN 'Trafford'
	WHEN [LSOA name] LIKE 'Blackburn with Darwen%' THEN 'Blackburn with Darwen'
	WHEN [LSOA name] LIKE 'Calderdale%' THEN 'calderdale'
	WHEN [LSOA name] LIKE 'Cheshire East%' THEN 'Cheshire East'
	WHEN [LSOA name] LIKE 'Chorley%' THEN 'Chorley'
	WHEN [LSOA name] LIKE 'High Peak%' THEN 'High Peak'
	WHEN [LSOA name] LIKE 'St. Helens%' THEN 'St. Helens'
	WHEN [LSOA name] LIKE 'Warrington%' THEN 'Warrington'
	WHEN [LSOA name] LIKE 'West Lancashire%' THEN 'West Lancashire'
	WHEN [LSOA name] LIKE 'Rossendale%' THEN 'Rossendale'
	ELSE null
	END)

