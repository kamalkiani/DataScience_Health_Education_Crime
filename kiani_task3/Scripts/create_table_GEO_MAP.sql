
	BEGIN TRY
		DROP TABLE IF EXISTS Geo_Points;   
		create table Geo_Points (
			unid bigint,
			GEO_Point geography,
			PRIMARY KEY (unid)
		);
		INSERT INTO Geo_Points (unid,GEO_Point) 
			SELECT       unid, geography::Point(Latitude, Longitude, 4326)
			FROM         dbo.Manchester_Crimes
			WHERE        (Latitude <> 0) AND (Longitude <> 0)
	END TRY
	BEGIN CATCH
		  SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_STATE() AS ErrorState,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
	GO

