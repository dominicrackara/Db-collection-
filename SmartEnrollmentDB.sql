
CREATE DATABASE IF NOT EXISTS SmartEnrollment;
USE SmartEnrollment;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, ClassID) VALUES
    ('Jimmy', 'Jammes', '2005-08-15', 'Male', 1),
    ('Opira', 'Cosmas', '2006-04-22', 'Male', 2),
    ('Tabu', 'Jerald', '2005-12-10', 'Male', 1),
    ('Nakato', 'Faith', '2007-02-28', 'Female', 3),
    ('Kilembe', 'Paul', '2006-09-05', 'Male', 2),
    ('Mary', 'Jean', '2007-11-18', 'Female', 1),
    ('Emmy', 'Brown', '2005-06-30', 'Male', 3),
    ('Honest', 'Desire', '2006-08-12', 'Female', 2),
    ('Opilo', 'Joseph', '2005-03-03', 'Male', 1),
    ('Kato', 'Jackson', '2006-01-14', 'Male', 3),
    ('Anne', 'Ruth', '2007-07-21', 'Female', 2);

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    SubjectSpecialization VARCHAR(50) NOT NULL
);

INSERT INTO Teachers (FirstName, LastName, DateOfBirth, Gender, SubjectSpecialization) VALUES
    ('Jerome', 'Cled', '1978-09-10', 'Male', 'Math'),
    ('Fredie', 'Edward', '1982-05-15', 'Male', 'English'),
    ('Nakimera', 'Lucy', '1975-12-03', 'Female', 'Science'),
    ('Orivary', 'Godwin', '1980-02-28', 'Male', 'Social Studies'),
    ('Opobo', 'Paul', '1973-07-15', 'Male', 'History'),
    ('Mary', 'Hope', '1976-11-22', 'Female', 'Math'),
    ('Hobinah', 'Thomas', '1985-04-30', 'Male', 'Physical Education'),
    ('Honest', 'Desire', '1983-08-12', 'Female', 'Arts'),
    ('Opiro', 'Joseph', '1979-03-03', 'Male', 'Music'),
    ('Michael', 'Jackson', '1981-01-14', 'Male', 'Drama'),
    ('Kansimme', 'Ruth', '1977-07-21', 'Female', 'Computer Science');

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(20) NOT NULL,
    ClassTeacherID INT DEFAULT 1,
    FOREIGN KEY (ClassTeacherID) REFERENCES Teachers(TeacherID)
);
INSERT INTO Classes (ClassName, ClassTeacherID) VALUES
    ('YearOne', 1),
    ('YearTwo', 4),
    ('YearThree', 7);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ClassID INT,
    EnrollmentDate DATE DEFAULT NOW() NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
INSERT INTO Enrollments (StudentID, ClassID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3),
    (7, 1),
    (8, 2),
    (9, 3),
    (10, 1);
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentStatus ENUM('Paid', 'Pending') DEFAULT 'Pending' NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Fees (StudentID, CourseID, Amount, PaymentStatus) VALUES
    (1, 1, 500.00, 'Paid'),
    (2, 2, 600.00, 'Pending'),
    (3, 3, 550.00, 'Paid'),
    (4, 1, 500.00, 'Pending'),
    (5, 2, 600.00, 'Paid'),
    (6, 3, 550.00, 'Pending'),
    (7, 1, 500.00, 'Paid'),
    (8, 2, 600.00, 'Pending'),
    (9, 3, 550.00, 'Paid'),
    (10, 1, 500.00, 'Pending');
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY AUTO_INCREMENT,
    SubjectName VARCHAR(50) NOT NULL,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
INSERT INTO Subjects (SubjectName, TeacherID) VALUES
    ('Math', 1),
    ('English', 4), 
    ('Science', 7), 
    ('Social Studies', 2),
    ('History', 5),
    ('Physical Education', 8),
    ('Arts', 3),
    ('Music', 6),
    ('Drama', 9),
    ('Computer Science', 10);
CREATE TABLE Parents (
    ParentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(50) NOT NULL
);
INSERT INTO Parents (FirstName, LastName, Gender, ContactNumber, Email) VALUES
    ('Ceaser', 'Eddy', 'Male', '0771872514', 'ceaser@gmail.com'),
    ('Paul', 'Ocen', 'Male', '0757352946', 'paul@gmail.com'),
    ('Willy', 'Nabasa', 'Male', '0746285629', 'willy@gmail.com'),
    ('Among', 'Faridah', 'Female', '0783748365', 'among@gmail.com'),
    ('Jolly', 'Achen', 'Female', '0703846294', 'jolly@gmail.com'),
    ('Okoye', 'Peter', 'Male', '0746373950', 'okoye@gmail.com'),
    ('Julius', 'Okori', 'Male', '0723759374', 'julius@gmail.com'),
    ('Kakande', 'Walter', 'Male', '0783648264', 'kakande@gmail.com'),
    ('Peter', 'Opiyo', 'Male', '0778863856', 'peter@gmail.com'),
    ('George', 'Aggrey', 'Male', '0763548637', 'george@gmail.com');
CREATE TABLE Results (
ResultsID INT PRIMARY KEY,
StudentID INT,
Grade CHAR(1),
FOREIGN KEY (StudentsID) REFERENCES Students(studentID));
INSERT INTO Results (ResultsID, StudentID, Grade) VALUES
(1,1,'B'),
(2,2,'D'),
(3,7,'C'),
(4,4,'B'),
(5,8,'E'),
(6,6,'F'),
(7,3,'A'),
(8,9,'C'),
(9,5,'B'),
(10,8,'B');



