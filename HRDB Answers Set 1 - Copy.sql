SELECT * FROM HRDB.COUNTRIES;

SELECT * FROM HRDB.DEPARTMENTS;

SELECT * FROM HRDB.EMPLOYEES;

SELECT * FROM HRDB.JOBS;

SELECT * FROM HRDB.JOB_HISTORY;

SELECT * FROM HRDB.LOCATIONS;

SELECT * FROM HRDB.REGIONS;


-- 1) Display employees having salary is equal to 7000.

select * from HRDB.EMPLOYEES where salary = '7000';   --in (7000, 17000);

--2)Display employees having salary less than 2400 and hiring year greater than 2005.

Select * from HRDB.EMPLOYEES where salary < 2400 AND  TO_CHAR(HIRE_DATE, 'yyyy') > ('2005') ;

--DD.MM.YYYY HH:MM:SS


-- 3) Display all employees in IT or Accounting department.

SELECT * FROM EMPLOYEES
JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
Where DEPARTMENTS.DEPARTMENT_NAME = 'IT' OR DEPARTMENTS.DEPARTMENT_NAME = 'Accounting';

-- 4) How to display employees whose salary between 1500 and 2500 without using between operator?

select * from HRDB.EMPLOYEES where salary >=1500 AND salary <= 2500;

--select * from HRDB.EMPLOYEES where salary between 1500 AND 2500;



-- 5) Display employees whose COMMISION_PCT is other than 0.10.

select * from HRDB.EMPLOYEES where COMMISSION_PCT not in (0.10); -- this will not display null values


Select * from HRDB.EMPLOYEES
Where employee_id not in (select employee_id from HRDB.EMPLOYEES where COMMISSION_PCT in (0.10));



-- 6) Delete employees from department Purchasing and salary less than 2500.

DELETE from HRDB.EMPLOYEES where DEPARTMENT_ID=30 AND salary < 2500;



-- 7) Display first name last name and salary of employee who is having max salary.

select first_name, last_name, salary from HRDB.EMPLOYEES WHERE salary = (select max(salary) from HRDB.EMPLOYEES);

-- 8)What is the Query to fetch last record from the employees table?

select * from (select * from HRDB.EMPLOYEES order by rownum desc) where rownum<=1;

--9) What is the Query to fetch first record from Employee table?

select HRDB.employees.*, rownum  from HRDB.EMPLOYEES where rownum=1;

--10) What is Query to display last 5 Records from Employee table?

select * from (select HRDB.employees.* from HRDB.EMPLOYEES ORDER BY ROWNUM desc) where ROWNUM <=5;

-- 11) Display Odd rows in Employee table

select * from (select HRDB.EMPLOYEES.*, ROWNUM as rno from HRDB.EMPLOYEES) where MOD(rno,2)=1;

-- 12)Display Even rows in Employee table

select * from (select HRDB.EMPLOYEES.*, ROWNUM as rno from HRDB.EMPLOYEES) where MOD(rno,2)=0;

-- 13) Display total count of Employees

select DISTINCT count(*) from HRDB.EMPLOYEES;

-- 14 )Display department Wise total count of Employees.
 

SELECT COUNT(*), DEPARTMENTS.DEPARTMENT_NAME FROM HRDB.EMPLOYEES
JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
GROUP BY DEPARTMENTS.DEPARTMENT_NAME ;


-- 15) Display region Wise total count of Employees.


SELECT 
DISTINCT COUNT(*), REGIONS.REGION_NAME 
FROM HRDB.EMPLOYEES
LEFT JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
LEFT JOIN LOCATIONS ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
LEFT JOIN COUNTRIES ON COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID
LEFT JOIN REGIONS ON REGIONS.REGION_ID = COUNTRIES.REGION_ID
GROUP BY REGIONS.REGION_NAME;





