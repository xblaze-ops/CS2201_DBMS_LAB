-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Shubhakar.G
-- USN: 1RUA24SCS0107
-- SECTION: B 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- OUTPUT --
/* 
USER(), Host_Name, MySQL_Version, Current_Date_Time
'root@localhost', 'Lenovo_LOQ_2024', '8.0.42', '2025-10-15 09:33:26'
*/
use  Techsol;
-- OUTPUT 
-- 11:53:27	use Techsol	0 row(s) affected	0.000 sec
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);
-- OUTPUT
-- 11:54:21	CREATE TABLE Employees (     EmployeeID INT PRIMARY KEY AUTO_INCREMENT,     FirstName VARCHAR(50),     LastName VARCHAR(50),     Salary DECIMAL(10, 2),     BirthDate DATE,     HireDate DATE )	0 row(s) affected	0.062 sec


INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');
-- OUTPUT
-- 11:54:45	INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES ('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'), ('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'), ('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'), ('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15')	4 row(s) affected Records: 4  Duplicates: 0  Warnings: 0	0.016 sec


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- OUTPUT
-- 11:55:22	CREATE TABLE Orders (     OrderID INT PRIMARY KEY AUTO_INCREMENT,     OrderDate DATE,     TotalAmount DECIMAL(10, 2),     EmployeeID INT,     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) )	0 row(s) affected	0.047 sec


INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
-- OUTPUT
-- 11:55:47	INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES ('2024-07-15', 250.00, 1), ('2024-08-10', 175.50, 2), ('2024-09-01', 300.00, 3), ('2024-09-10', 450.75, 1), ('2024-08-25', 123.40, 4)	5 row(s) affected Records: 5  Duplicates: 0  Warnings: 0	0.000 sec

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
SELECT * FROM employees;
-- OUTPUT
/*
EmployeeID, FirstName, LastName, Salary, BirthDate, HireDate
1	John	Doe	55000.30	1985-06-15	2010-01-20
2	Jane	Smith	65000.50	1990-08-22	2012-07-10
3	Alice	Johnson	72000.10	1982-11-30	2015-05-25
4	Bob	Brown	48000.90	1978-03-12	2018-09-15
*/

SELECT * FROM orders;
-- Output 
/*
OrderID, OrderDate, TotalAmount, EmployeeID
1	2024-07-15	250.00	1
2	2024-08-10	175.50	2
3	2024-09-01	300.00	3
4	2024-09-10	450.75	1
5	2024-08-25	123.40	4
*/


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT EmployeeID, FirstName, LastName, ROUND(Salary, 0) AS RoundedSalary, BirthDate, HireDate
FROM Employees;

-- Output
/*
EmployeeID, FirstName, LastName, RoundedSalary, BirthDate, HireDate
1	John	Doe	55000	1985-06-15	2010-01-20
2	Jane	Smith	65001	1990-08-22	2012-07-10
3	Alice	Johnson	72000	1982-11-30	2015-05-25
4	Bob	    Brown	48001	1978-03-12	2018-09-15
*/


/* b. Absolute Values: Show absolute values of salaries */
SELECT EmployeeID, FirstName, LastName, ABS(Salary) AS AbsoluteSalary FROM Employees;

-- Output
/*
EmployeeID, FirstName, LastName, AbsoluteSalary
1	John	Doe	55000.30
2	Jane	Smith	65000.50
3	Alice	Johnson	72000.10
4	Bob	    Brown	48000.90
*/


/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT OrderID, CEIL(TotalAmount) AS CeilAmount FROM Orders;

-- Output
/*
OrderID, CeilAmount
1	250
2	176
3	300
4	451
5	124
*/


-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Output
/*
TotalEmployees
4
*/ 


/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(Salary) AS TotalSalaryExpense FROM Employees;

-- Output
/*
TotalSalaryExpense
240001.80
*/


/* c. Average Order Amount: Find average order value */
SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders;

-- Output
/*
AverageOrderAmount
259.930000
*/


/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees;

-- Output
/*
HighestSalary, LowestSalary
72000.10	48000.90
*/

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT EmployeeID, UPPER(FirstName) AS UpperFirstName, UPPER(LastName) AS UpperLastName
FROM Employees;

SELECT EmployeeID, LOWER(FirstName) AS LowerFirstName, LOWER(LastName) AS LowerLastName
FROM Employees;

-- Output: 
/*
EmployeeID, UpperFirstName, UpperLastName
1	JOHN	DOE
2	JANE	SMITH
3	ALICE	JOHNSON
4	BOB	    BROWN

EmployeeID, LowerFirstName, LowerLastName
1	john	doe
2	jane	smith
3	alice	johnson
4	bob	    brown
*/


/* b. Concatenate Names: Create full names */
SELECT EmployeeID, FirstName, LastName, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

-- Output
/*
EmployeeID, FirstName, LastName, FullName
1	        John	     Doe	John Doe
2	        Jane	   Smith	Jane Smith
3	       Alice	 Johnson	Alice Johnson
4	        Bob	      Brown	    Bob Brown
*/


/* c. Extract Substring: Get first 3 characters of first names */
SELECT EmployeeID, FirstName, substr(FirstName, 1, 3) AS First3Characters
FROM Employees;

-- Output
/*
EmployeeID, FirstName, First3Characters
1	          John	    Joh
2	          Jane	    Jan
3	         Alice	    Ali
4	          Bob	    Bob
*/


-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT OrderID, CAST(OrderDate AS DATE) AS OrderDateConverted, TotalAmount, EmployeeID
FROM Orders;

-- Output
/*
OrderID, OrderDateConverted, TotalAmount, EmployeeID
1	2024-07-15	250.00	1
2	2024-08-10	175.50	2
3	2024-09-01	300.00	3
4	2024-09-10	450.75	1
5	2024-08-25	123.40	4
*/


-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW() AS CurrentDateTime;

-- Output
/*
CurrentDateTime
'2025-10-15 11:35:15'
*/


/* b. Extract Year: Get year from order dates */
SELECT OrderID, OrderDate, YEAR(OrderDate) AS OrderYear
FROM Orders;

-- Output
/*
OrderID, OrderDate, OrderYear
1	2024-07-15	2024
2	2024-08-10	2024
3	2024-09-01	2024
4	2024-09-10	2024
5	2024-08-25	2024
*/


/* c. Add Months: Add 3 months to order dates */
SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS OrderDatePlus3Months
FROM Orders;

-- Output
/*
OrderID, OrderDate, OrderDatePlus3Months
1	2024-07-15	2024-10-15
2	2024-08-10	2024-11-10
3	2024-09-01	2024-12-01
4	2024-09-10	2024-12-10
5	2024-08-25	2024-11-25
*/ 


/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, OrderDate, DATEDIFF(NOW(), OrderDate) AS DaysSinceOrder
FROM Orders;

-- Output
/*
OrderID, OrderDate, DaysSinceOrder
1	2024-07-15	457
2	2024-08-10	431
3	2024-09-01	409
4	2024-09-10	400
5	2024-08-25	416
*/
 

-- END of the Task -- d4
