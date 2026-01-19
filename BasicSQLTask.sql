USE EmployeeDB;

-- SELECT 
-- 1.	Select  firstname, lastname, title, age, salary  for everyone in your employee table. 
SELECT FirstName, LastName, Title, Age, Salary
FROM Employee;

-- 2.	Select firstname, age and salary for everyone in your employee table.
SELECT FirstName, Age, Salary
FROM Employee;

-- 3.	Selct firstname and display as 'Name' for everyone in your employee table
SELECT FirstName AS Name
FROM Employee;

-- 4.	Select firstname and lastname as 'Name' for everyone. Use " " (space) to separate firstname and last.
SELECT FirstName + ' ' + LastName AS Name
FROM Employee;

--WHERE

-- 5.	Select all columns for everyone with a salary over  38000. 
SELECT *
FROM Employee
WHERE Salary > 38000;

-- 6.	Select first and last names for everyone that's under  24 years old. 
SELECT FirstName, LastName
FROM Employee
WHERE Age < 24;

-- 7.	Select first name, last name, and salary for anyone with "Programmer" in their title. 
SELECT FirstName, LastName, Salary
FROM Employee
WHERE Title LIKE '%Programmer%';

-- 8.	Select all columns for everyone whose last name contains   "O". 
SELECT *
FROM Employee
WHERE LastName LIKE '%O%';

-- 9.	Select the lastname for everyone whose first name equals "Kelly". 
SELECT LastName
FROM Employee
WHERE FirstName = 'Kelly';

-- 10.	Select all columns for everyone whose last name ends in  "Moore". 
SELECT *
FROM Employee
WHERE LastName LIKE '%Moore';

-- 11.	Select all columns for everyone who are 35 and above.
SELECT * 
FROM Employee
WHERE Age >= 30;


-- MULTIPLE WHERE CONDITIONS

-- 12.	Select firstname ,lastname,age and salary of everyone whose age is above 24 and below 43.
SELECT FirstName, LastName, Age, Salary
FROM Employee
WHERE Age > 24 AND Age < 43;

-- 13.	Select firstname, title and lastname whose age is in the range 28  and 62 and salary greater than 31250
SELECT FirstName, Title, LastName
FROM Employee
WHERE Age BETWEEN 28 AND 62 AND Salary > 31250;

-- 14.	Select all columns for everyone whose age is not more than 48 and salary not less than 21520
SELECT *
FROM Employee
WHERE Age <= 48 AND Salary >= 21520;

-- 15.	Select firstname and age of everyone whose firstname starts with  "John"  and salary in the range 25000 and 35000
SELECT FirstName, Age
FROM Employee
WHERE FirstName LIKE 'John%' AND Salary BETWEEN 25000 AND 35000;

-- Using 'Order By' clause

-- 16.	Select all columns for everyone by their ages in descending order.
SELECT *
FROM Employee
ORDER BY Age DESC;

-- 17.	Select all columns for everyone by their ages in ascending order.
SELECT *
FROM Employee
ORDER BY Age ASC;

-- 18.	Select all columns for everyone by their salaries in descending order.
SELECT *
FROM Employee
ORDER BY Salary DESC;

-- 19.	Select all columns for everyone by their salaries in ascending order.
SELECT *
FROM Employee
ORDER BY Salary ASC;

-- 20.	Select all columns for everyone by their salaries in ascending order whose age not less than 17.
SELECT *
FROM Employee
WHERE Age >= 17
ORDER BY Salary ASC;

-- 21.	Select all columns for everyone by their salaries in descending order whose age not more than 34.
SELECT *
FROM Employee
WHERE Age <= 34
ORDER BY Salary DESC;


-- Miscellaneous( count, sum(), max(), min())

-- 22.	Select all columns for everyone by their length of firstname in ascending order.
SELECT *, LEN(FirstName) AS NameLength
FROM Employee
ORDER BY LEN(FirstName) ASC;

-- 23.	Select the number of employees whose age is above 45
SELECT COUNT(*) AS NOOFEMPLOYEES
FROM Employee
WHERE Age > 45;

-- 24.	Show the results by adding 5 to ages and removing 250 from salaries of all employees
SELECT FirstName, LastName, Title, Age + 5 AS Age, Salary - 250 AS Salary
FROM Employee;

-- 25.	Select the number of employees whose lastname ends with "re" or "ri" or "ks"
SELECT COUNT(*) AS NumEmployees
FROM Employee
WHERE LastName LIKE '%re' OR LastName LIKE '%ri' OR LastName LIKE '%ks';

-- 26.	Select the average salary of all your employees
SELECT AVG(Salary) AS AvgSalary
FROM Employee;

-- 27.	Select the average salary of Freshers
SELECT AVG(Salary) AS AvgSalaryFreshers
FROM Employee
WHERE Title = 'Fresher';

-- 28.	Select the average age of Programmers
SELECT AVG(Age) AS AvgAgeProgrammers
FROM Employee
WHERE Title = 'Programmer';

-- 29.	Select the average salary of employees whose age is not less than 35 and not more than 50
SELECT AVG(Salary) AS AvgSalary35to50
FROM Employee
WHERE Age BETWEEN 35 AND 50;

-- 30.	Select the number of Freshers
SELECT COUNT(*) AS NumFreshers
FROM Employee
WHERE Title = 'Fresher';

-- 31.	What percentage of programmers constitute your employees
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Employee)) AS ProgrammerPercentage
FROM Employee
WHERE Title = 'Programmer';

-- 32.	What is the combined salary that you need to pay to the employees whose age is not less than 40
SELECT SUM(Salary) AS TotalSalary40Plus
FROM Employee
WHERE Age >= 40;

-- 33.	What is the combined salary that you need to pay to all the Freshers and Programmers for 1 month
SELECT SUM(Salary) AS TotalSalaryFreshersProgrammers
FROM Employee
WHERE Title IN ('Fresher', 'Programmer');

-- 34.	What is the combined salary that you need to pay to all the Freshers whose age is greater than 27 for 3years 
SELECT SUM(Salary) * 36 AS TotalSalary3Years
FROM Employee
WHERE Title = 'Fresher' AND Age > 27;

-- Using Sub-Queries  ( and usage of 'in' and 'between')
-- 35.	Select the eldest employee's firstname, lastname and age whose salary is less than 35000
SELECT FirstName, LastName, Age
FROM Employee
WHERE Age = (SELECT MAX(Age) FROM Employee WHERE Salary < 35000);

-- 36.	Who is the youngest General Manager
SELECT FirstName, LastName, Age
FROM Employee
WHERE Title = 'General Manager' 
AND Age = (SELECT MIN(Age) FROM Employee WHERE Title = 'General Manager');

-- 37.	Select the eldest fresher whose salary is less than 35000
SELECT FirstName, LastName, Age
FROM Employee
WHERE Title = 'Fresher'
  AND Age = (SELECT MAX(Age) FROM Employee WHERE Title = 'Fresher' AND Salary < 35000);

-- 38.	Select firstname and age of everyone whose firstname starts with  "John" or "Michael"  and salary in the range 17000 and 26000
SELECT FirstName, Age
FROM Employee
WHERE FirstName IN ('John', 'Michael')
  AND Salary BETWEEN 17000 AND 26000;

-- Using 'Group By' and 'Having' clause
-- 39.	How many employees are having each unique title. Select the title and display the number of employees present in ascending order
SELECT Title, COUNT(*) AS NumEmployees
FROM Employee
GROUP BY Title
ORDER BY NumEmployees ASC;

-- 40.	What is the average salary of each unique title of the employees. Select the title and display the average salary of employees in each
SELECT Title, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Title;

-- 41.	What is the average salary of employees excluding Freshers
SELECT AVG(Salary) AS AvgSalary
FROM Employee
WHERE Title != 'Fresher';

-- 42.	What is the average age of employees of each unique title.
SELECT Title, AVG(Age) AS AvgAge
FROM Employee
GROUP BY Title;

-- 43.	In the age range of  25 to 40 get the number of employees under each unique title.
SELECT Title, COUNT(*) AS NumEmployees
FROM Employee
WHERE Age BETWEEN 25 AND 40
GROUP BY Title;

-- 44.	Show the average salary of each unique title of employees only if the average salary is not less than 25000
SELECT Title, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Title
HAVING AVG(Salary) >= 25000;

-- 45.	Show the sum of ages of each unique title of employee only if the sum of age is greater than 30
SELECT Title, SUM(Age) AS SumAge
FROM Employee
GROUP BY Title
HAVING SUM(Age) > 30;

-- Basic Data Modification
-- Lisa Ray just got married to Michael Moore. She has requested that her last name be updated to Moore. 
UPDATE Employee
SET LastName = 'Moore'
WHERE FirstName = 'Lisa' AND LastName = 'Ray';

-- Ginger Finger's birthday is today, add 1 to his age and a bonus of 5000
UPDATE Employee
SET Age = Age + 1, Salary = Salary + 5000
WHERE FirstName = 'Ginger' AND LastName = 'Finger';

-- All 'Programmer's are now called "Engineer"s. Update all titles accordingly. 
UPDATE Employee
SET Title = 'Engineer'
WHERE Title = 'Programmer';

-- Everyone whose making under 30000 are to receive a 3500 bonus. 
UPDATE Employee
SET Salary = Salary + 3500
WHERE Salary < 30000;

-- Everyone whose making over 35500 are to be deducted 15% of their salaries
UPDATE Employee
SET Salary = Salary * 0.85
WHERE Salary > 35500;