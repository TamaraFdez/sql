-- SELECT AS WHERE < - Selecionamos columnas, As - le ponemos alias , Where - condicion
SELECT studentName AS Nombre, surname AS Apellido FROM Student WHERE id < 4;

-- DISCTINCT JOIN - Nombres sin repetir de estudiantes
SELECT DISTINCT t.teacherName, s.studentName
FROM Student s
JOIN Teacher t ON s.teacher_id = t.id;

-- AND OR NOT - condiciones AND ambas or o una o la otra
SELECT * FROM Student WHERE teacher_id = 1 AND employee_id = 1;
SELECT * FROM Student WHERE teacher_id = 1 OR teacher_id = 2;
SELECT * FROM Student WHERE NOT teacher_id = 3;

--ORDER BY - Agrupa filas que tienen el mismo valor en una o varias columnas
 SELECT studentName AS Nombre, totalHour 
 FROM Student s
 JOIN Hour h ON s.id=h.student_id
 ORDER BY totalHour ASC;

-- MIN-minimo MAX-maximo COUNT-cuenta filas SUM-suma valores AVG-calcula la media
SELECT COUNT(totalHour) AS NumeroDeFilas, 
MIN(totalHour) AS MenosHoras, 
MAX(totalHour) AS MásHoras,
SUM(totalHour) AS SumaTotal,
AVG(totalHour) AS MediaTotal
FROM Hour;

-- LIKE - Para buscar coincidencias segun el nombre del profesor que contenga M sin ser la ultima ni la primera y en email, si tiene una I con un @ y acaba en .eu indemendientemente de lo que tenga delante y entremedias.
SELECT * FROM Teacher WHERE teacherName LIKE '%m%';
SELECT * FROM Student WHERE email LIKE '%i@%.eu';

-- IN
SELECT * FROM Company WHERE companyName IN ('Barcelo', 'Melia');

-- BETWEEN
SELECT s.studentName AS Nombre, h.totalHour AS Horas FROM Hour h 
JOIN Student s ON h.student_id= s.id
WHERE h.totalHour BETWEEN 50 and 100;

-- HAVING agrupa columnas en vez de filas
SELECT s.studentName, SUM(h.totalHour) AS TotalHoras
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.studentName
HAVING SUM(h.totalHour) > 80;

-- GROUP BY
SELECT teacher_id, COUNT(*) AS NumAlumnos
FROM Student
GROUP BY teacher_id;
-- HAVING COUNT(*) > 1; solo enseña los que tengan +1, si esto enseña todo el numero de alumbnos de todos

-- UPDATE
UPDATE Student SET phoneNumber = '66000660'
WHERE studentName = 'Pablo';

-- VIEW
CREATE VIEW VistaAlumnosProfesores AS
SELECT s.studentName, t.teacherName
FROM Student s
JOIN Teacher t ON s.teacher_id=t.id;

SELECT * FROM VistaAlumnosProfesores;

DROP VIEW IF EXISTS VistaAlumnosProfesores;

-- CONCAT UPPER() LOWER()
SELECT UPPER(studentName),LOWER(surname), CONCAT(studentName, ' ', surname) AS NombreCompleto 
FROM Student;

-- ALTER TABLE - ADD CHANGE MODIFY DELETE
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

DELETE FROM Student
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Student 
    GROUP BY studentName
);
