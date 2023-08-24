INSERT INTO workson(idnum, projno,hours)
    VALUES(5299,10003,135);
    
UPDATE workson SET hours = hours + 35
    WHERE idnum=5299 AND projno = 10003;
    
INSERT INTO employee(idNum, fName,lName, sex, address, salary,bonus,job, deptno)
    VALUES(500,'MPAMPHS','MPAMPINIWTHS','M','KOLOKOTRWNH 5',800, 1200,'DATABASE ADMIN', 20);

UPDATE employee SET salary = salary + 400.20
    WHERE job='DATABASE ADMIN';
    
DELETE FROM workson WHERE idnum = 5299;
DELETE FROM dependent WHERE idnum =5299;
DELETE FROM employee WHERE idnum=5299;

/*
CREATE USER c##maplenc identified BY password;
GRANT connect,resource,create VIEW TO c##maplenc;
ALTER USER c##maplenc quota unlimited ON users;
*/
