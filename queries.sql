USE borjamoll;
-- 🔹 POPULATE DATABASE 🔹-- 
-- 🔹 TEACHERS
INSERT INTO Teacher(teacherName, email, department, salary) 
VALUES
('Borja Moll', 'borja@cifpfbmoll.eu', 'Databases', 3000.00),
('Laura Serra', 'laura@cifpfbmoll.eu', 'Web Development', 2800.00),
('Antonia', 'antonia@cifpfbmoll.eu', 'Programming', 2900.00),
('Josep', 'josep@cifpfbmoll.eu', 'Networks', 3100.00),
('Teresa', 'teresa@cifpfbmoll.eu', 'Design', 2700.00),
('Maximo', 'max@cifpfbmoll.eu', 'Systems', 3200.00),
('Gandalf Stormborn', 'gandalf@anillos.com', 'Magic Arts', 4500.00),
('Master Yoda', 'yoda@starwars.com', 'Philosophy', 5200.00),
('Walter White', 'walter@school.com', 'Chemistry', 3900.00),
('Rick Sanchez', 'rick@school.com', 'Interdimensional Studies', 8000.00);

-- 🔹 COMPANIES
INSERT INTO Company(companyName, email, country) 
VALUES
('Globalia', 'rrhh@globalia.com', 'Spain'),
('TUI Travel', 'rrhh@tui.com', 'Germany'),
('Barcelo', 'rrhh@barcelo.es', 'Spain'),
('AirEuropa', 'rrhh@aireuropa.com', 'Spain'),
('Melia', 'rh@melia.es', 'Spain'),
('Hotelbeds', 'rh@hotelbeds.eu', 'UK'),
('Cyberdyne Systems', 'info@cyberdyne.com', 'USA'),
('Stark Industries', 'contact@stark.com', 'USA'),
('Umbrella Corporation', 'admin@umbrella.com', 'UK'),
('Wonka Factory', 'sweet@wonka.com', 'Germany');

-- 🔹 EMPLOYEES
INSERT INTO Employee (employeeName, email, birthDate, hireDate, salary, company_id) 
VALUES
('Elena', 'elena@globalia.com', '1990-05-11', '2018-06-15', 1800.00, 1),
('Pau', 'pau@tui.com', '1987-02-20', '2016-03-01', 2100.00, 2),
('Rosa', 'rosa@barcelo.com', '1985-10-25', '2015-09-10', 2000.00, 3),
('Aina', 'aina@barcelo.com', '1992-08-10', '2019-01-05', 1950.00, 3),
('Jaume', 'jaume@aireuropa.com', '1988-01-27', '2017-08-20', 2200.00, 4),
('Cristina', 'cristina@melia.es', '1995-03-15', '2020-02-28', 1750.00, 5),
('Jesus', 'jesus@hotelbeds.com', '1991-12-12', '2018-11-11', 1900.00, 6),
('Tony Stark', 'tony@stark.com', '1970-05-29', '2005-04-01', 12000.00, 8),
('Sarah Connor', 'sarah@future.com', '1984-10-10', '2008-07-15', 4500.00, 1),
('Alice Abernathy', 'alice@umbrella.com', '1986-01-17', '2010-05-22', 4000.00, 9),
('Oompa Loompa #12', 'oompa12@wonka.com', '2000-08-15', '2022-09-01', 1200.00, 10),
('Bruce Banner', 'bruce@stark.com', '1969-12-18', '2000-01-10', 9000.00, 8);

-- 🔹 STUDENTS 
INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id, status, enrollmentDate) 
VALUES
('Marta', 'Llompart', 'marta@cifpfbmoll.eu', '611223344', 3, 3, 'active', '2023-09-01'),
('Carlos', 'Pérez', 'carlos@cifpfbmoll.eu', '644556677', 1, 5, 'graduated', '2021-09-01'),
('Lucia', 'Rey', 'lucia@cifpfbmoll.eu', '699887766', 4, 6, 'failed', '2022-01-10'),
('Jordi', 'Mas', 'jordi@cifpfbmoll.eu', '688999111', 2, 4, 'active', '2023-02-15'),
('Paula', 'Garcia', 'paula@cifpfbmoll.eu', '677112233', 6, 2, 'failed', '2020-09-01'),
('Maria', 'German', 'MGerman@cipfbmoll.eu', '667896745', 1, 1, 'graduated', '2019-09-01'),
('Joan', 'Caminos', 'JCaminos@cifpfbmoll.eu', '665434748', 2, 2, 'active', '2023-03-01'),
('Harry', 'Potter', 'harry@hogwarts.com', '611111111', 7, 1, 'active', '2023-09-10'),
('Luke', 'Skywalker', 'luke@force.com', '622222222', 8, 2, 'active', '2022-09-10'),
('Morty', 'Smith', 'morty@earth.com', '633333333', 10, 4, 'failed', '2021-01-05'),
('Jesse', 'Pinkman', 'jesse@chem.com', '644444444', NULL, 3, 'active', '2022-09-20'),
('Hermione', 'Granger', 'hermione@hogwarts.com', '655555555', 1, NULL, 'graduated', '2020-09-15'),
('Orco', 'DeMordor', NULL, NULL, 1, NULL, 'failed', '2021-09-15'),
('Frodo', 'Baggins', 'frodo@shire.com', '677777777', 9, 2, 'failed', '2019-09-01');

-- 🔹 HOURS 
INSERT INTO Hour (totalHour, student_id, dateWorked) VALUES
(50, 1, '2023-09-05'),
(80, 2, '2023-09-06'),
(60, 3, '2023-09-07'),
(100, 4, '2023-09-08'),
(90, 5, '2023-09-09'),
(120, 6, '2023-09-10'),
(30, 7, '2023-09-11'),
(20, 1, '2023-10-01'),
(35, 2, '2023-10-02'),
(10, 3, '2023-10-03'),
(50, 4, '2023-10-04'),
(15, 5, '2023-10-05'),
(15, 11, '2023-10-05'),
(15, 10, '2023-10-05'),
(200, 13, '2023-10-05'),
(100, 6, '2023-10-06');




