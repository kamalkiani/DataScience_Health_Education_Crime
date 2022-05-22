
	/*
		Vehicle crimes in manchester and related GEO location
	*/

	CREATE or ALTER VIEW QGIS_VehicleCrimes as
		select Manchester_Crimes.unid, [Crime type], Latitude, Longitude, GEO_Point
		from Manchester_Crimes inner join Geo_Points
		on Manchester_Crimes.unid = Geo_Points.unid
		where [Crime type]='Vehicle crime'

