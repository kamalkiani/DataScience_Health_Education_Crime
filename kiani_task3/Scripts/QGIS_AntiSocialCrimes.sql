
	/*
		Anti-social behaviour crimes in Salford and related GEO location	
	*/

	CREATE or ALTER VIEW QGIS_AntiSocialCrimes as
		select Manchester_Crimes.unid, [Crime type], district, Latitude, Longitude, GEO_Point
		from Manchester_Crimes inner join Geo_Points
		on Manchester_Crimes.unid = Geo_Points.unid
		where [Crime type]= 'Anti-social behaviour' and district LIKE '%Salford%'

