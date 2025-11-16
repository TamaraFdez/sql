CREATE DATABASE IF NOT EXISTS borjamoll;
USE borjamoll;

-- LIMPIEZA
DROP TABLE IF EXISTS Hour;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Teacher;

-- TEACHERS
CREATE TABLE Teacher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacherName VARCHAR(250) NOT NULL,
    email VARCHAR(250),
    department VARCHAR(150),
    salary DECIMAL(10,2)
);

-- COMPANIES
CREATE TABLE Company (
    id INT PRIMARY KEY AUTO_INCREMENT,
    companyName VARCHAR(250) NOT NULL,
    email VARCHAR(250),
    country VARCHAR(250)
);

-- EMPLOYEES
CREATE TABLE Employee(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeName VARCHAR(250) NOT NULL,
    email VARCHAR(250),
    birthDate DATE,
    salary DECIMAL(10,2),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Company(id)
);

-- STUDENTS
CREATE TABLE Student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    studentName VARCHAR(250) NOT NULL,
    surname VARCHAR(250),
    email VARCHAR(250),
    phoneNumber VARCHAR(15),
    teacher_id INT,
    employee_id INT,
    status VARCHAR(50),
    FOREIGN KEY (teacher_id) REFERENCES Teacher(id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);

-- HOURS
CREATE TABLE Hour( 
    id INT PRIMARY KEY AUTO_INCREMENT,
    totalHour INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);


