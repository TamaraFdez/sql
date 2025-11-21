-- Alliases
SELECT COUNT(id) AS numberOfStudents 
FROM Student;

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
FROM Student e
RIGHT JOIN Employee s ON s.employee_id = e.id;

-- CROSS JOIN
SELECT t.teacherName, c.companyName
FROM Teacher t 
CROSS JOIN Company c;

-- FULL JOIN (with postgresql)
SELECT * FROM Student FULL JOIN Teacher ON Student.teacher_id=Teacher.id;

-- SELF JOIN
SELECT h1.student_id
h1.totalHour AS Hours1,
h2.totaHour as Hours2, 
h1.dateWorked AS Date1,
h2.dateWorked AS Date 2
FROM Hour h1, Hour h2
WHERE h1.student_id = h2.student_id
AND h1.dateworked < h2.dateWorked;

-- UNION
SELECT studentName AS name, 'Student' AS type FROM Student
UNION
SELECT teacherName AS name, 'Teacher' AS type FROM Teacher;

-- UNION ALL
SELECT studentName AS name, 'Student' AS type FROM Student
UNION ALL
SELECT teacherName AS name, 'Teacher' AS type FROM Teacher;

-- GROUP BY
SELECT teacher_id, COUNT(id) TotalStudents 
FROM Student GROUP BY teacher_id;

-- HAVING
SELECT teacher_id, COUNT(id) TotalStudents 
FROM Student GROUP BY teacher_id;
HAVING TotalStudents > 2;

-- EXISTS 
SELECT employeeName
FROM Employee
WHERE EXISTS (
  SELECT studentName 
  FROM Student 
  WHERE Student.employee_id=Employee.id);

-- NOT EXISTS
SELECT employeeName
FROM Employee
WHERE NOT EXISTS (
  SELECT studentName 
  FROM Student 
  WHERE Student.employee_id=Employee.id);

-- ANY
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE h.totalHour > ANY (
    SELECT h2.totalHour
    FROM Student s2
    JOIN Hour h2 ON s2.id = h2.student_id
    WHERE s2.teacher_id = 1
);

-- ALL
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE h.totalHour > ALL (
    SELECT h2.totalHour
    FROM Student s2
    JOIN Hour h2 ON s2.id = h2.student_id
    WHERE s2.teacher_id = 2
);

-- INSERT INTO SELECT
INSERT INTO Student(studentName, email) SELECT teacherName, email FROM Teacher;

-- CASE
SELECT s.studentName,
CASE 
    WHEN SUM(h.totalHour) >= 100 THEN 'High'
    WHEN SUM(h.totalHour) >= 50 THEN 'Medium'
    ELSE 'Low'
END AS hour_level
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id;

-- IFNULL
SELECT s.studentName, IFNULL(e.employeeName, 'No Employee') AS assigned_employee
FROM Student s
LEFT JOIN Employee e ON s.employee_id = e.id;

-- COALESCE
SELECT teacherName, COALESCE(department, 'Free Soul') AS department FROM Teacher;

-- DOUBLE LEFT JOIN
SELECT s.studentName, t.teacherName, e.employeeName
FROM Student s
LEFT JOIN Teacher t ON s.teacher_id = t.id
LEFT JOIN Employee e ON s.employee_id = e.id;

-- DOUBLE SUBQUERY
SELECT employeeName
FROM Employee
WHERE company_id IN (
    SELECT id FROM Company WHERE country = (
        SELECT country FROM Company WHERE companyName = 'Stark Industries'
    )
);

-- TIMESTAMPDIFF
SELECT employeeName, birthDate
FROM Employee
WHERE TIMESTAMPDIFF(YEAR, birthDate, CURDATE()) > 40;

-- JOIN + GROUP BY + HAVING  SUBQUERY
SELECT s.studentName, SUM(h.totalHour) AS total_hours
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id
HAVING SUM(h.totalHour) > (SELECT AVG(totalHour) FROM Hour);

-- SUBQUERY + JOIN + GROUP BY + HAVING
SELECT s.studentName, (SELECT AVG(h2.totalHour)
                       FROM Student s2
                       JOIN Hour h2 ON s2.id=h2.student_id
                       WHERE s2.teacher_id = s.teacher_id) AS teacher_avg_hours
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id
HAVING SUM(h.totalHour) > teacher_avg_hours;

-- GROUP BY + ORDER BY
SELECT s.studentName, SUM(h.totalHour) AS total_hours
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id
ORDER BY total_hours DESC
LIMIT 3;

-- SUBQUERY + JOIN
SELECT s.studentName, h.totalHour, t.teacherName
FROM Student s
JOIN Hour h ON s.id = h.student_id
JOIN Teacher t ON s.teacher_id = t.id
WHERE h.totalHour = (SELECT MAX(h2.totalHour)
                     FROM Student s2
                     JOIN Hour h2 ON s2.id = h2.student_id
                     WHERE s2.teacher_id = s.teacher_id);

-- EXCEPT + RIGHT JOIN
SELECT employeeName 
FROM Employee
EXCEPT
SELECT employeeName
FROM Employee
RIGHT JOIN Student s ON s.employee_id= Employeee.ID 
WHERE s.ID IS NULL;

-- ANY + JOIN
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE h.totalHour > ANY (
    SELECT h2.totalHour
    FROM Student s2
    JOIN Hour h2 ON s2.id = h2.student_id
    WHERE s2.teacher_id = 1
);

--VIEW
CREATE OR REPLACE VIEW vw_student_summary AS
SELECT s.studentName, s.result, SUM(h.totalHour) AS total_hours, IFNULL(e.employeeName,'No Employee') AS assigned_employee
FROM Student s
LEFT JOIN Hour h ON s.id = h.student_id
LEFT JOIN Employee e ON s.employee_id = e.id
GROUP BY s.id;

SELECT * FROM vw_student_summary;

DROP VIEW vw_student_summary;

-- MOD 
-- odd
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE MOD(h.totalHour, 2) != 0;
-- even
SELECT s.studentName, h.totalHour
FROM Student s
JOIN Hour h ON s.id = h.student_id
WHERE MOD(h.totalHour, 2) = 0;

-- EXISTS + COALESCE
SELECT s.studentName,
       COALESCE(s.phoneNumber, s.email, 'No Contact') AS contactInfo
FROM Student s
WHERE EXISTS (
    SELECT 1
    FROM Hour h
    WHERE h.student_id = s.id
    AND h.totalHour > 50
);

-- YEAR
SELECT studentName, YEAR(enrollmentDate)
FROM Student
WHERE YEAR(enrollmentDate) = 2023;

-- MONTH
SELECT MONTH(dateWorked) AS month, SUM(totalHour) AS hours
FROM Hour
GROUP BY MONTH(dateWorked);

-- TESTING SAVEPOINT
START TRANSACTION;
SAVEPOINT Friday;
UPDATE Teacher SET salary = salary + 500;
SELECT salary, teacherName FROM Teacher;
ROLLBACK TO Friday;

-- ROW_NUMBER () OVER ()
SELECT employeeName, salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS rank_salary 
FROM Employee;

-- LEFT JOIN + IS NULL + IS NOT NULL
SELECT s.studentName
FROM Student s
LEFT JOIN Hour h ON s.id=h.student_id
WHERE h.id IS NULL AND s.employee_id IS NOT NULL;

-- OPERATORS
SELECT s.studentName,
SUM(h.totalHour) AS student_total,
(SUM(h.totalHour) - (SELECT AVG(totalHour) FROM Hour)) AS difference
FROM Student s
JOIN Hour h ON s.id = h.student_id
GROUP BY s.id;

-- INTERSECT
SELECT * 
FROM Teacher 
WHERE department = 'Design' 
    INTERSECT
SELECT * 
FROM Teacher 
WHERE salary < 3000;

-- BONUS TRACK

SELECT t.teacherName, COUNT(s.id) 'NumStudents'
FROM Teacher t 
JOIN Student s ON s.teacher_id= t.id 
GROUP BY t.teacherName
HAVING COUNT(s.id) > 1;

SELECT c.companyName, AVG(e.salary) 'avgSalary'
FROM Company c 
JOIN Employee e ON e.company_id= c.id 
GROUP BY c.companyName
HAVING AVG(e.salary) < 5000;

SELECT employeeName, birthDate
FROM Employee
ORDER BY birthDate DESC;

SELECT studentName 
FROM Student
WHERE teacher_id IN (
    SELECT id FROM Teacher
    WHERE salary > (SELECT AVG(salary) FROM Teacher)
);

UPDATE Student SET result = 'Aprobado' WHERE id IN (1,2,6);
UPDATE Student SET result = 'Suspenso' WHERE id IN (3,5,10);
UPDATE Student SET result = 'En Curso' WHERE result IS NULL;

SELECT teacherName, salary 
FROM Teacher 
EXCEPT 
SELECT teacherName, salary 
FROM Teacher 
WHERE salary < 3000;
