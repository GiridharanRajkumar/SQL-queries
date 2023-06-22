#Creting a table bonus
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '17-02-20'),
		(002, 3000, '19-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '15-02-20'),
		(002, 3500, '22-06-11');
#Creting a table title
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

#Query to show worker table
select * from worker

#Query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>
select FIRST_NAME as WORKER_NAME from worker

#Query to fetch unique values of DEPARTMENT f-- rom the Worker table
select distinct department from worker

#Query to print the first four characters of  FIRST_NAME from the Worker table
select substring(FIRST_NAME,1,4) from Worker;

#Query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
Select INSTR(FIRST_NAME, 'a') from Worker
where FIRST_NAME = 'Amitabh'

#Query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
Select RTRIM(FIRST_NAME) from worker

#Query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
Select LTRIM(DEPARTMENT) from Worker;

#Query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
select distinct length(department) from worker

#Query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select replace (first_name, 'a','A') from worker 

#Query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME
select concat(first_name,last_name) as COMPLETE_NAME from worker

#Query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * from Worker order by FIRST_NAME, department desc

#Query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
Select * from Worker where FIRST_NAME not in ('Vipul','Satish')

#Query to print details of Workers with DEPARTMENT name as “Admin”.
Select * from Worker where DEPARTMENT like 'Admin%'

#Query to print details of the Workers whose FIRST_NAME contains ‘a’.
Select * from Worker where FIRST_NAME like '%a'

#Query to print details of the Workers whose SALARY lies between 100000 and 500000.
Select * from Worker where SALARY between 100000 and 500000

#Query to print details of the Workers who joined in Feb’2014.
select * from worker where SALARY= 100000 
and month (joining_date)=2 

#Query to fetch the count of employees working in the department ‘Admin’.
select count(DEPARTMENT) from worker where  DEPARTMENT = 'Admin'

#Query to fetch worker names with salaries >= 50000 and <= 100000
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary FROM worker
WHERE Salary BETWEEN 50000 AND 100000

#Query to fetch the no. of workers for each department in descending order.
SELECT DEPARTMENT, count(WORKER_ID)  No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC

#Query to print details of the Workers who are also Managers
select W.FIRST_NAME, T.WORKER_TITLE
from worker w
inner join title t
ON W.WORKER_ID = T.WORKER_REF_ID
where T.WORKER_TITLE in ('Manager')

#Query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
having count(*) >1

#Query to show only odd rows from a table
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

#Query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0

#Query to show the top n (say 5) records of a table.
SELECT * FROM Worker order by Salary DESC LIMIT 5;

