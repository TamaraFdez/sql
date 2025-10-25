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

SELECT * FROM Student;
