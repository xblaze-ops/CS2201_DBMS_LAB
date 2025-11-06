-- ======================================================================
-- Lab Experiment – GROUP BY, HAVING, ORDER BY and INDEXING
-- ======================================================================

-- Objective:
-- 1. To understand and apply the SQL GROUP BY clause to group rows based on column values and perform aggregate operations.
-- 2. To explore the HAVING clause for filtering grouped data post aggregation.
-- 3. To use the ORDER BY clause to sort query results in ascending or descending order.
-- 4. To implement Indexing in SQL for improving query performance.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB;
-- OUTPUT
/* 3	4	20:00:33	CREATE DATABASE HospitalDB	1 row(s) affected	0.000 sec */

USE HospitalDB;
-- OUTPUT
/* 3	5	20:00:56	USE HospitalDB	0 row(s) affected	0.000 sec */

-- ======================================================================
-- Step 2: Create Tables
-- Create the relational schema for Patients and Visits.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);
-- OUTPUT
/*
3	6	20:01:10	CREATE TABLE Patients (
     patient_id INT PRIMARY KEY AUTO_INCREMENT,
     patient_name VARCHAR(50),
     age INT,
     gender VARCHAR(10)
 )	0 row(s) affected	0.063 sec
*/

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
-- OUTPUT
/*
3	7	20:01:36	CREATE TABLE Visits (
     visit_id INT PRIMARY KEY AUTO_INCREMENT,
     patient_id INT,
     visit_date DATE,
     doctor_id INT,
     diagnosis VARCHAR(100),
     treatment_cost DECIMAL(10,2),
     FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
 )	0 row(s) affected	0.062 sec */
 
DESC Patients;
-- OUTPUT
/*
Field, Type, Null, Key, Default, Extra
patient_id	int	NO	PRI		auto_increment
patient_name	varchar(50)	YES			
age	int	YES			
gender	varchar(10)	YES	*/

DESC Visits;
-- OUTPUT
/*
Field, Type, Null, Key, Default, Extra
visit_id	int	NO	PRI		auto_increment
patient_id	int	YES	MUL		
visit_date	date	YES			
doctor_id	int	YES			
diagnosis	varchar(100)	YES			
treatment_cost	decimal(10,2)	YES	*/



-- ======================================================================
-- Step 3: Insert Sample Data
-- Insert sample records into both tables.
-- Add at least 5 patients and 8–10 visit records with varying diagnoses and treatment costs.
-- WRITE YOUR QUERIES BELOW
INSERT INTO Patients (patient_name, age, gender)
VALUES
('Aarav Sharma', 25, 'Male'),
('Diya Mehta', 32, 'Female'),
('Rohan Patel', 41, 'Male'),
('Isha Nair', 28, 'Female'),
('Karan Verma', 36, 'Male');
-- OUTPUT
/* 3	3	20:08:27	INSERT INTO Patients (patient_name, age, gender)
 VALUES
 ('Aarav Sharma', 25, 'Male'),
 ('Diya Mehta', 32, 'Female'),
 ('Rohan Patel', 41, 'Male'),
 ('Isha Nair', 28, 'Female'),
 ('Karan Verma', 36, 'Male')	5 row(s) affected
 Records: 5  Duplicates: 0  Warnings: 0	0.062 sec */

INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost)
VALUES
(1, '2025-01-05', 101, 'Fever and Cold', 500.00),
(2, '2025-01-10', 102, 'Migraine', 1200.00),
(3, '2025-01-12', 103, 'Diabetes Checkup', 800.00),
(1, '2025-02-01', 104, 'Allergy', 600.00),
(4, '2025-02-15', 101, 'Sprained Ankle', 1500.00),
(5, '2025-03-03', 105, 'High Blood Pressure', 2000.00),
(2, '2025-03-10', 104, 'Flu', 700.00),
(3, '2025-03-22', 102, 'Back Pain', 950.00),
(4, '2025-04-01', 105, 'Skin Infection', 1100.00),
(1, '2025-04-15', 101, 'Routine Checkup', 400.00);
-- OUTPUT
/*
3	4	20:08:53	INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost)
 VALUES
 (1, '2025-01-05', 101, 'Fever and Cold', 500.00),
 (2, '2025-01-10', 102, 'Migraine', 1200.00),
 (3, '2025-01-12', 103, 'Diabetes Checkup', 800.00),
 (1, '2025-02-01', 104, 'Allergy', 600.00),
 (4, '2025-02-15', 101, 'Sprained Ankle', 1500.00),
 (5, '2025-03-03', 105, 'High Blood Pressure', 2000.00),
 (2, '2025-03-10', 104, 'Flu', 700.00),
 (3, '2025-03-22', 102, 'Back Pain', 950.00),
 (4, '2025-04-01', 105, 'Skin Infection', 1100.00),
 (1, '2025-04-15', 101, 'Routine Checkup', 400.00)	10 row(s) affected
 Records: 10  Duplicates: 0  Warnings: 0	0.015 sec */


SELECT * FROM Patients;
-- OUTPUT:
/*
patient_id, patient_name, age, gender
1	Aarav Sharma	25	Male
2	Diya Mehta	32	Female
3	Rohan Patel	41	Male
4	Isha Nair	28	Female
5	Karan Verma	36	Male */

SELECT * FROM Visits;
-- OUTPUT
/* visit_id, patient_id, visit_date, doctor_id, diagnosis, treatment_cost
1	1	2025-01-05	101	Fever and Cold	500.00
2	2	2025-01-10	102	Migraine	1200.00
3	3	2025-01-12	103	Diabetes Checkup	800.00
4	1	2025-02-01	104	Allergy	600.00
5	4	2025-02-15	101	Sprained Ankle	1500.00
6	5	2025-03-03	105	High Blood Pressure	2000.00
7	2	2025-03-10	104	Flu	700.00
8	3	2025-03-22	102	Back Pain	950.00
9	4	2025-04-01	105	Skin Infection	1100.00
10	1	2025-04-15	101	Routine Checkup	400.00 */



-- ======================================================================
-- QUICK INTRODUCTION (for notes)
-- GROUP BY: Groups rows sharing a value and performs aggregate functions like SUM(), COUNT(), AVG().
-- HAVING: Filters grouped data after aggregation.
-- ORDER BY: Sorts query results (ASC by default, DESC for descending order).
-- INDEXING: Improves query performance by creating a quick lookup on key columns.

-- ======================================================================
-- STUDENT ACTIVITY TASKS
-- ======================================================================

-- Task 1: Grouping Data by Diagnosis
-- Group the data based on diagnosis and calculate the average treatment cost for each diagnosis.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis, AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis;

-- OUTPUT
-- WRITE YOUR OUTPUT BELOW
/* diagnosis, avg_treatment_cost
Fever and Cold	500.000000
Migraine	1200.000000
Diabetes Checkup	800.000000
Allergy	600.000000
Sprained Ankle	1500.000000
High Blood Pressure	2000.000000
Flu	700.000000
Back Pain	950.000000
Skin Infection	1100.000000
Routine Checkup	400.000000 */


-- ======================================================================
-- Task 2: Filtering with HAVING Clause
-- Filter the grouped data to show only diagnoses where the average treatment cost is greater than 200.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis, AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;

-- OUTPUT
-- WRITE YOUR OUTPUT BELOW
/* diagnosis, avg_treatment_cost
Fever and Cold	500.000000
Migraine	1200.000000
Diabetes Checkup	800.000000
Allergy	600.000000
Sprained Ankle	1500.000000
High Blood Pressure	2000.000000
Flu	700.000000
Back Pain	950.000000
Skin Infection	1100.000000
Routine Checkup	400.000000 */


-- ======================================================================
-- Task 3: Sorting the Results
-- Sort the results from Task 1 in descending order of average treatment cost.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis, AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_treatment_cost DESC;


-- OUTPUT
-- WRITE YOUR OUTPUT BELOW
/* diagnosis, avg_treatment_cost
High Blood Pressure	2000.000000
Sprained Ankle	1500.000000
Migraine	1200.000000
Skin Infection	1100.000000
Back Pain	950.000000
Diabetes Checkup	800.000000
Flu	700.000000
Allergy	600.000000
Fever and Cold	500.000000
Routine Checkup	400.000000 */


-- ======================================================================
-- Task 4: Optimizing with Indexes
-- Create an index on the patient_id column in the Visits table to improve performance.
-- Then run a query that retrieves all visits for a particular patient.
-- WRITE YOUR QUERIES BELOW
CREATE INDEX idx_patient_id ON Visits(patient_id);
-- OUTPUT
/* 3	5	20:24:06	CREATE INDEX idx_patient_id ON Visits(patient_id)	0 row(s) affected
 Records: 0  Duplicates: 0  Warnings: 0	0.078 sec */

SHOW INDEX FROM Visits;
-- OUTPUT
-- (Verify index creation using SHOW INDEX FROM Visits;)
-- WRITE YOUR OUTPUT BELOW
/* Table, Non_unique, Key_name, Seq_in_index, Column_name, Collation, Cardinality, Sub_part, Packed, Null, Index_type, Comment, Index_comment, Visible, Expression
visits	0	PRIMARY	1	visit_id	A	10				BTREE			YES	
visits	1	idx_patient_id	1	patient_id	A	5			YES	BTREE			YES	*/


-- ======================================================================
-- END OF EXPERIMENT
-- ======================================================================
