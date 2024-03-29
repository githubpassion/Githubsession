
Use SP_ETL ;


Truncate Table CUSTOMER_SRC
Truncate Table CUSTOMER_TRG

--Check Data in source and target table
SELECT * FROM CUSTOMER_SRC ;
SELECT * FROM CUSTOMER_TRG ;



 


--Insert data in Source Table CUSTOMER_SRC

INSERT INTO [DBO].CUSTOMER_SRC ([FULLNAME],[BIRTHDATE],[MARITALSTATUS],[GENDER])
     VALUES
           ('John D','1987-11-08 16:46:54.480','S','M')
GO
INSERT INTO [DBO].CUSTOMER_SRC ([FULLNAME],[BIRTHDATE],[MARITALSTATUS],[GENDER])
     VALUES
           ('Amit K','1999-12-03 16:46:54.480','S','M')
GO

INSERT INTO [DBO].CUSTOMER_SRC ([FULLNAME],[BIRTHDATE],[MARITALSTATUS],[GENDER])
     VALUES
           ('Ronald R','1897-01-23 16:46:54.480','S','M')
GO

INSERT INTO [DBO].CUSTOMER_SRC ([FULLNAME],[BIRTHDATE],[MARITALSTATUS],[GENDER])
     VALUES
           ('Pooja D','1974-11-07 16:46:54.480','S','M')
GO

INSERT INTO [DBO].CUSTOMER_SRC ([FULLNAME],[BIRTHDATE],[MARITALSTATUS],[GENDER])
     VALUES
           ('Elon L','1994-11-04 16:46:54.480','S','M')
GO


INSERT INTO [DBO].CUSTOMER_SRC ([FULLNAME],[BIRTHDATE],[MARITALSTATUS],[GENDER])
     VALUES
           ('Rohit','1994-11-04 16:46:54.480','M','M')
GO



--Check Data in source and target table
SELECT * FROM CUSTOMER_SRC ;
SELECT * FROM CUSTOMER_TRG ;


-- ETL CODE
EXEC SP_ETL_CODE; 



Update CUSTOMER_SRC SET FULLNAME = 'chet i'
Where CUSTOMERID = 1;


Update CUSTOMER_SRC SET BIRTHDATE = '1988-12-03 16:46:54.480'
Where CUSTOMERID = 2;

Update CUSTOMER_SRC SET GENDER = 'F'
Where CUSTOMERID = 2;

Update CUSTOMER_SRC SET MARITALSTATUS = 'M'
Where CUSTOMERID = 4;








--records Display
SELECT CUSTOMERID,FULLNAME,BIRTHDATE, MARITALSTATUS, GENDER FROM CUSTOMER_SRC
--Except --Minus
SELECT CUSTOMERID,FULLNAME,BIRTHDATE, MARITALSTATUS, GENDER FROM CUSTOMER_TRG;

--records Display
SELECT CUSTOMERID,FULLNAME,BIRTHDATE, MARITALSTATUS, GENDER FROM  CUSTOMER_TRG 
Except --Minus
SELECT CUSTOMERID,FULLNAME,BIRTHDATE, MARITALSTATUS, GENDER FROM CUSTOMER_SRC;



 
 --To find Latest Row in Target 

SELECT 
	CUSTOMERID,FULLNAME,BIRTHDATE, MARITALSTATUS, GENDER
FROM 
	CUSTOMER_SRC

Except

SELECT
	CUSTOMERID,
	FULLNAME,
	BIRTHDATE,
	MARITALSTATUS,
	GENDER
FROM
	CUSTOMER_TRG
Where
	CUSTOMERKEY in (
	Select
		MAX(CUSTOMERKEY)
	From
		CUSTOMER_TRG
	Group By
		CUSTOMERID );



--Check Data in source and target table
SELECT * FROM CUSTOMER_SRC ;
SELECT * FROM CUSTOMER_TRG ;


--Compare data with Joins

Select * from CUSTOMER_TRG T
right Join CUSTOMER_SRC S on S.CUSTOMERID = T.CUSTOMERID
Where   T.CUSTOMERKEY in (
	Select
		MAX(T.CUSTOMERKEY)
	From
		CUSTOMER_TRG T
	Group By
		T.CUSTOMERID ) and S.FULLNAME <> T.FULLNAME ; 

	