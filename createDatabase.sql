CREATE DATABASE IF NOT EXISTS borjamoll;
USE borjamoll;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Teacher;

CREATE TABLE Teacher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacherName VARCHAR(250),
    email VARCHAR(250)
);

CREATE TABLE Company (
    id INT PRIMARY KEY AUTO_INCREMENT,
    companyName VARCHAR(250),
    email VARCHAR(250)
);

CREATE TABLE Employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeName VARCHAR(250),
    email VARCHAR(250),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Company(id)
);

CREATE TABLE Student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    studentName VARCHAR(250),
    surname VARCHAR(250),
    email VARCHAR(250),
    teacher_id INT,
    employee_id INT,
    phone_number VARCHAR(15),
    FOREIGN KEY (teacher_id) REFERENCES Teacher(id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);

