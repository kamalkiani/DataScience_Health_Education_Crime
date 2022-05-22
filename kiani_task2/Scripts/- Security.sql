
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kamal') DROP USER kamal

 /* new user */
CREATE USER kamal 
FOR LOGIN myNewLogin;  
GO 

/* allowed for user */
GRANT SELECT, INSERT 
ON t_student
TO kamal;

/* not allowed for user */
REVOKE DELETE, UPDATE 
ON t_student
FROM kamal;

