USE borjamoll;
-- 🔹 POPULATE DATABASE 🔹-- 
-- 🔹 TEACHERS
INSERT INTO Teacher(teacherName, email) 
VALUES
('Borja Moll', 'borja@cifpfbmoll.eu'),
('Laura Serra', 'laura@cifpfbmoll.eu'),
('Antonia', 'antonia@cifpfbmoll.eu'),
('Josep', 'josep@cifpfbmoll.eu'),
('Teresa', 'tresa@cifpfbmoll.eu'),
('Maximo', 'max@cifpfbmoll.eu'),
('Mery Keys', 'mk@borjamoll.cat'),
('Susana Storm', 'ss@borjamoll.cat'),
('Ximo Bay', 'xb@borjamoll.cat');

-- 🔹 COMPANIES
INSERT INTO Company(companyName, email) 
VALUES
('Globalia', 'rrhh@globalia.com'),
('TUI Travel', 'rrhh@tui.com'),
('Barcelo', 'rrhh@barcelo.es'),
('AirEuropa', 'rrhh@aireuropa.com'),
('Melia', 'rh@melia.es'),
('Hotelbeds', 'rh@hotelbeds.eu'),
('IBM', 'ibm@ibm.com'),
('Apple World', 'applefake@tongo.com'),
('Reciclajes PCS', 'reciclajespcs@pcs.com'),
('WEB Consulting', 'webconsulting@consulting.com');

-- 🔹 EMPLOYEES
INSERT INTO Employee (employeeName, email, company_id) 
VALUES
('Elena', 'elena@globalia.com', 5),
('Pau', 'pau@tui.com', 6),
('Rosa', 'rosa@barcelo.com', 1),
('Aina', 'aina@barcelo.com', 1),
('Jaume', 'jaume@aireuropa.com', 2),
('Cristina', 'cristina@malia.es', 3),
('Jesus', 'jesus@hotelbets.com', 4),
('Perpetual Khamid', 'pk@ibm.com', 1),
('Socorro Plasencia', 'sp@tongo.com', 2),
('Juanito Pérez', 'jp@pcs.com', 3),
('Delegado de Legado', 'ddl@consulting.com',4);

-- 🔹 STUDENTS
INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id) 
VALUES
('Marta', 'Llompart', 'marta@cifpfbmoll.eu', '611223344', 3, 3),
('Carlos', 'Pérez', 'carlos@cifpfbmoll.eu', '644556677', 1, 5),
('Lucia', 'Rey', 'lucia@cifpfbmoll.eu', '699887766', 4, 6),
('Jordi', 'Mas', 'jordi@cifpfbmoll.eu', '688999111', 2, 4),
('Paula', 'Garcia', 'paula@cifpfbmoll.eu', '677112233', 6, 2),
('Maria', 'German', 'MGerman@cipfbmoll.eu',"667896745",1,1),
('Joan', 'Caminos','JCaminos@cifpfbmoll.eu',"665434748",2,2),
('Bad', 'Courier', 'bd@borjamoll.cat', '666554433', 1, 1),
('Sonia', 'Irascuni', 'si@borjamoll.cat', '666777888', 1, 1),
('Pep', 'Forani', 'pf@borjamoll.cat', '666778899', 2, 2),
('Maria', 'Corrent', null , '666555444', 3, 3);

-- 🔹 HOURS
INSERT INTO Hour (totalHour, student_id) VALUES
(50, 1),
(80, 2),
(60, 3),
(100, 4),
(90, 5),
(120, 6),
(30, 7),
(5,1),
(12,2),
(11,3),
(18,4);

-- 🔹 CLASS QUERIES 🔹--
-- 🔹 SELECT
SELECT * FROM Company;

-- 🔹 WHERE
SELECT studentName FROM Student WHERE studentName = 'Bad';
SELECT company_id FROM Employee WHERE company_id = 2;

-- 🔹 WHERE WITH ALIAS
SELECT studentName AS Nombre, surname AS Apellido FROM Student WHERE id < 4;

-- 🔹 DISTINCT
SELECT DISTINCT companyName FROM Company;

-- 🔹 DISTINCT WITH JOIN
SELECT DISTINCT t.teacherName, s.studentName
FROM Student s
JOIN Teacher t ON s.teacher_id = t.id;

-- 🔹 AND OR NOT
SELECT * FROM Employee WHERE company_id = 1 AND company_id = 2;
SELECT * FROM Student WHERE teacher_id = 1 AND employee_id = 1;
SELECT * FROM Student WHERE teacher_id = 1 OR teacher_id = 2;
SELECT * FROM Student WHERE NOT teacher_id = 3;

-- 🔹 ORDER BY ASC/DESC
SELECT * FROM Employee ORDER BY company_id DESC;

SELECT studentName AS Nombre, totalHour 
FROM Student s
JOIN Hour h ON s.id=h.student_id
ORDER BY totalHour ASC;

-- 🔹 INSERT
INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id) VALUES ('Roberto', 'Bolaños', 'rb@borjamoll.cat', "666223344", 2, 4);

-- 🔹 UPDATE
UPDATE Student SET email = 'rbolaños@cpifbmoll.eu' WHERE studentName = 'Roberto' AND surname = 'Bolaños';

-- 🔹 DELETE
DELETE FROM Student WHERE studentName = 'Roberto' AND surname = 'Bolaños';

-- 🔹 LIMIT / OFFSET
SELECT surname FROM Student WHERE teacher_id=1 LIMIT 1;

SELECT studentName, surname
FROM Student
LIMIT 5 OFFSET 5;

-- 🔹 MIN MAX AVG COUNT SUM
SELECT MIN(id) FROM Student;
SELECT AVG(totalHour) FROM Hour;
SELECT COUNT(totalHour) AS NumeroDeFilas, 
MIN(totalHour) AS MenosHoras, 
MAX(totalHour) AS MásHoras,
SUM(totalHour) AS SumaTotal,
AVG(totalHour) AS MediaTotal
FROM Hour;

-- 🔹 LIKE
SELECT studentName FROM Student WHERE  studentName LIKE 'P%';
SELECT * FROM Teacher WHERE teacherName LIKE '%m%';
SELECT * FROM Student WHERE email LIKE '%i@%.eu';

-- 🔹 IN
SELECT studentName FROM Student WHERE employee_id IN (2, 3);
SELECT * FROM Company WHERE companyName IN ('Barcelo', 'Melia');

-- 🔹 BETWEEN
SELECT * FROM Student WHERE id NOT BETWEEN 1 AND 2;
SELECT s.studentName AS Nombre, h.totalHour AS Horas FROM Hour h 
JOIN Student s ON h.student_id= s.id
WHERE h.totalHour BETWEEN 50 and 100;

-- 🔹 NULL/ NOT NULL
SELECT studentName, surname
FROM Student
WHERE email IS NULL;

SELECT teacherName, email
FROM Teacher
WHERE email IS NOT NULL;

-- 🔹 EXTRA QUERIES 🔹--
-- 🔹 GROUP BY
SELECT teacher_id, COUNT(*) AS NumAlumnos
FROM Student
GROUP BY teacher_id;

-- 🔹 GROUP BY + HAVING
SELECT s.studentName, SUM(h.totalHour) AS TotalHoras
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.studentName
HAVING SUM(h.totalHour) > 80;

-- 🔹  VIEW
CREATE VIEW VistaAlumnosProfesores AS
SELECT s.studentName, t.teacherName
FROM Student s
JOIN Teacher t ON s.teacher_id=t.id;

SELECT * FROM VistaAlumnosProfesores;

DROP VIEW IF EXISTS VistaAlumnosProfesores;

-- 🔹 CONCAT UPPER() LOWER()
SELECT UPPER(studentName),LOWER(surname), CONCAT(studentName, ' ', surname) AS NombreCompleto 
FROM Student;

-- 🔹 ALTER TABLE - ADD CHANGE MODIFY DELETE
ALTER TABLE Student
ADD dateOfBirth DATE;

ALTER TABLE Student
ADD city VARCHAR(100),
ADD country VARCHAR(100);

ALTER TABLE Student
MODIFY city VARCHAR(20);

ALTER TABLE Student
CHANGE country nation VARCHAR(230);

DESCRIBE Student;

ALTER TABLE Student 
DROP COLUMN dateOfBirth, 
DROP COLUMN city, 
DROP COLUMN nation;

-- 🔹 SUBQUERY
DELETE FROM Student
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Student 
    GROUP BY studentName
);
-- 🔹 COALESCE
SELECT studentName, COALESCE(email, 'email desconocido') AS student_email
FROM Student;

