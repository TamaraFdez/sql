USE borjamoll;

-- 🔹 TEACHERS
INSERT INTO Teacher(teacherName, email) 
VALUES
('Borja Moll', 'borja@cifpfbmoll.eu'),
('Laura Serra', 'laura@cifpfbmoll.eu'),
('Antonia', 'antonia@cifpfbmoll.eu'),
('Josep', 'josep@cifpfbmoll.eu'),
('Teresa', 'tresa@cifpfbmoll.eu'),
('Maximo', 'max@cifpfbmoll.eu');

-- 🔹 COMPANIES
INSERT INTO Company(companyName, email) 
VALUES
('Globalia', 'rrhh@globalia.com'),
('TUI Travel', 'rrhh@tui.com'),
('Barcelo', 'rrhh@barcelo.es'),
('AirEuropa', 'rrhh@aireuropa.com'),
('Melia', 'rh@melia.es'),
('Hotelbeds', 'rh@hotelbeds.eu');

-- 🔹 EMPLOYEES
INSERT INTO Employee (employeeName, email, company_id) 
VALUES
('Elena', 'elena@globalia.com', 5),
('Pau', 'pau@tui.com', 6),
('Rosa', 'rosa@barcelo.com', 1),
('Aina', 'aina@barcelo.com', 1),
('Jaume', 'jaume@aireuropa.com', 2),
('Cristina', 'cristina@malia.es', 3),
('Jesus', 'jesus@hotelbets.com', 4);

-- 🔹 STUDENTS
INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id) 
VALUES
('Marta', 'Llompart', 'marta@cifpfbmoll.eu', '611223344', 3, 3),
('Carlos', 'Pérez', 'carlos@cifpfbmoll.eu', '644556677', 1, 5),
('Lucia', 'Rey', 'lucia@cifpfbmoll.eu', '699887766', 4, 6),
('Jordi', 'Mas', 'jordi@cifpfbmoll.eu', '688999111', 2, 4),
('Paula', 'Garcia', 'paula@cifpfbmoll.eu', '677112233', 6, 2),
('Maria', 'German', 'MGerman@cipfbmoll.eu',"667896745",1,1),
('Joan', 'Caminos','JCaminos@cifpfbmoll.eu',"665434748",2,2);

-- 🔹 HOURS
INSERT INTO Hour (totalHour, student_id) VALUES
(50, 1),
(80, 2),
(60, 3),
(100, 4),
(90, 5),
(120, 6),
(30, 7);

