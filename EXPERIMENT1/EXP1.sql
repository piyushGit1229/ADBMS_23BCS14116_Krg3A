-- Experiment 1 (a)

CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE TBL_Author (
    author_id INT PRIMARY KEY,
    DEPARTMENT OF  
    COMPUTER SCIENCE & ENGINEERING  
    author_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE TBL_Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES TBL_Author(author_id)
);

INSERT INTO TBL_Author (author_id, author_name, country) VALUES
(1, 'Agatha Christie', 'United Kingdom'),
(2, 'Mark Twain', 'United States'),
(3, 'Paulo Coelho', 'Brazil');

INSERT INTO TBL_Book (book_id, title, author_id) VALUES
(201, 'Murder on the Orient Express', 1),
(202, 'Adventures of Tom Sawyer', 2),
(203, 'The Alchemist', 3);

SELECT 
    B.title AS Book_Title,
    A.author_name AS Author_Name,
    A.country AS Author_Country
FROM 
    TBL_Book B
INNER JOIN 
    TBL_Author A ON B.author_id = A.author_id;



-- Experiment 1 (b)

CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE TBL_Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE TBL_Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES TBL_Department(dept_id)
);

INSERT INTO TBL_Department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Mathematics');

INSERT INTO TBL_Course (course_id, course_name, dept_id) VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'DBMS', 1),
(104, 'Thermodynamics', 2),
(105, 'Fluid Mechanics', 2),
(106, 'Circuit Theory', 3),
(107, 'Power Systems', 3),
(108, 'Structural Analysis', 4),
(109, 'Linear Algebra', 5),
(110, 'Calculus', 5);

CREATE USER 'piyush123'@'localhost' IDENTIFIED BY 'piyush1229';
GRANT SELECT ON UniversityDB.TBL_Course TO 'user123'@'localhost';

SELECT dept_name
FROM TBL_Department
WHERE dept_id IN (
    SELECT dept_id
    FROM TBL_Course
    GROUP BY dept_id
    HAVING COUNT(course_id) > 2
);
