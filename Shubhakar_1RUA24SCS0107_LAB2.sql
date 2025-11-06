-- ======================================================================
-- Lab Experiment 02 – Implementation of DML Commands in SQL
-- ======================================================================

-- Objective:
-- To implement DML (Data Manipulation Language) commands such as 
-- INSERT, UPDATE, and DELETE using suitable examples.

-- Scenario:
-- You are managing a database for a library with two tables: Books and Members.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS LibraryDB;
-- OUTPUT
-- 18:23:12	DROP DATABASE IF EXISTS LibraryDB	1 row(s) affected	0.078 sec

CREATE DATABASE LibraryDB;
-- OUTPUT
-- 18:23:30	CREATE DATABASE LibraryDB	1 row(s) affected	0.031 sec

USE LibraryDB;
-- OUTPUT
-- 18:24:33	USE LibraryDB	0 row(s) affected	0.000 sec


-- ======================================================================
-- Task 01: Create Tables
-- Create Books and Members tables as per given structure.

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(50),
    published_year YEAR,
    available_copies INT,
    total_copies INT,
    genre VARCHAR(50),
    ISBN VARCHAR(20)
);
-- OUTPUT
-- 18:24:53	CREATE TABLE Books (     book_id INT PRIMARY KEY AUTO_INCREMENT,     title VARCHAR(100),     author VARCHAR(50),     published_year YEAR,     available_copies INT,     total_copies INT,     genre VARCHAR(50),     ISBN VARCHAR(20) )	0 row(s) affected	0.094 sec


CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    membership_date DATE,
    membership_type VARCHAR(20),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(100)
);
-- OUTPUT
-- 18:25:13	CREATE TABLE Members (     member_id INT PRIMARY KEY AUTO_INCREMENT,     first_name VARCHAR(50),     last_name VARCHAR(50),     membership_date DATE,     membership_type VARCHAR(20),     email VARCHAR(100),     phone_number VARCHAR(20),     address VARCHAR(100) )	0 row(s) affected	0.062 sec

-- write the query here to verify the creation
SHOW TABLES;
-- OUTPUT
/*
Tables_in_librarydb
books
members
*/



-- ======================================================================
-- Task 02: Integrity Constraints
-- Ensure that available_copies is always less than or equal to total_copies.

ALTER TABLE Books
ADD CONSTRAINT chk_available_vs_total
CHECK (available_copies <= total_copies);

-- OUTPUT
-- 18:34:07	ALTER TABLE Books ADD CONSTRAINT chk_available_vs_total CHECK (available_copies <= total_copies)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.094 sec


-- ======================================================================
-- Task 03: Insert a New Book
-- Scenario: Insert a record for the new book titled 
-- '1984_The Black Swan' by George Orwell (published in 1949, 4 copies available).
-- WRITE YOUR QUERY BELOW
INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN)
VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Dystopian Fiction', '9780451524935');

-- OUTPUT:
-- 18:37:10	INSERT INTO Books (title, author, published_year, available_copies, total_copies, genre, ISBN) VALUES ('1984_The Black Swan', 'George Orwell', 1949, 4, 4, 'Dystopian Fiction', '9780451524935')	1 row(s) affected	0.000 sec
select * from Books;

-- OUTPUT
/*
book_id, title, author, published_year, available_copies, total_copies, genre, ISBN
1	1984_The Black Swan	George Orwell	1949	4	4	Dystopian Fiction	9780451524935
*/

-- ======================================================================
-- Task 04: Add New Members
-- Scenario:
-- Member 1: David Lee, Membership Date – 2024-04-15, Membership Type – Platinum
-- Member 2: Emma Wilson, Membership Date – 2024-05-22, Membership Type – Silver
-- WRITE YOUR QUERIES BELOW
INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address)
VALUES 
('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '9876543210', '123 Green Street, Bangalore'),
('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '9123456780', '45 Lakeview Road, Bangalore');

-- OUTPUT
-- 18:39:46	INSERT INTO Members (first_name, last_name, membership_date, membership_type, email, phone_number, address) VALUES  ('David', 'Lee', '2024-04-15', 'Platinum', 'david.lee@example.com', '9876543210', '123 Green Street, Bangalore'), ('Emma', 'Wilson', '2024-05-22', 'Silver', 'emma.wilson@example.com', '9123456780', '45 Lakeview Road, Bangalore')	2 row(s) affected Records: 2  Duplicates: 0  Warnings: 0	0.047 sec

SELECT * FROM Members;
-- OUTPUT
/*
member_id, first_name, last_name, membership_date, membership_type, email, phone_number, address
1	David	Lee	2024-04-15	Platinum	david.lee@example.com	9876543210	123 Green Street, Bangalore
2	Emma	Wilson	2024-05-22	Silver	emma.wilson@example.com	9123456780	45 Lakeview Road, Bangalore
*/



-- ======================================================================
-- Task 05: Update Book Details
-- Scenario: The library has acquired 2 additional copies of the book '1984'.
-- Update the record accordingly.
-- WRITE YOUR QUERY BELOW
UPDATE Books
SET total_copies = total_copies + 2, available_copies = available_copies + 2
WHERE book_id=1;
-- OUTPUT
-- 18:43:11	UPDATE Books SET total_copies = total_copies + 2, available_copies = available_copies + 2 WHERE book_id=1	1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0	0.031 sec

SELECT * FROM Books;
-- OUTPUT:
/*
book_id, title, author, published_year, available_copies, total_copies, genre, ISBN
1	1984_The Black Swan	George Orwell	1949	6	6	Dystopian Fiction	9780451524935
*/



-- ======================================================================
-- Task 06: Modify a Member's Information
-- Scenario: Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- WRITE YOUR QUERY BELOW
UPDATE Members
SET membership_type = 'Gold'
WHERE member_id=2;
-- OUTPUT
-- 18:46:32	UPDATE Members SET membership_type = 'Gold' WHERE member_id=2	1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0	0.062 sec

SELECT * FROM Members;
-- OUTPUT:
/*
member_id, first_name, last_name, membership_date, membership_type, email, phone_number, address
1	David	Lee	2024-04-15	Platinum	david.lee@example.com	9876543210	123 Green Street, Bangalore
2	Emma	Wilson	2024-05-22	Gold	emma.wilson@example.com	9123456780	45 Lakeview Road, Bangalore
*/



-- ======================================================================
-- Task 07: Delete a Book Record
-- Scenario: The book '1984_The Black Swan' is no longer available in the library.
-- Remove it from the database.
-- WRITE YOUR QUERY BELOW
DELETE FROM Books
WHERE book_id=1;
-- OUTPUT
-- 18:49:00	DELETE FROM Books WHERE book_id=1	1 row(s) affected	0.032 sec

SELECT * FROM Books;
-- OUTPUT
/* 
book_id, title, author, published_year, available_copies, total_copies, genre, ISBN
NULL  NULL     NULL    NULL    NULL   NULL    NULL      NULL
*/

-- ======================================================================
-- Task 08: Remove a Member
-- Scenario: David Lee has canceled his membership. Remove his record.
-- WRITE YOUR QUERY BELOW
DELETE FROM Members
WHERE member_id = 1;
-- OUTPUT
-- 18:52:02	DELETE FROM Members WHERE member_id = 1	1 row(s) affected	0.032 sec

SELECT * FROM Members;
-- OUTPUT
/*
member_id, first_name, last_name, membership_date, membership_type, email, phone_number, address
2	Emma	Wilson	2024-05-22	Gold	emma.wilson@example.com	9123456780	45 Lakeview Road, Bangalore
*/


-- ======================================================================
-- Extension (Optional)
-- Task: Create a Borrowing table to track which members have borrowed which books.
-- Include foreign keys referencing Books(book_id) and Members(member_id).
-- WRITE YOUR TABLE CREATION QUERY BELOW.
CREATE TABLE Borrowing (
    book_id int,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    member_id int,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- OUTPUT
-- 18:58:56	CREATE TABLE Borrowing (     book_id int,     FOREIGN KEY (book_id) REFERENCES Books(book_id),     member_id int,     FOREIGN KEY (member_id) REFERENCES Members(member_id) )	0 row(s) affected	0.078 sec

DESC Borrowing;
-- OUTPUT
/*
Field, Type, Null, Key, Default, Extra
book_id	int	YES	MUL		
member_id int YES MUL		
*/



-- ======================================================================
-- END OF EXPERIMENT 02
-- ======================================================================
