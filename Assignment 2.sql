/*database testing system*/
DROP DATABASE IF EXISTS testing_system;

CREATE DATABASE IF NOT EXISTS testing_system;

USE testing_system;
-- create table
DROP TABLE IF EXISTS department;
-- Table 1
CREATE TABLE department (
DepartmentID TINYINT PRIMARY KEY AUTO_INCREMENT,
DepartmentName VARCHAR(50) NOT NULL UNIQUE
);
-- Table 2
CREATE TABLE position (
PositionID TINYINT PRIMARY KEY AUTO_INCREMENT,
PositiontName ENUM('Dev', 'Test', 'SCrum Master', 'PM')
);
-- Table 3
CREATE TABLE `account` (
AccountID INT PRIMARY KEY AUTO_INCREMENT,
Email VARCHAR(50) NOT NULL UNIQUE,
Usename VARCHAR(50) NOT NULL UNIQUE,
Fullname VARCHAR(100),
DepartmentID TINYINT,
PositionID TINYINT,
CreateDate date,
CONSTRAINT FOREIGN KEY (DepartmentID) REFERENCES department(DepartmentID),
CONSTRAINT FOREIGN KEY (PositionID) REFERENCES `position`(PositionID)
);
-- Table 4
CREATE TABLE `group` (
GroupID INT PRIMARY KEY AUTO_INCREMENT,
GroupName VARCHAR(100) NOT NULL UNIQUE,
CreatorID INT,
CreateDate DATE
);
-- Table 5
CREATE TABLE groupaccount(
GroupID INT,
AccountID INT,
JoinDate date,
CONSTRAINT FOREIGN KEY (GroupID) REFERENCES `group`(GroupID),
CONSTRAINT FOREIGN KEY (AccountID) REFERENCES `account`(AccountID)
);
-- Table 6
CREATE TABLE typequestion(
TypeID INT PRIMARY KEY AUTO_INCREMENT,
Typename ENUM ('Essay', 'Multiple-Choice')
);
-- Table 7
CREATE TABLE categoryquestion(
CategoryID INT AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR(20) NOT NULL
);
-- Table 8
CREATE TABLE question(
QuestionID INT PRIMARY KEY AUTO_INCREMENT,
Content  VARCHAR(500) NOT NULL,
CategoryID INT NOT NULL,
TypeID INT NOT NULL,
CreatorID INT NOT NULL,
CreateDate DATE,
CONSTRAINT FOREIGN KEY (TypeID) REFERENCES typequestion(TypeID),
CONSTRAINT FOREIGN KEY (CategoryID) REFERENCES categoryquestion(CategoryID)
);
-- Table 9
CREATE TABLE answer(
AnswerID INT PRIMARY KEY AUTO_INCREMENT,
Content VARCHAR(300) NOT NULL,
QuestionID INT NOT NULL,
isCorrect ENUM ('True', 'False'),
CONSTRAINT FOREIGN KEY (QuestionID) REFERENCES question(QuestionID)
);
-- Table 10
CREATE TABLE exam(
ExamID INT PRIMARY KEY AUTO_INCREMENT,
`Code` VARCHAR(10) NOT NULL,
Title VARCHAR(100) NOT NULL,
CategoryID INT NOT NULL,
Duration TIME NOT NULL,
CreatorID INT NOT NULL,
CreateDate DATE NOT NULL,
CONSTRAINT FOREIGN KEY (CategoryID) REFERENCES categoryquestion(CategoryID)
);
-- Table 11
CREATE TABLE examquestion(
ExamID INT NOT NULL,
QuestionID INT NOT NULL,
CONSTRAINT FOREIGN KEY (ExamID) REFERENCES exam(ExamID),
CONSTRAINT FOREIGN KEY (QuestionID) REFERENCES question(QuestionID)
);
