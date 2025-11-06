-- Created by DBMS TEAM
-- Date: [14 August 2024 ]
-- Description: SQL script to create a simple university course management system database, 
--              including the creation, alteration, and deletion of tables.

-- Step 1: Create a new database
CREATE DATABASE db_lab;
-- OUTPUT
-- 11:57:00	CREATE DATABASE db_lab	1 row(s) affected	0.016 sec

-- Step 2: Use the newly created database
USE db_lab;
-- OUTPUT
-- 11:57:28	USE db_lab	0 row(s) affected	0.000 sec

-- Step 3: Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,             -- Unique identifier for each student
    FirstName VARCHAR(50),                 -- First name of the student
    LastName VARCHAR(50),                  -- Last name of the student
    Email VARCHAR(100) UNIQUE,             -- Email of the student, must be unique
    DateOfBirth DATE                       -- Date of birth of the student
);
-- OUTPUT
-- 11:58:26	CREATE TABLE Students (     StudentID INT PRIMARY KEY,             -- Unique identifier for each student     FirstName VARCHAR(50),                 -- First name of the student     LastName VARCHAR(50),                  -- Last name of the student     Email VARCHAR(100) UNIQUE,             -- Email of the student, must be unique     DateOfBirth DATE                       -- Date of birth of the student )	0 row(s) affected	0.046 sec


-- Step 4: Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,              -- Unique identifier for each course
    CourseName VARCHAR(100),               -- Name of the course
    Credits INT                            -- Number of credits for the course
);
-- OUTPUT
-- 11:58:50	CREATE TABLE Courses (     CourseID INT PRIMARY KEY,              -- Unique identifier for each course     CourseName VARCHAR(100),               -- Name of the course     Credits INT                            -- Number of credits for the course )	0 row(s) affected	0.031 sec


-- Step 5: Create the Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,          -- Unique identifier for each enrollment
    StudentID INT,                         -- Foreign key referencing Students(StudentID)
    CourseID INT,                          -- Foreign key referencing Courses(CourseID)
    EnrollmentDate DATE,                   -- Date when the student enrolled in the course
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- OUTPUT
-- 11:59:12	CREATE TABLE Enrollments (     EnrollmentID INT PRIMARY KEY,          -- Unique identifier for each enrollment     StudentID INT,                         -- Foreign key referencing Students(StudentID)     CourseID INT,                          -- Foreign key referencing Courses(CourseID)     EnrollmentDate DATE,                   -- Date when the student enrolled in the course     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) )	0 row(s) affected	0.062 sec


-- Step 6: Select all records from the Enrollments table
SELECT * FROM Enrollments;

-- Step 7: Select all records from the Students table
SELECT * FROM Students;

-- Step 8: Select all records from the Courses table
SELECT * FROM Courses;

-- Step 9: Alter the Students table to add a PhoneNumber column
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);               -- Add a new column for storing phone numbers
DESC Students;
-- OUTPUT
-- 11:59:39	ALTER TABLE Students ADD PhoneNumber VARCHAR(15)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.110 sec

-- OUTPUT
/*
StudentID	int	NO	PRI		
FirstName	varchar(50)	YES			
LastName	varchar(50)	YES			
Email	varchar(100)	YES	UNI		
DateOfBirth	date	YES			
*/

-- Step 10: Alter the Courses table to modify the Credits column
ALTER TABLE Courses
MODIFY Credits DECIMAL(3, 1);              -- Modify the Credits column to allow decimal values
DESC Courses;
-- OUTPUT
-- 12:00:05	ALTER TABLE Courses MODIFY Credits DECIMAL(3, 1)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.047 sec

-- OUTPUT
/*
CourseID	int	NO	PRI		
CourseName	varchar(100)	YES			
Credits	decimal(3,1)	YES			
*/

-- Step 11: Alter the Enrollments table to add a unique constraint
ALTER TABLE Enrollments
ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID);  -- Ensure unique student-course combinations
-- OUTPUT
-- 12:00:48	ALTER TABLE Enrollments ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.047 sec

DESC Enrollments;
-- OUTPUT
/*
EnrollmentID	int	NO	PRI		
StudentID	int	YES	MUL		
CourseID	int	YES	MUL		
EnrollmentDate	date	YES			
*/

-- Step 12: Drop the Enrollments table
DROP TABLE Enrollments;                    -- Delete the Enrollments table
-- OUTPUT 
-- 12:01:26	DROP TABLE Enrollments	0 row(s) affected	0.031 sec


-- Step 13: Drop the Courses table
DROP TABLE Courses;                        -- Delete the Courses table
-- OUTPUT
-- 12:02:03	DROP TABLE Courses	0 row(s) affected	0.031 sec
