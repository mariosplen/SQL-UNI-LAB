CREATE TABLE department
  (
     deptno NUMBER,
     name   VARCHAR2(14) NOT NULL,
     PRIMARY KEY (deptno),
     UNIQUE (name)
  );

CREATE TABLE dlocation
  (
     deptno   NUMBER,
     location VARCHAR2(15) NOT NULL,
     PRIMARY KEY (deptno, location),
     FOREIGN KEY (deptno) REFERENCES department(deptno)
  );

CREATE TABLE employee
  (
     idnum   NUMBER,
     fname   VARCHAR2(15) NOT NULL,
     lname   VARCHAR2(20) NOT NULL,
     sex     CHAR(1) NOT NULL,
     address VARCHAR2(20) NOT NULL,
     salary  NUMBER(7, 2) NOT NULL,
     bonus   NUMBER(6, 2),
     job     VARCHAR2(20) NOT NULL,
     deptno  NUMBER NOT NULL,
     PRIMARY KEY (idnum),
     FOREIGN KEY (deptno) REFERENCES department(deptno)
  );

CREATE TABLE dependent
  (
     idnum        NUMBER,
     name         VARCHAR2(15) NOT NULL,
     sex          CHAR(1) NOT NULL,
     birthdate    DATE NOT NULL,
     relationship NUMBER(1) NOT NULL,
     PRIMARY KEY (idnum, name),
     FOREIGN KEY (idnum) REFERENCES employee(idnum)
  );

CREATE TABLE project
  (
     projno   NUMBER,
     name     VARCHAR2(20) NOT NULL,
     location VARCHAR2(15) NOT NULL,
     deptno   NUMBER NOT NULL,
     PRIMARY KEY (projno),
     UNIQUE(name),
     FOREIGN KEY(deptno) REFERENCES department(deptno)
  );

CREATE TABLE workson
  (
     idnum  NUMBER NOT NULL,
     projno NUMBER NOT NULL,
     hours  NUMBER(4),
     PRIMARY KEY (idnum, projno),
     FOREIGN KEY(idnum) REFERENCES employee(idnum),
     FOREIGN KEY(projno) REFERENCES project(projno)
  ); 