USE borjamoll;

INSERT INTO Company (companyName, email)
VALUES 
('IBM', 'ibm@ibm.com'),
('Apple World', 'applefake@tongo.com'),
('Reciclajes PCS', 'reciclajespcs@pcs.com'),
('WEB Consulting', 'webconsulting@consulting.com');

INSERT INTO Teacher (teacherName, email)
VALUES
('Mery Keys', 'mk@borjamoll.cat'),
('Susana Storm', 'ss@borjamoll.cat'),
('Ximo Bay', 'xb@borjamoll.cat');

INSERT INTO Employee (employeeName, email, company_id)
VALUES
('Perpetual Khamid', 'pk@ibm.com', 1),
('Socorro Plasencia', 'sp@tongo.com', 2),
('Juanito Pérez', 'jp@pcs.com', 3),
('Delegado de Legado', 'ddl@consulting.com',4);

INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id)
VALUES
('Bad', 'Courier', 'bd@borjamoll.cat', '666554433', 1, 1),
('Sonia', 'Irascuni', 'si@borjamoll.cat', '666777888', 1, 1),
('Pep', 'Forani', 'pf@borjamoll.cat', '666778899', 2, 2),
('Maria', 'Corrent', 'mc@borjamoll.cat', '666555444', 3, 3);

SELECT * FROM Company;

SELECT studentName FROM Student WHERE studentName = 'Bad';

SELECT company_id FROM Employee WHERE company_id = 2; 

SELECT DISTINCT companyName FROM Company;

SELECT * FROM Employee WHERE company_id = 1 AND company_id = 2;

SELECT * FROM Employee ORDER BY company_id DESC;

INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id) VALUES ('Roberto', 'Bolaños', 'rb@borjamoll.cat', "666223344", 2, 4);

SELECT teacher_id FROM Student WHERE teacher_id IS NULL;

UPDATE Student SET employee_id = 4 WHERE id=3;

DELETE FROM Employee WHERE employeeName='Juantito Pérez';

SELECT surname FROM Student WHERE id=3;





