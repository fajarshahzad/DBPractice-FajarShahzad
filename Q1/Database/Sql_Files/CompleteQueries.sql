--Database
Create Database Internship
Use Internship
--Table creation
Create table DEPARTMENT_TABLE
(
dp_id int primary key,
dp_name varchar(20),
dp_location varchar(15)
);

Create table SALARY_GRADE
(
grade int primary key,
min_salary int,
max_salary int
);

Create table EMPLOYEE_TABLE
(
emp_id int primary key,
emp_name varchar(15),
job_name varchar(10),
manager_id int,
hire_date date,
salary decimal(10,2),
commission decimal(7,2),
dep_id int
FOREIGN KEY (dep_id) REFERENCES DEPARTMENT_TABLE(dp_id)
);

--Data insertion
Insert  into DEPARTMENT_TABLE(dp_id,dp_name,dp_location)
values (1001,'FINANCE','SYDENY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');

Insert into SALARY_GRADE(grade,min_salary,max_salary)
Values(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,9999);

Insert into       
EMPLOYEE_TABLE(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission, dep_id)
values (68319,'KYLIN','PRESIDENT',null,'1991-11-18',6000.00,null,1001),
(66928,'BLAZE','MANAGER',68319,'1991-5-01',2750.00,null,3001),
(67832,'CLARE','MANAGER',68319,'1991-06-09',2550.00,null,1001),
(65646,'JONAS','MANAGER',68319,'1991-04-02',2957.00,null,2001),
(67858,'SCARLET','ANALYST',65646,'1991-04-19',3100.00,null,2001),
(69062,'FRANK','ANALYST',65646,'1991-12-03',3100.00,null,2001),
(63679,'SANDRINE','CLERK',69602,'1990-12-18',900.00,null,2001),
(64989,'ADELYN','SALESMAN',66928,'1990-02-20',1700.00,400.00,3001),
(65271,'WADE','SALESMAN',66928,'1991-02-21',1350.00,600.00,3001),
(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001),
(68454,'TRUCKER','SALESMAN',66928,'1991-09-08',1600.00,0.00,3001),
(68736,'ADNERS','CLERK',67858,'1997-05-23',1200.00,null,2001),
(69000,'JULIUS','CLERK',66928,'1991-12-03',1050.00,null,3001),
(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,null,1001);

-- Query-1
SELECT * FROM EMPLOYEE_TABLE;
-- Query-2
SELECT salary AS Salary_Sum FROM EMPLOYEE_TABLE; 
-- Query-3
SELECT DISTINCT job_name FROM EMPLOYEE_TABLE;
-- Query-4
SELECT emp_name,salary *0.25 AS salary_in_dollars 
FROM EMPLOYEE_TABLE;
-- Query-5
SELECT Concat(emp_name,' & ',job_name) AS "Employee Name & Job Name" 
FROM EMPLOYEE_TABLE;
-- Query-6
SELECT Concat(emp_name, '(', job_name, ')') AS Employee 
FROM EMPLOYEE_TABLE;
-- Query-7
SELECT emp_id,emp_name,salary, FORMAT(hire_date, 'yyyy-MM-dd')AS hire_date
FROM EMPLOYEE_TABLE WHERE hire_date = 'February 22, 1991';
-- Query-8
SELECT emp_name,LEN(REPLACE(emp_name, ' ', '')) AS name_length 
FROM EMPLOYEE_TABLE;
-- Query-9
SELECT emp_id,salary,commission 
FROM EMPLOYEE_TABLE;
-- Query-10
SELECT dep_id,job_name 
FROM EMPLOYEE_TABLE Order by dep_id;
-- Query-11
SELECT * 
FROM EMPLOYEE_TABLE WHERE dep_id<>2001;
-- Query-12
SELECT * 
FROM EMPLOYEE_TABLE WHERE hire_date<'1991-01-01';
-- Query-13
SELECT AVG(salary) AS average_of_salary 
FROM EMPLOYEE_TABLE WHERE job_name='ANALYST';
-- Query-14
SELECT * 
FROM EMPLOYEE_TABLE WHERE emp_name='BLAZE';
-- Query-15
SELECT * 
FROM EMPLOYEE_TABLE WHERE commission>salary;
-- Query-16
SELECT * 
FROM EMPLOYEE_TABLE WHERE salary*0.25>3000;
-- Query 17
SELECT emp_name 
FROM EMPLOYEE_TABLE WHERE LEN(emp_name) = 6;
-- Query 18
SELECT *
From EMPLOYEE_TABLE WHERE MONTH(hire_date) = 1;
-- Query 19
SELECT CONCAT(emp_name, ' works for ', manager_id) as Relationship 
FROM EMPLOYEE_TABLE;
-- Query 20
SELECT *
FROM EMPLOYEE_TABLE WHERE job_name = 'Clerk';
-- Query 21
SELECT * FROM EMPLOYEE_TABLE 
WHERE DATEDIFF(DAY, hire_date,GETDATE()) / 365 > 27;
-- Query 22
SELECT * 
FROM EMPLOYEE_TABLE WHERE salary < 3500;
-- Query 23
SELECT emp_name, job_name, salary 
FROM EMPLOYEE_TABLE WHERE job_name = 'ANALYST';
-- Query 24
SELECT * 
FROM EMPLOYEE_TABLE WHERE YEAR(hire_date) = 1991;
-- Query 25
SELECT emp_id, emp_name, hire_date, salary 
FROM EMPLOYEE_TABLE WHERE hire_date < '1991-04-01';
-- Query 26
SELECT e.emp_name,e.job_name FROM EMPLOYEE_TABLE as e 
Left Join EMPLOYEE_TABLE as m on e.manager_id = m.emp_id 
WHERE e.manager_id IS NULL;
-- Query 27
SELECT *
FROM EMPLOYEE_TABLE WHERE hire_date = '1991-05-01';
-- Query 28
SELECT emp_id, emp_name, salary, DATEDIFF(YEAR, hire_date,GETDATE()) AS Experience 
FROM EMPLOYEE_TABLE WHERE manager_id = 68319;
-- Query 29
SELECT emp_id, emp_name, salary, DATEDIFF(YEAR, hire_date,GETDATE()) AS Experience 
FROM  EMPLOYEE_TABLE WHERE  salary > 100;
-- Query 30
SELECT emp_name 
FROM EMPLOYEE_TABLE 
WHERE DATEADD(YEAR, 8, hire_date) > '1999-12-31';
-- Query 31
SELECT * FROM EMPLOYEE_TABLE WHERE salary % 2 <> 0;
-- Query 32
SELECT * FROM EMPLOYEE_TABLE 
WHERE LEN(salary) = 3;
-- Query 33
SELECT * FROM EMPLOYEE_TABLE 
WHERE MONTH(hire_date) = 4;
-- Query-34
SELECT * FROM EMPLOYEE_TABLE
WHERE DAY(hire_date) < 19;
-- Query-35
SELECT * FROM EMPLOYEE_TABLE
WHERE job_name = 'SALESMAN' 
AND DATEDIFF(MONTH, hire_date, GETDATE()) > 10;
-- Query-36
SELECT * FROM EMPLOYEE_TABLE
WHERE (dep_id = 3001 OR dep_id = 1001)
AND YEAR(hire_date) = 1991;
-- Query-37
SELECT * FROM EMPLOYEE_TABLE
WHERE dep_id IN (1001, 2001);
-- Query-38
SELECT * FROM EMPLOYEE_TABLE
WHERE job_name = 'CLERK' AND dep_id = 2001;
-- Query-39
SELECT emp_id, emp_name, salary, job_name FROM EMPLOYEE_TABLE
WHERE (commission IS NOT NULL AND commission <= salary) 
AND (salary + COALESCE(commission, 0) * 12) < 34000
AND job_name = 'SALESMAN' AND dep_id = 3001;
-- Query-40
SELECT * FROM EMPLOYEE_TABLE
WHERE job_name IN ('CLERK', 'MANAGER');
-- Query-41
SELECT * FROM EMPLOYEE_TABLE
WHERE MONTH(hire_date) != 2;
-- Query-42
SELECT * FROM EMPLOYEE_TABLE
WHERE YEAR(hire_date) = 1991;
-- Query-43
SELECT * FROM EMPLOYEE_TABLE
WHERE YEAR(hire_date) = 1991 AND MONTH(hire_date) = 6;
-- Query-44
SELECT * FROM EMPLOYEE_TABLE
WHERE (salary * 12 + COALESCE(commission, 0)) BETWEEN 24000 AND 50000;
-- Query-45
SELECT * FROM EMPLOYEE_TABLE
WHERE hire_date IN ('1991-05-01', '1991-02-20', '1991-12-03');
-- Query-46
SELECT * FROM EMPLOYEE_TABLE
WHERE manager_id IN (63679, 68319, 66564, 69000);
-- Query-47
SELECT * FROM EMPLOYEE_TABLE
WHERE YEAR(hire_date) = 1991 AND hire_date > '1991-06-30';
-- Query-48
SELECT * FROM EMPLOYEE_TABLE
WHERE hire_date >= '1990-01-01' AND hire_date < '2000-01-01';
-- Query-49
SELECT * FROM EMPLOYEE_TABLE
WHERE job_name = 'MANAGER' AND dep_id IN (1001, 2001);
-- Query-50
SELECT * FROM EMPLOYEE_TABLE
WHERE MONTH(hire_date) = 2 AND salary BETWEEN 1001 AND 2000;