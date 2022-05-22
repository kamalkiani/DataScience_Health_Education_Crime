
	IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kamal') DROP USER kamal

	 /* new user */
	CREATE USER kamal 
	FOR LOGIN myNewLogin;  
	GO 

	/* allowed for user */
	GRANT SELECT, INSERT 
	ON Manchester_Crimes
	TO kamal;

	/* not allowed for user */
	REVOKE DELETE, UPDATE 
	ON Manchester_Crimes
	FROM kamal;

