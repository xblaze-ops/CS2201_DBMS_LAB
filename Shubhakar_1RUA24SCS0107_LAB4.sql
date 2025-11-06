-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
-- OUTPUT
-- 12:11:42	CREATE DATABASE OperatorLab	1 row(s) affected	0.015 sec

USE OperatorLab;
-- OUTPUT
-- 12:12:12	USE OperatorLab	0 row(s) affected	0.000 sec


-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);
-- OUTPUT
-- 12:12:33	CREATE TABLE Employees (     EmployeeID INT PRIMARY KEY,     Name VARCHAR(50),     Age INT,     Salary DECIMAL(10, 2),     Department VARCHAR(50),     HireDate DATE,     Address VARCHAR(100) )	0 row(s) affected	0.046 sec


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- OUTPUT
-- 12:12:55	CREATE TABLE Departments (     DepartmentID INT PRIMARY KEY,     DepartmentName VARCHAR(50),     EmployeeID INT,     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) )	0 row(s) affected	0.047 sec


CREATE TABLE Employee2022 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);
-- OUTPUT
-- 12:13:25	CREATE TABLE Employee2022 (     EmployeeID INT PRIMARY KEY,     Name VARCHAR(50),     Age INT,     Salary DECIMAL(10, 2),     Department VARCHAR(50),     HireDate DATE,     Address VARCHAR(100) )	0 row(s) affected	0.031 sec


CREATE TABLE Employee2023 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);
-- OUTPUT
-- 12:13:55	CREATE TABLE Employee2023 (     EmployeeID INT PRIMARY KEY,     Name VARCHAR(50),     Age INT,     Salary DECIMAL(10, 2),     Department VARCHAR(50),     HireDate DATE,     Address VARCHAR(100) )	0 row(s) affected	0.032 sec



-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');
-- OUTPUT
-- 12:14:07	INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES (1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'), (1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'), (1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'), (1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.015 sec


INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);
-- OUTPUT
-- 12:14:26	INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES (1, 'IT', 1001), (2, 'HR', 1002), (3, 'Finance', 1003)	3 row(s) affected Records: 3  Duplicates: 0  Warnings: 0	0.015 sec


INSERT INTO Employee2022 (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(101, 'Alice', 28, 55000, 'HR', '2020-03-15', 'New York'),
(102, 'Bob', 32, 65000, 'IT', '2018-07-22', 'Chicago'),
(103, 'Charlie', 24, 48000, 'Finance', '2021-11-05', 'Los Angeles'),
(104, 'Diana', 29, 72000, 'IT', '2019-01-10', 'San Francisco'),
(105, 'Ethan', 35, 80000, 'Finance', '2017-05-18', 'New York'),
(106, 'Fiona', 27, 52000, 'HR', '2020-08-25', 'Boston');
-- OUTPUT
-- 12:15:10	INSERT INTO Employee2022 (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES (101, 'Alice', 28, 55000, 'HR', '2020-03-15', 'New York'), (102, 'Bob', 32, 65000, 'IT', '2018-07-22', 'Chicago'), (103, 'Charlie', 24, 48000, 'Finance', '2021-11-05', 'Los Angeles'), (104, 'Diana', 29, 72000, 'IT', '2019-01-10', 'San Francisco'), (105, 'Ethan', 35, 80000, 'Finance', '2017-05-18', 'New York'), (106, 'Fiona', 27, 52000, 'HR', '2020-08-25', 'Boston')	6 row(s) affected Records: 6  Duplicates: 0  Warnings: 0	0.015 sec



INSERT INTO Employee2023 (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(102, 'Bob', 33, 68000, 'IT', '2018-07-22', 'Chicago'),
(104, 'Diana', 30, 75000, 'IT', '2019-01-10', 'San Francisco'),
(105, 'Ethan', 36, 82000, 'Finance', '2017-05-18', 'New York'),
(107, 'Grace', 26, 50000, 'HR', '2022-02-14', 'Seattle'),
(108, 'Henry', 23, 47000, 'Finance', '2023-01-20', 'Austin'),
(109, 'Ivy', 29, 54000, 'IT', '2021-06-30', 'Boston');
-- OUTPUT
-- 12:15:30	INSERT INTO Employee2023 (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES (102, 'Bob', 33, 68000, 'IT', '2018-07-22', 'Chicago'), (104, 'Diana', 30, 75000, 'IT', '2019-01-10', 'San Francisco'), (105, 'Ethan', 36, 82000, 'Finance', '2017-05-18', 'New York'), (107, 'Grace', 26, 50000, 'HR', '2022-02-14', 'Seattle'), (108, 'Henry', 23, 47000, 'Finance', '2023-01-20', 'Austin'), (109, 'Ivy', 29, 54000, 'IT', '2021-06-30', 'Boston')	6 row(s) affected Records: 6  Duplicates: 0  Warnings: 0	0.016 sec



-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
UPDATE Employees
SET Salary = Salary + (Salary * 0.10)
limit 100;


SELECT salary FROM Employees;
-- OUTPUT
/*
salary
60500.00
66000.00
82500.00
88000.00
*/


-- b. Subtract tax (15% of Salary) from each employee's salary.
UPDATE Employees
SET Salary = Salary - (Salary * 0.15)
limit 100;

SELECT salary FROM Employees;
-- OUTPUT
/*
salary
56100.00
74800.00
51425.00
70125.00
*/

-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
SELECT EmployeeID, Name, Salary AS MonthlySalary, (Salary * 12) AS YearlySalary
FROM Employees;
-- OUTPUT
/*
EmployeeID, Name, MonthlySalary, YearlySalary
1001	Ashish	56100.00	673200.00
1002	Binay	74800.00	897600.00
1003	Charlie	51425.00	617100.00
1004	Dhruv	70125.00	841500.00
*/


-- d. Find the remainder when employees' ages are divided by 5.
SELECT EmployeeID, Name, Age, (Age % 5) AS AgeRemainder
FROM Employees;
-- OUTPUT
/*
EmployeeID, Name, Age, AgeRemainder
1001	Ashish	28	3
1002	Binay	45	0
1003	Charlie	32	2
1004	Dhruv	38	3
*/


-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
SELECT EmployeeID, Name, Age, Salary, Department
FROM Employees
WHERE Age > 30 AND Salary > 50000;
-- OUTPUT
/*
EmployeeID, Name, Age, Salary, Department
1002	Binay	45	74800.00	HR
1003	Charlie	32	51425.00	Finance
1004	Dhruv	38	70125.00	HR
*/



-- b. Employees either in 'HR' department OR salary > 70000.
SELECT EmployeeID, Name, Department, Salary
FROM Employees
WHERE Department = 'HR' OR Salary > 70000;
-- OUTPUT
/*
EmployeeID, Name, Department, Salary
1002	Binay	HR	74800.00
1004	Dhruv	HR	70125.00
*/



-- c. Employees who do NOT live in 'New York'.
SELECT EmployeeID, Name, Address
FROM Employees
WHERE Address != '%New York';
-- OUTPUT
/*
EmployeeID, Name, Address
1002	Binay	456 Elm St, Chicago
1003	Charlie	789 Oak St, Los Angeles
*/




-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 56100.
SELECT EmployeeID, Name, Salary, Department
FROM Employees
WHERE Salary = 56100;
-- OUTPUT
/*
EmployeeID, Name, Salary, Department
1001	Ashish	56100.00	IT
*/



-- b. List employees not in the 'IT' department.
SELECT EmployeeID, Name, Department
FROM Employees
WHERE Department != 'IT';
-- OUTPUT
/*
EmployeeID, Name, Department
1002	Binay	HR
1003	Charlie	Finance
1004	Dhruv	HR
*/


-- c. Retrieve employees younger than 45 with salary > 50000.
SELECT EmployeeID, Name, Age, Salary, Department
FROM Employees
WHERE Age < 45 AND Salary > 50000;
--  OUTPUT
/*
EmployeeID, Name, Age, Salary, Department
1001	Ashish	28	56100.00	IT
1003	Charlie	32	51425.00	Finance
1004	Dhruv	38	70125.00	HR
*/



-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
SELECT EmployeeID, Name, Age, Department, Salary
FROM Employees
WHERE Age BETWEEN 25 AND 35;
-- OUTPUT
/*
EmployeeID, Name, Age, Department, Salary
1001	Ashish	28	IT	56100.00
1003	Charlie	32	Finance	51425.00
*/



-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
SELECT EmployeeID, Name, Department, Salary
FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');
-- OUTPUT
/*
EmployeeID, Name, Department, Salary
1001	Ashish	IT	56100.00
1002	Binay	HR	74800.00
1003	Charlie	Finance	51425.00
1004	Dhruv	HR	70125.00
*/



-- c. LIKE → Find employees whose names start with 'A'.
SELECT EmployeeID, Name, Department, Salary
FROM Employees
WHERE Name LIKE 'A%';
-- OUTPUT
/*
EmployeeID, Name, Department, Salary
1001	Ashish	IT	56100.00
*/


-- d. IS NULL → List employees whose address is not available.
SELECT EmployeeID, Name, Address, Department
FROM Employees
WHERE Address IS NULL;
-- OUTPUT
/*
EmployeeID, Name, Address, Department
NULL        NULL   NULL      NULL
*/




-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
SELECT EmployeeID, Name, Department,Salary
FROM Employee2022
WHERE Department = 'HR'
UNION
SELECT EmployeeID, Name, Department, Salary
FROM Employee2023
WHERE Department = 'HR';
-- OUTPUT
/*
EmployeeID, Name, Department, Salary
101	Alice	HR	55000.00
106	Fiona	HR	52000.00
107	Grace	HR	50000.00
*/



-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
SELECT e2022.EmployeeID, e2022.Name, e2022.Department, e2022.Salary
FROM Employee2022 e2022
INNER JOIN Employee2023 e2023
    ON e2022.EmployeeID = e2023.EmployeeID
WHERE e2022.Department = 'IT' 
  AND e2023.Department = 'IT';
-- OUTPUT
/*
EmployeeID, Name, Department, Salary
102	Bob	IT	65000.00
104	Diana	IT	72000.00
*/



-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
SELECT e2023.EmployeeID, e2023.Name, e2023.Department, e2023.Salary
FROM Employee2023 e2023
LEFT JOIN Employee2022 e2022
    ON e2023.EmployeeID = e2022.EmployeeID
WHERE e2022.EmployeeID IS NULL;
-- OUTPUT
/*
EmployeeID, Name, Department, Salary
107	Grace	HR	50000.00
108	Henry	Finance	47000.00
109	Ivy	      IT	54000.00


-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================
