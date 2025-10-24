CREATE DATABASE IF NOT EXISTS borjamoll;
USE borjamoll;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Teacher;

CREATE TABLE Teacher (
    id INT primary key auto_increment,
    teacherName VARCHAR(250),
    email VARCHAR(250)
);

CREATE TABLE Company (
    id INT primary key auto_increment,
    companyName VARCHAR(250),
    email VARCHAR(250)
);

CREATE TABLE Employee(
    id INT primary key auto_increment,
    employeeName VARCHAR(250),
    email VARCHAR(250),
    company_id INT REFERENCES Company(id)
);

CREATE TABLE Student(
    id INT primary key auto_increment,
    studentName VARCHAR(250),
    surname VARCHAR(250),
    email VARCHAR(250),
    teacher_id INT REFERENCES Teacher(id),
    employee_id INT REFERENCES Employee(id),
    phone_number VARCHAR(15)
);

