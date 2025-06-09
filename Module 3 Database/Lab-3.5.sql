-- Step 1: Create Database
CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;

-- Step 2: Create Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    class_id INT NOT NULL,
    total_score INT NOT NULL
);

-- Step 3: Insert Data
INSERT INTO Students (first_name, last_name, age, class_id, total_score)
VALUES
    ('Harsh', 'Sujith', 15, 10, 450),
    ('Sakshi', 'Rajput', 16, 11, 320),
    ('Deepak', 'Sharma', 17, 10, 275),
    ('Deepika', 'Kumar', 17, 12, 380),
    ('Pari', 'Prakash', 15, 10, 500);

-- Step 4: Retrieve All Records
SELECT * FROM Students;

-- Step 5: Calculate Average Score
SELECT AVG(total_score) AS average_score FROM Students;

-- Step 6: Update Data
UPDATE Students SET total_score = 10 WHERE student_id = 1;
UPDATE Students SET age = age + 1 WHERE class_id = 10;

-- Step 7: Delete Data
DELETE FROM Students WHERE student_id = 3;
DELETE FROM Students WHERE total_score < 300;

-- Step 8: View Final Records
SELECT * FROM Students;