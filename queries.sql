USE borjamoll;

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
INSERT INTO Employee (employeeName, email, birthDate, salary, company_id) 
VALUES
('Elena', 'elena@globalia.com', '1990-05-11', 1800.00, 1),
('Pau', 'pau@tui.com', '1987-02-20', 2100.00, 2),
('Rosa', 'rosa@barcelo.com', '1985-10-25', 2000.00, 3),
('Aina', 'aina@barcelo.com', '1992-08-10', 1950.00, 3),
('Jaume', 'jaume@aireuropa.com', '1988-01-27', 2200.00, 4),
('Cristina', 'cristina@melia.es', '1995-03-15', 1750.00, 5),
('Jesus', 'jesus@hotelbeds.com', '1991-12-12', 1900.00, 6),
('Tony Stark', 'tony@stark.com', '1970-05-29', 12000.00, 8),
('Sarah Connor', 'sarah@future.com', '1984-10-10', 4500.00, 1),
('Alice Abernathy', 'alice@umbrella.com', '1986-01-17', 4000.00, 9),
('Oompa Loompa #12', 'oompa12@wonka.com', '2000-08-15', 1200.00, 10),
('Bruce Banner', 'bruce@stark.com', '1969-12-18', 9000.00, 8);

-- 🔹 STUDENTS
INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id, status) 
VALUES
('Marta', 'Llompart', 'marta@cifpfbmoll.eu', '611223344', 3, 3, 'active'),
('Carlos', 'Pérez', 'carlos@cifpfbmoll.eu', '644556677', 1, 5, 'active'),
('Lucia', 'Rey', 'lucia@cifpfbmoll.eu', '699887766', 4, 6, 'inactive'),
('Jordi', 'Mas', 'jordi@cifpfbmoll.eu', NULL, 2, 4, 'active'),
('Paula', 'Garcia', 'paula@cifpfbmoll.eu', '677112233', 6, 2, 'inactive'),
('Maria', 'German', 'MGerman@cipfbmoll.eu', '667896745', 1, 1, 'active'),
('Joan', 'Caminos', NULL, NULL, 2, 2, 'active'),
('Harry', 'Potter', 'harry@hogwarts.com', '611111111', 7, 1, 'active'),
('Luke', 'Skywalker', 'luke@force.com', '622222222', 8, 2, 'active'),
('Morty', 'Smith', 'morty@earth.com', '633333333', 10, 4, 'inactive'),
('Jesse', 'Pinkman', 'jesse@chem.com', '644444444', NULL, 3, 'active'),
('Orco', 'DeMordor', NULL, null, 10, NULL, 'active'),
('Hermione', 'Granger', 'hermione@hogwarts.com', '655555555', NULL, NULL, 'active'),
('Frodo', 'Baggins', 'frodo@shire.com', '677777777', 9, 2, 'inactive');

-- 🔹 HOURS
INSERT INTO Hour (totalHour, student_id) VALUES
(50, 1),
(80, 2),
(60, 3),
(100, 4),
(90, 5),
(120, 6),
(30, 7),
(20, 1),
(35, 2),
(10, 3),
(50, 4),
(15, 5),
(100, 6),
(40, 8),
(25, 9),
(60, 10),
(80, 11),
(55, 12),
(70, 13);



