USE borjamoll;



SELECT * FROM Company;

SELECT studentName FROM Student WHERE studentName = 'Bad';

SELECT company_id FROM Employee WHERE company_id = 2; 

SELECT DISTINCT companyName FROM Company;

SELECT * FROM Employee WHERE company_id = 1 AND company_id = 2;

SELECT * FROM Employee ORDER BY company_id DESC;

-- INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id) VALUES ('Roberto', 'Bolaños', 'rb@borjamoll.cat', "666223344", 2, 4);

SELECT teacher_id FROM Student WHERE teacher_id IS NULL;

-- UPDATE Student SET employee_id = 4 WHERE id=3;

-- DELETE FROM Employee WHERE employeeName='Juantito Pérez';

SELECT surname FROM Student WHERE teacher_id=1 LIMIT 1;

SELECT MIN(id) FROM Student;



SELECT AVG(totalHour) FROM Hour;

SELECT studentName FROM Student WHERE  studentName LIKE 'P%';

SELECT studentName FROM Student WHERE employee_id IN (2, 3);

SELECT * FROM Student WHERE id NOT BETWEEN 1 AND 2;









