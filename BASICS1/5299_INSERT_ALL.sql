-- Insert Department
INSERT INTO department VALUES(10, 'PWLHSEIS');
INSERT INTO department VALUES(20, 'MHX/SH');
INSERT INTO department VALUES(30, 'LOGISTHRIO');
INSERT INTO department VALUES(40, 'DIOIKHTHRIO');


--insert Dlocation
INSERT INTO dlocation VALUES (10,'ATHINA');
INSERT INTO dlocation VALUES (20,'ATHINA');
INSERT INTO dlocation VALUES (20,'KABALA');
INSERT INTO dlocation VALUES (30,'ATHINA');
INSERT INTO dlocation VALUES (40,'ATHINA');


--insert Employee
INSERT INTO employee(idNum, fName,lName, sex, address, salary,bonus,job, deptno)
    VALUES(100,'NIKOS','NIKOY','M','YAKINTHOU 2',800,100.00, 'PROGRAMMER', 10);

INSERT INTO employee(idNum, fName,lName, sex, address, salary,bonus,job, deptno)
    VALUES(101,'ANDREAS','ANDREOY','M','KOLOKOTRWNH 12',800,NULL,'PROGRAMMER', 10);

INSERT INTO employee(idNum, fName,lName, sex, address, salary,bonus,job, deptno)
    VALUES(102,'IWANNHS','IWANNOY','M','NABARINOY 23',800,1200,'PROGRAMMER', 10);

INSERT INTO employee(idNum, fName,lName, sex, address, salary,bonus,job, deptno)
    VALUES(201,'GEWRGIA','GEWRGIOY','F','ANAKSAGORA 40',800, 1200,'PROGRAMMER', 10);

INSERT INTO employee(idNum, fName,lName, sex, address, salary,bonus,job, deptno)
    VALUES(202,'ANTWNIA','ANTWNNIOY','F','ANAKSAGORA 40',800, 1200,'PROGRAMMER', 10);


--insert Dependent
INSERT INTO dependent(idnum,name,sex, birthdate,relationship)
    VALUES(101,'dimitris','M', TO_DATE('01/03/1996','DD/MM/YYYY'),1);

INSERT INTO dependent(idnum,name,sex, birthdate,relationship)
    VALUES(101,'dimitra','F', TO_DATE('01/03/1996','DD/MM/YYYY'),1);

INSERT INTO dependent(idnum,name,sex, birthdate,relationship)
    VALUES(101,'antrianna','F', TO_DATE('13/05/1980','DD/MM/YYYY'),2);

INSERT INTO dependent(idnum,name,sex, birthdate,relationship)
    VALUES(100,'nikh','F',TO_DATE('13/07/1981','DD/MM/YYYY'),2);


--insert Project
INSERT INTO project VALUES(10001,'MHX/SH NOSOKOMEIWN','MAROUSI', 20);
INSERT INTO project VALUES(10002,'MHX/SH DHM. SXOLEIWN','KABALA',20);
INSERT INTO project VALUES(10003,'MHX/SH TEE','KABALA',20);


--insert WorksOn
INSERT INTO workson(idnum,projno,hours) VALUES(101,10002,200);
INSERT INTO workson(idnum,projno,hours) VALUES(101,10003,200);
INSERT INTO workson(idnum,projno,hours) VALUES(100,10001,200);

    
-- MY INSERT
INSERT INTO dlocation VALUES(20,'LARISA');
    
INSERT INTO employee(idNum, fName,lName, sex, address, salary,bonus,job, deptno)
    VALUES(5299,'MARIOS','PLENCHIDIS','M','KOLOKOTRWNH 20',800, 1200,'SOFTWARE ENGINEER', 20);
    
INSERT INTO dependent(idnum,name,sex, birthdate,relationship)
    VALUES(5299,'GEWRGIA','F',TO_DATE('17/03/2015','DD/MM/YYYY'),1);

INSERT INTO dependent(idnum,name,sex, birthdate,relationship)
    VALUES(5299,'GIWRGOS','M',TO_DATE('10/03/2021','DD/MM/YYYY'),1);    

