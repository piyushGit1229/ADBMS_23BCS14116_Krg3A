CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Department (DeptID, DeptName) VALUES
    (1, 'Engineering'),
    (2, 'Humanities'),
    (3, 'Business'),
    (4, 'Medicine'),
    (5, 'Law');

INSERT INTO Course VALUES
    (101, 'Data Structures', 1),
    (102, 'Operating Systems', 1),
    (103, 'Computer Networks', 1),
    (104, 'Algorithms', 1),
    (105, 'World History', 2),
    (106, 'Philosophy', 2),
    (107, 'Accounting', 3),
    (108, 'Marketing', 3),
    (109, 'Anatomy', 4),
    (110, 'Physiology', 4),
    (111, 'Constitutional Law', 5),
    (112, 'Criminal Law', 5);

SELECT DeptName
FROM Department
WHERE DeptID IN (
    SELECT DeptID
    FROM Course
    GROUP BY DeptID
    HAVING COUNT(*) > 2
);

CREATE LOGIN Piyushcpp
WITH PASSWORD = 'Piyush2005';

CREATE USER Piyush
FOR LOGIN Piyushcpp;

EXECUTE AS USER = 'Piyush';

GRANT SELECT ON Department TO Piyush;

REVOKE SELECT ON Department FROM Piyush;
