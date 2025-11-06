-- ======================================================================
-- Lab Experiment – Implementation of Procedures in SQL
-- ======================================================================

-- Objective:
-- 1. To understand and create stored procedures in MySQL.
-- 2. To implement procedures for performing INSERT, UPDATE, and DELETE operations.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
-- OUTPUT
/* 3	36	18:43:32	CREATE DATABASE CompanyDB	1 row(s) affected	0.032 sec */
USE CompanyDB;
-- OUTPUT
/* 3	37	18:43:37	USE CompanyDB	0 row(s) affected	0.000 sec */

-- ======================================================================
-- Step 2: Create Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- OUTPUT:
/*
3	4	12:35:41	CREATE TABLE Employees (
     EmpID INT PRIMARY KEY AUTO_INCREMENT,
     EmpName VARCHAR(50),
     Department VARCHAR(50),
     Salary DECIMAL(10,2)
 )	0 row(s) affected	0.078 sec
 */



-- ======================================================================
-- Step 3: Insert Sample Data
INSERT INTO Employees (EmpName, Department, Salary) VALUES
('John', 'IT', 55000),
('Alice', 'HR', 48000),
('Bob', 'Finance', 60000);

-- OUTPUT:
/*
3	5	12:36:35	INSERT INTO Employees (EmpName, Department, Salary) VALUES
 ('John', 'IT', 55000),
 ('Alice', 'HR', 48000),
 ('Bob', 'Finance', 60000)	3 row(s) affected
 Records: 3  Duplicates: 0  Warnings: 0	0.047 sec
*/


-- ======================================================================
-- Task 1: Create a Basic Procedure
-- Create a procedure named `DisplayEmployees` that retrieves all records from the Employees table.
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //

CREATE PROCEDURE DisplayEmployees()
BEGIN
    SELECT * FROM Employees;
END //
DELIMITER ;
-- OUTPUT
/*
3	9	12:44:13	CREATE PROCEDURE DisplayEmployees()
 BEGIN
     SELECT * FROM Employees;
 END	0 row(s) affected	0.032 sec
 */

CALL DisplayEmployees();
-- OUPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	48000.00
3	Bob	Finance	60000.00
*/



-- ======================================================================
-- Task 2: Procedure for INSERT Operation
-- Create a procedure named `AddEmployee` that inserts a new employee record.
-- Parameters: (p_name VARCHAR(50), p_dept VARCHAR(50), p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //

CREATE PROCEDURE AddEmployee(IN p_name VARCHAR(50), IN p_dept VARCHAR(50), IN p_salary DECIMAL(10,2))
BEGIN
    INSERT INTO Employees (EmpName, Department, Salary)
    VALUES (p_name, p_dept, p_salary);
END //
DELIMITER ;
-- OUTPUT
/*
3	22	16:16:53	CREATE PROCEDURE AddEmployee(IN p_name VARCHAR(50), IN p_dept VARCHAR(50), IN p_salary DECIMAL(10,2))
 BEGIN
     INSERT INTO Employees (EmpName, Department, Salary)
     VALUES (p_name, p_dept, p_salary);
 END	0 row(s) affected	0.047 sec
 */

CALL AddEmployee('David', 'Marketing', 52000);
-- OUTPUT:
/*
3	23	16:18:05	CALL AddEmployee('David', 'Marketing', 52000)	1 row(s) affected	0.031 sec
*/
SELECT * FROM Employees;
-- OUTPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	50000.00
3	Bob	Finance	60000.00
4	David	Marketing	52000.00
*/

-- ======================================================================
-- Task 3: Procedure for UPDATE Operation
-- Create a procedure named `UpdateSalary` to update an employee’s salary based on EmpID.
-- Parameters: (p_empid INT, p_salary DECIMAL(10,2))
DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN p_empid INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET Salary = p_salary
    WHERE EmpID = p_empid;
END //

DELIMITER ;
-- OUTPUT
/*
3	45	18:59:44	CREATE PROCEDURE UpdateSalary(
     IN p_empid INT,
     IN p_salary DECIMAL(10,2)
 )
 BEGIN
     UPDATE Employees
     SET Salary = p_salary
     WHERE EmpID = p_empid;
 END	0 row(s) affected	0.031 sec
 */

CALL UpdateSalary(2, 50000);
-- OUTPUT:
/*
3	46	19:00:18	CALL UpdateSalary(2, 50000)	1 row(s) affected	0.031 sec */

SELECT * FROM Employees;

-- OUTPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	50000.00
3	Bob	Finance	60000.00
4	David	Marketing	52000.00
*/

-- ======================================================================
-- Task 4: Procedure for DELETE Operation
-- Create a procedure named `RemoveEmployee` to delete an employee record based on EmpID.
-- Parameters: (p_empid INT)
DELIMITER //

CREATE PROCEDURE RemoveEmployee(
    IN p_empid INT
)
BEGIN
    DELETE FROM Employees
    WHERE EmpID = p_empid;
END //

DELIMITER ;
-- OUTPUT
/*
3	49	19:05:33	CREATE PROCEDURE RemoveEmployee(
     IN p_empid INT
 )
 BEGIN
     DELETE FROM Employees
     WHERE EmpID = p_empid;
 END	0 row(s) affected	0.032 sec */

CALL RemoveEmployee(3);
-- OUTPUT
/* 3	50	19:05:59	CALL RemoveEmployee(3)	1 row(s) affected	0.031 sec */

SELECT * FROM Employees;
-- OUTPUT
/*
EmpID, EmpName, Department, Salary
1	John	IT	55000.00
2	Alice	HR	50000.00
4	David	Marketing	52000.00
*/



-- ======================================================================
-- END OF EXPERIMENT – Implementation of Procedures
-- ======================================================================
