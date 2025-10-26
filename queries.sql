USE borjamoll;

INSERT INTO Teacher(teacherName, email) 
VALUES
('Antonia', 'antonia@cifpfbmoll.eu'),
('Josep', 'josep@cifpfbmoll.eu'),
('Teresa', 'tresa@cifpfbmoll.eu'),
('Maximo', 'max@cifpfbmoll.eu');

INSERT INTO Company(companyName, email)
VALUES
('Barcelo', 'rrhh@barcelo.es'),
('AirEuropa', 'rrhh@aireuropa.com'),
('Melia', 'rh@melia.es'),
('Hotelbeds', 'rh@hotelbeds.eu');

INSERT INTO Employee (employeeName, email, company_id)
VALUES
('Aina', 'aina@barcelo.com', 1),
('Jaume', 'jaume@aireuropa.com', 2),
('Cristina', 'cristina@malia.es', 3),
('Jesus', 'jesus@hotelbets.com', 4);

INSERT INTO Student (studentName, surname, email, phoneNumber, teacher_id, employee_id)
VALUES
('Maria', 'German', 'MGerman@cipfbmoll.eu',"667896745",1,1),
('Joan', 'Caminos','JCaminos@cifpfbmoll.eu',"665434748",2,2);

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

INSERT INTO Hour (totalHour, student_id) 
VALUES
(5,1),
(12,2),
(11,3),
(18,4);