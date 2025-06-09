-- Step 1: Create Database
CREATE DATABASE BookstoreDBM;
USE BookstoreDBM;

-- Step 2: Create Denormalized Table
CREATE TABLE Denormalized_Books (
    Book_ID INT,
    Book_Title VARCHAR(255),
    Author_Name VARCHAR(255),
    Publisher_Name VARCHAR(255),
    Publisher_Address VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);

-- Step 3: Insert Data
INSERT INTO Denormalized_Books (Book_ID, Book_Title, Author_Name, Publisher_Name, Publisher_Address, Category, Price)
VALUES
    (1, 'Database Design', 'Aryan Gopal', 'TechBooks Inc.', '123 Tech St.', 'Education', 50),
    (2, 'Web Development', 'Jyoti Chirag', 'CodeBooks Ltd.', '456 Code Ave.', 'Programming', 40),
    (3, 'Database Design', 'Aryan Gopal', 'TechBooks Inc.', '123 Tech St.', 'Education', 50);

-- Step 4: Normalize to First Normal Form (1NF)
CREATE TABLE Books_1NF (
    Book_ID INT,
    Book_Title VARCHAR(255),
    Author_Name VARCHAR(255),
    Publisher_Name VARCHAR(255),
    Publisher_Address VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2),
    PRIMARY KEY (Book_ID, Author_Name)
);

INSERT INTO Books_1NF (Book_ID, Book_Title, Author_Name, Publisher_Name, Publisher_Address, Category, Price)
VALUES
    (1, 'Database Design', 'Aryan Gopal', 'TechBooks Inc.', '123 Tech St.', 'Education', 50),
    (1, 'Database Design', 'Jyoti Chirag', 'TechBooks Inc.', '123 Tech St.', 'Education', 50),
    (2, 'Web Development', 'Aryan Gopal', 'CodeBooks Ltd.', '456 Code Ave.', 'Programming', 40);

-- Step 5: Normalize to Second Normal Form (2NF)
CREATE TABLE Books_2NF (
    Book_ID INT PRIMARY KEY,
    Book_Title VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Books_2NF (Book_ID, Book_Title, Category, Price)
VALUES
    (1, 'Database Design', 'Education', 50),
    (2, 'Web Development', 'Programming', 40);

CREATE TABLE Authors_2NF (
    Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Author_Name VARCHAR(255),
    Book_ID INT,
    FOREIGN KEY (Book_ID) REFERENCES Books_2NF(Book_ID)
);

INSERT INTO Authors_2NF (Author_Name, Book_ID)
VALUES
    ('Aryan Gopal', 1),
    ('Jyoti Chirag', 1),
    ('Aryan Gopal', 2);

CREATE TABLE Publishers_2NF (
    Publisher_ID INT AUTO_INCREMENT PRIMARY KEY,
    Publisher_Name VARCHAR(255),
    Publisher_Address VARCHAR(255),
    Book_ID INT,
    FOREIGN KEY (Book_ID) REFERENCES Books_2NF(Book_ID)
);

INSERT INTO Publishers_2NF (Publisher_Name, Publisher_Address, Book_ID)
VALUES
    ('TechBooks Inc.', '123 Tech St.', 1),
    ('CodeBooks Ltd.', '456 Code Ave.', 2);

-- Step 6: Normalize to Third Normal Form (3NF)
CREATE TABLE Books_3NF (
    Book_ID INT PRIMARY KEY,
    Book_Title VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Books_3NF (Book_ID, Book_Title, Category, Price)
VALUES
    (1, 'Database Design', 'Education', 50),
    (2, 'Web Development', 'Programming', 40);

CREATE TABLE Authors_3NF (
    Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Author_Name VARCHAR(255)
);

INSERT INTO Authors_3NF (Author_Name)
VALUES
    ('Aryan Gopal'),
    ('Jyoti Chirag');

CREATE TABLE Book_Authors (
    Book_ID INT,
    Author_ID INT,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books_3NF(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Authors_3NF(Author_ID)
);

INSERT INTO Book_Authors (Book_ID, Author_ID)
VALUES
    (1, 1),
    (1, 2),
    (2, 1);

CREATE TABLE Publishers_3NF (
    Publisher_ID INT AUTO_INCREMENT PRIMARY KEY,
    Publisher_Name VARCHAR(255),
    Publisher_Address VARCHAR(255)
);

INSERT INTO Publishers_3NF (Publisher_Name, Publisher_Address)
VALUES
    ('TechBooks Inc.', '123 Tech St.'),
    ('CodeBooks Ltd.', '456 Code Ave.');

CREATE TABLE Book_Publishers (
    Book_ID INT,
    Publisher_ID INT,
    PRIMARY KEY (Book_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books_3NF(Book_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publishers_3NF(Publisher_ID)
);

INSERT INTO Book_Publishers (Book_ID, Publisher_ID)
VALUES
    (1, 1),
    (2, 2);