-- SELECT AS WHERE <
SELECT studentName AS Nombre, surname AS Apellido FROM Student WHERE id < 4;

-- DISCTINCT JOIN 
SELECT DISTINCT t.teacherName, s.studentName
FROM Student s
JOIN Teacher t ON s.teacher_id = t.id;

-- AND OR NOT
SELECT * FROM Student WHERE teacher_id = 1 AND employee_id = 1;
SELECT * FROM Student WHERE teacher_id = 1 OR teacher_id = 2;
SELECT * FROM Student WHERE NOT teacher_id = 3;

-- ORDER BY JOIN
 SELECT studentName AS Nombre, totalHour 
 FROM Student s
 JOIN Hour h ON s.id=h.student_id
 ORDER BY totalHour ASC;

-- MIN MAX COUNT SUM AVG
SELECT COUNT(totalHour) AS NumeroDeFilas, 
MIN(totalHour) AS MenosHoras, 
MAX(totalHour) AS MásHoras,
SUM(totalHour) AS SumaTotal,
AVG(totalHour) AS MediaTotal
FROM Hour;

-- LIKE
SELECT * FROM Teacher WHERE teacherName LIKE '%m%';
SELECT * FROM Student WHERE email LIKE '%i@%.eu';

-- IN
SELECT * FROM Company WHERE companyName IN ('Barcelo', 'Melia');

-- BETWEEN
SELECT s.studentName AS Nombre, h.totalHour AS Horas FROM Hour h 
JOIN Student s ON h.student_id= s.id
WHERE h.totalHour BETWEEN 50 and 100;





