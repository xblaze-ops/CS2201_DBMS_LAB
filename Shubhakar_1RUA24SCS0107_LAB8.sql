-- ======================================================================
-- Lab Experiment – Implementation of Triggers in SQL
-- ======================================================================

-- Objective:
-- 1. To understand and create triggers in MySQL.
-- 2. To implement BEFORE and AFTER triggers for INSERT, UPDATE, and DELETE operations.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
-- OUTPUT
/* 3	53	19:07:45	CREATE DATABASE SchoolDB	1 row(s) affected	0.047 sec */

USE SchoolDB;
-- OUTPUT
/* 3	54	19:11:24	USE SchoolDB	0 row(s) affected	0.000 sec */

-- ======================================================================
-- Step 2: Create Tables
-- Create a Students table and a Logs table to record trigger actions.

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50),
    Age INT,
    Marks DECIMAL(5,2)
);
-- OUTPUT
/*
3	55	19:11:37	CREATE TABLE Students (
     StudentID INT PRIMARY KEY AUTO_INCREMENT,
     StudentName VARCHAR(50),
     Age INT,
     Marks DECIMAL(5,2)
 )	0 row(s) affected	0.063 sec
 */
CREATE TABLE StudentLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    ActionType VARCHAR(50),
    ActionDate DATETIME,
    Description VARCHAR(200)
);
-- OUTPUT
/*
3	56	19:12:02	CREATE TABLE StudentLogs (
     LogID INT PRIMARY KEY AUTO_INCREMENT,
     ActionType VARCHAR(50),
     ActionDate DATETIME,
     Description VARCHAR(200)
 )	0 row(s) affected	0.063 sec
 */
DESC Students;
-- OUTPUT:
/*
Field, Type, Null, Key, Default, Extra
StudentName	varchar(50)	YES			
StudentID	int	NO	PRI		auto_increment
Marks	decimal(5,2)	YES			
Age	int	YES			
*/

DESC StudentLogs;
-- OUTPUT
/*
Field, Type, Null, Key, Default, Extra
LogID	int	NO	PRI		auto_increment
ActionType	varchar(50)	YES			
ActionDate	datetime	YES			
Description	varchar(200)	YES			
*/



-- ======================================================================
-- Task 1: BEFORE INSERT Trigger
-- Create a trigger to ensure that no student can be inserted with Marks greater than 100.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW
DELIMITER //

CREATE TRIGGER before_student_insert
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    IF NEW.Marks > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks cannot be greater than 100.';
    END IF;
END //

DELIMITER ;

-- OUTPUT
/*
3	59	19:15:29	CREATE TRIGGER before_student_insert
 BEFORE INSERT ON Students
 FOR EACH ROW
 BEGIN
     IF NEW.Marks > 100 THEN
         SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Marks cannot be greater than 100.';
     END IF;
 END	0 row(s) affected	0.016 sec
 */

INSERT INTO Students (StudentName, Age, Marks) VALUES ('Diya', 19, 110);
-- OUTPUT
/*  0	60	19:16:06	INSERT INTO Students (StudentName, Age, Marks) VALUES ('Diya', 19, 110)	Error Code: 1644. Marks cannot be greater than 100.	0.047 sec */


-- ======================================================================
-- Task 2: AFTER INSERT Trigger
-- Create a trigger that inserts a log entry into StudentLogs whenever a new student is added.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW
DELIMITER //

CREATE TRIGGER after_student_insert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLogs (ActionType, ActionDate, Description)
    VALUES (
        'INSERT',
        NOW(),
        CONCAT('New student added: ', NEW.StudentName, ', Marks: ', NEW.Marks)
    );
END //

DELIMITER ;

-- OUTPUT
/* 3	62	19:18:30	CREATE TRIGGER after_student_insert
 AFTER INSERT ON Students
 FOR EACH ROW
 BEGIN
     INSERT INTO StudentLogs (ActionType, ActionDate, Description)
     VALUES (
         'INSERT',
         NOW(),
         CONCAT('New student added: ', NEW.StudentName, ', Marks: ', NEW.Marks)
     );
 END	0 row(s) affected	0.031 sec
 */

INSERT INTO Students (StudentName, Age, Marks) VALUES ('Riya', 17, 89);
SELECT * FROM StudentLogs;
-- (Insert a valid record and check StudentLogs for entries)
-- WRITE YOUR OUTPUT BELOW
/*
LogID, ActionType, ActionDate, Description
1	INSERT	2025-10-30 19:19:07	New student added: Riya, Marks: 89.00
*/


-- ======================================================================
-- Task 3: AFTER UPDATE Trigger
-- Create a trigger that logs any update made to a student’s marks.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW
DELIMITER //

CREATE TRIGGER after_student_update
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    -- Check if marks were actually changed
    IF NEW.Marks <> OLD.Marks THEN
        INSERT INTO StudentLogs (ActionType, ActionDate, Description)
        VALUES (
            'UPDATE',
            NOW(),
            CONCAT('Marks updated for ', NEW.StudentName,
                   ': Old Marks = ', OLD.Marks,
                   ', New Marks = ', NEW.Marks)
        );
    END IF;
END //

DELIMITER ;
-- OUTPUT
/*
3	65	19:20:52	CREATE TRIGGER after_student_update
 AFTER UPDATE ON Students
 FOR EACH ROW
 BEGIN
     -- Check if marks were actually changed
     IF NEW.Marks <> OLD.Marks THEN
         INSERT INTO StudentLogs (ActionType, ActionDate, Description)
         VALUES (
             'UPDATE',
             NOW(),
             CONCAT('Marks updated for ', NEW.StudentName,
                    ': Old Marks = ', OLD.Marks,
                    ', New Marks = ', NEW.Marks)
         );
     END IF;
 END	0 row(s) affected	0.016 sec */

UPDATE Students
SET Marks = 92
WHERE StudentID = 1;

SELECT * FROM StudentLogs;
-- OUTPUT:
-- (Update marks of a student and verify the StudentLogs table)
-- WRITE YOUR OUTPUT BELOW
/*
LogID, ActionType, ActionDate, Description
1	INSERT	2025-10-30 19:19:07	New student added: Riya, Marks: 89.00
2	UPDATE	2025-10-30 19:21:37	Marks updated for Diya: Old Marks = 90.00, New Marks = 92.00 */



-- ======================================================================
-- Task 4: AFTER DELETE Trigger
-- Create a trigger that logs when a student record is deleted.
-- WRITE YOUR TRIGGER CREATION QUERY BELOW
DELIMITER //

CREATE TRIGGER after_student_delete
AFTER DELETE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLogs (ActionType, ActionDate, Description)
    VALUES (
        'DELETE',
        NOW(),
        CONCAT('Student deleted: ', OLD.StudentName, ', Marks: ', OLD.Marks)
    );
END //

DELIMITER ;

-- OUTPUT
/*
3	68	19:23:26	CREATE TRIGGER after_student_delete
 AFTER DELETE ON Students
 FOR EACH ROW
 BEGIN
     INSERT INTO StudentLogs (ActionType, ActionDate, Description)
     VALUES (
         'DELETE',
         NOW(),
         CONCAT('Student deleted: ', OLD.StudentName, ', Marks: ', OLD.Marks)
     );
 END	0 row(s) affected	0.032 sec */


DELETE FROM Students WHERE StudentID = 1;

SELECT * FROM StudentLogs;
-- (Delete a student and check StudentLogs for the corresponding entry)
-- WRITE YOUR OUTPUT BELOW
/*
LogID, ActionType, ActionDate, Description
1	INSERT	2025-10-30 19:19:07	New student added: Riya, Marks: 89.00
2	UPDATE	2025-10-30 19:21:37	Marks updated for Diya: Old Marks = 90.00, New Marks = 92.00
3	DELETE	2025-10-30 19:24:28	Student deleted: Diya, Marks: 92.00
*/

-- ======================================================================
-- END OF EXPERIMENT – Implementation of Triggers
-- ======================================================================
