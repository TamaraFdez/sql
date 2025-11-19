-- INNER JOIN
SELECT s.studentName, t.teacherName
FROM Student s
INNER JOIN Teacher t ON s.teacher_id = t.id;

-- LEFT JOIN
SELECT s.studentName, e.employeeName
FROM Student s
LEFT JOIN Employee e ON s.employee_id = e.id;

-- RIGHT JOIN
SELECT e.employeeName, s.studentName
FROM Employee e
RIGHT JOIN Student s ON s.employee_id = e.id;

-- CROSS JOIN
SELECT t.teacherName, c.companyName
FROM Teacher t 
CROSS JOIN Company c;

-- FULL JOIN con mariaDB no se puede :C

-- SUBQUERY (Estudiante cuyo profesor gana más que la media)
SELECT studentName 
FROM Student
WHERE teacher_id IN (
    SELECT id FROM Teacher
    WHERE salary > (SELECT AVG(salary) FROM Teacher)
);

-- INTERSECT
SELECT * 
FROM Teacher 
WHERE department = 'Design' 
    INTERSECT
SELECT * 
FROM Teacher 
WHERE salary < 3000;

-- EXCEPT
SELECT teacherName, salary 
FROM Teacher 
EXCEPT 
SELECT * 
FROM Teacher 
WHERE salary < 3000;


ALTER TABLE Student ADD COLUMN result VARCHAR(20);

-- Actualizamos algunos valores
UPDATE Student SET result = 'Aprobado' WHERE id IN (1,2,6);
UPDATE Student SET result = 'Suspenso' WHERE id IN (3,5,10);
UPDATE Student SET result = 'En Curso' WHERE result IS NULL;


-- Todos los estudiantes con su profesor y empleado de empresa
SELECT s.studentName, t.teacherName, e.employeeName
FROM Student s
LEFT JOIN Teacher t ON s.teacher_id = t.id
LEFT JOIN Employee e ON s.employee_id = e.id;

-- Empleados que trababajan en empresas del mismo pais que Stark industries
SELECT employeeName
FROM Employee
WHERE company_id IN (
    SELECT id FROM Company WHERE country = (
        SELECT country FROM Company WHERE companyName = 'Stark Industries'
    )
);

-- Profesores con más de un estudiante
SELECT t.teacherName, COUNT(s.id) 'NumStudents'
FROM Teacher t 
JOIN Student s ON s.teacher_id= t.id 
GROUP BY t.teacherName
HAVING COUNT(s.id) > 1;

-- Empresas cuyo sueldo medio es menor de 5.000
SELECT c.companyName, AVG(e.salary) 'avgSalary'
FROM Company c 
JOIN Employee e ON e.company_id= c.id 
GROUP BY c.companyName
HAVING AVG(e.salary) < 5000;

-- Empreados ordenados del más joven al más viejo
SELECT employeeName, birthDate
FROM Employee
ORDER BY birthDate DESC;

-- Empleados mayores de 40 
-- TIMESTAMPDIFF: funcion que calcula la diferencia entre dos fechas, 
-- Curdate(); devuelve la fecha actual
SELECT employeeName, birthDate
FROM Employee
WHERE TIMESTAMPDIFF(YEAR, birthDate, CURDATE()) > 40;


-- Estudiantes cuya suma total de horas es mas de la media total
SELECT s.studentName, SUM(h.totalHour) AS total_hours
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id
HAVING SUM(h.totalHour) > (SELECT AVG(totalHour) FROM Hour);

-- Los 3 estudiantes con más horas
SELECT s.studentName, SUM(h.totalHour) AS total_hours
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id
ORDER BY total_hours DESC
LIMIT 3;

-- encontrar los estudiantes que tienen más horas totales que el promedio de horas de todos los estudiantes de su mismo profesor
SELECT s.studentName, (SELECT AVG(h2.totalHour)
                       FROM Student s2
                       JOIN Hour h2 ON s2.id=h2.student_id
                       WHERE s2.teacher_id = s.teacher_id) AS teacher_avg_hours
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id
HAVING SUM(h.totalHour) > teacher_avg_hours;

-- Case 
SELECT s.studentName,
CASE 
    WHEN SUM(h.totalHour) >= 100 THEN 'High'
    WHEN SUM(h.totalHour) >= 50 THEN 'Medium'
    ELSE 'Low'
END AS hour_level
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id;

-- ifnull
SELECT s.studentName, IFNULL(e.employeeName, 'No Employee') AS assigned_employee
FROM Student s
LEFT JOIN Employee e ON s.employee_id = e.id;

-- subquerie + join
SELECT s.studentName, h.totalHour, t.teacherName
FROM Student s
JOIN Hour h ON s.id = h.student_id
JOIN Teacher t ON s.teacher_id = t.id
WHERE h.totalHour = (SELECT MAX(h2.totalHour)
                     FROM Student s2
                     JOIN Hour h2 ON s2.id = h2.student_id
                     WHERE s2.teacher_id = s.teacher_id);

-- union
SELECT studentName AS name, 'Student' AS type FROM Student
UNION
SELECT teacherName AS name, 'Teacher' AS type FROM Teacher;

-- union all
SELECT studentName AS name, 'Student' AS type FROM Student
UNION ALL
SELECT teacherName AS name, 'Teacher' AS type FROM Teacher;

-- view
CREATE OR REPLACE VIEW vw_student_summary AS
SELECT s.studentName, s.result, SUM(h.totalHour) AS total_hours, IFNULL(e.employeeName,'No Employee') AS assigned_employee
FROM Student s
LEFT JOIN Hour h ON s.id = h.student_id
LEFT JOIN Employee e ON s.employee_id = e.id
GROUP BY s.id;

SELECT * FROM vw_student_summary;

-- exists
SELECT t.teacherName
FROM Teacher t
WHERE EXISTS (
    SELECT 1
    FROM Student s
    WHERE s.teacher_id = t.id
);

-- not exists
SELECT t.teacherName
FROM Teacher t
WHERE NOT EXISTS (
    SELECT 1
    FROM Student s
    WHERE s.teacher_id = t.id
);

-- Students who have more hours than any student of teacher 1
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE h.totalHour > ANY (
    SELECT h2.totalHour
    FROM Student s2
    JOIN Hour h2 ON s2.id = h2.student_id
    WHERE s2.teacher_id = 1
);

-- Students who have more hours than all students of teacher 2
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE h.totalHour > ALL (
    SELECT h2.totalHour
    FROM Student s2
    JOIN Hour h2 ON s2.id = h2.student_id
    WHERE s2.teacher_id = 2
);

-- Add students from one teacher to another
INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id, status)
SELECT studentName, surname, email, phoneNumber, 3, employee_id, status
FROM Student
WHERE teacher_id = 1;

-- coalesce 
SELECT studentName, COALESCE(phoneNumber, 'No Phone') AS phone
FROM Student;

SELECT studentName,
       COALESCE(phoneNumber, email, 'No Contact') AS contactInfo
FROM Student;

-- exists + coalesce
SELECT s.studentName,
       COALESCE(s.phoneNumber, s.email, 'No Contact') AS contactInfo
FROM Student s
WHERE EXISTS (
    SELECT 1
    FROM Hour h
    WHERE h.student_id = s.id
    AND h.totalHour > 50
);


-- MOD impares
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE MOD(h.totalHour, 2) != 0;


SELECT studentName, YEAR(enrollmentDate)
FROM Student
WHERE YEAR(enrollmentDate) = 2023;

-- Horas trabajadas por mes
SELECT MONTH(dateWorked) AS month, SUM(totalHour) AS hours
FROM Hour
GROUP BY MONTH(dateWorked);

-- Empleados con mas de 5 años de antiguedad
SELECT employeeName, TIMESTAMPDIFF(YEAR, hireDate, CURDATE()) AS years_worked
FROM Employee
WHERE TIMESTAMPDIFF(YEAR, hireDate, CURDATE()) > 5;
