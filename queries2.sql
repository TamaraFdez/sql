 -- SELF JOIN
   SELECT a.studentName as Names1, b.studentName as Names2, a.enrollmentDate 
     FROM Student a JOIN Student b 
     ON a.id=b.id and a.enrollmentDate=b.enrollmentDate 
     ORDER BY a.enrollmentDate ASC;
