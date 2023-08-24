CREATE TABLE CUSTOMER
(
    cAFM                     NUMBER        NOT NULL,
    cAT                      VARCHAR2(7)   NOT NULL,
    cLastName                VARCHAR2(20)  NOT NULL,
    cFirstName               VARCHAR2(15)  NOT NULL,
    cRegDate                 DATE          NOT NULL,
    
    PRIMARY KEY     (cAFM),
    UNIQUE          (cAT)    
);

CREATE TABLE VEHICLECAT
(
    Name                     VARCHAR2(14)  NOT NULL,
    VehicleCategoryPrice     NUMBER(5,2)   NOT NULL,
    VehicleCount             NUMBER        NOT NULL,
    
    PRIMARY KEY     (Name) 
);

CREATE TABLE VEHICLE
(
    vPlateNumber             VARCHAR2(7)   NOT NULL,
    vColor                   VARCHAR2(10)  NOT NULL,
    vCC                      NUMBER        NOT NULL,
    vHorsePower              NUMBER        NOT NULL,
    vRentTimes               NUMBER        NOT NULL,
    VehCatName               VARCHAR2(14)  NOT NULL,
    
    PRIMARY KEY     (vPlateNumber),
    FOREIGN KEY     (VehCatName) REFERENCES VEHICLECAT(Name)
   
);

CREATE TABLE EXTRAS
(
    eName                    VARCHAR2(14)   NOT NULL,
    ePrice                   NUMBER(3,2)/*THEORONTAS OTI TA EXTRAS DEN BORI NA KOSTIZOUN PANW APO 9.99*/    NOT NULL,
    
    PRIMARY KEY     (eName) 
);

CREATE TABLE PHONE
(
    cAFM                     NUMBER   NOT NULL,
    cPhone                   NUMBER   NOT NULL,
    
    PRIMARY KEY     (cAFM,cPhone), 
    FOREIGN KEY     (cAFM) REFERENCES CUSTOMER(cAFM)
);

CREATE TABLE RENTING
(
    cAFM                     NUMBER   NOT NULL,
    vPlateNumber             VARCHAR2(7)   NOT NULL,
    OutDate                  DATE           NOT NULL,
    InDate                   DATE,
    
    PRIMARY KEY     (cAFM,vPlateNumber,OutDate), 
    FOREIGN KEY     (cAFM) REFERENCES CUSTOMER(cAFM),
    FOREIGN KEY     (vPlateNumber) REFERENCES VEHICLE(vPlateNumber)
);

CREATE TABLE VEHICLE_EXTRAS
(
    vPlateNumber             VARCHAR2(7)   NOT NULL,
    eName                    VARCHAR2(14)   NOT NULL,
    
    PRIMARY KEY     (vPlateNumber,eName), 
    FOREIGN KEY     (vPlateNumber) REFERENCES VEHICLE(vPlateNumber),
    FOREIGN KEY     (eName) REFERENCES EXTRAS(eName)
);









INSERT INTO VEHICLECAT VALUES('CAR',100,1);
INSERT INTO VEHICLECAT VALUES('MOTORBIKE',30,1);
INSERT INTO VEHICLECAT VALUES('BICYCLE',5,1);
INSERT INTO VEHICLECAT VALUES('VAN',150,0);

INSERT INTO EXTRAS VALUES('GPS',2);
INSERT INTO EXTRAS VALUES('KID SEAT',3);
INSERT INTO EXTRAS VALUES('SNOW CHAIN',0);
INSERT INTO EXTRAS VALUES('MOBILE CHARGER',1);

INSERT INTO VEHICLE VALUES('AAA1111','WHITE',20,2,1,'BICYCLE');
INSERT INTO VEHICLE VALUES('BBB2222','BLACK',200,10,2,'MOTORBIKE');
INSERT INTO VEHICLE VALUES('CCC3333','RED',1300,130,3,'CAR');

--epidi prosthetoume 2 akoma CAR prepei na afksisoume to VehicleCount ton CAR tou VEHICLECAT
UPDATE VEHICLECAT SET VehicleCount = VehicleCount + 1
    WHERE Name='CAR';
    
INSERT INTO VEHICLE VALUES('DDD4444','GREEN',1400,140,2,'CAR');

UPDATE VEHICLECAT SET VehicleCount = VehicleCount + 1
    WHERE Name='CAR';
    
INSERT INTO VEHICLE VALUES('EEE5555','BLUE',1500,150,2,'CAR');


INSERT INTO VEHICLE_EXTRAS VALUES('EEE5555','KID SEAT');
INSERT INTO VEHICLE_EXTRAS VALUES('DDD4444','GPS');
INSERT INTO VEHICLE_EXTRAS VALUES('DDD4444','SNOW CHAIN');
INSERT INTO VEHICLE_EXTRAS VALUES('BBB2222','MOBILE CHARGER');
INSERT INTO VEHICLE_EXTRAS VALUES('AAA1111','GPS');


INSERT INTO CUSTOMER VALUES(100000000,'AK11111','GEWRGIOU','GEWRGIOS',TO_DATE('17/12/2020', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES(200000000,'AK22222','IWANNOU','IWANNA',TO_DATE('07/06/2020', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES(300000000,'AK33333','PAYLOY','PAYLOS',TO_DATE('10/01/2021', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES(400000000,'AK44444','FILIPPIDIS','FILIPPOS',TO_DATE('08/01/2021', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES(500000000,'AK55555','DIMITRIADOU','DIMITRA',TO_DATE('20/02/2021', 'DD/MM/YYYY'));

INSERT INTO PHONE VALUES(100000000,6980000001);
INSERT INTO PHONE VALUES(200000000,6970000002);
INSERT INTO PHONE VALUES(300000000,6940000003);
INSERT INTO PHONE VALUES(400000000,6980000004);
INSERT INTO PHONE VALUES(500000000,6930000005);


INSERT INTO RENTING VALUES(100000000,'AAA1111',TO_DATE('17/12/2020 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('18/12/2020 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(100000000,'BBB2222',TO_DATE('18/12/2020 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('19/12/2020 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(100000000,'BBB2222',TO_DATE('19/12/2020 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('20/12/2020 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(200000000,'CCC3333',TO_DATE('07/06/2020 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('08/06/2020 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(200000000,'CCC3333',TO_DATE('08/06/2020 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('09/06/2020 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(200000000,'CCC3333',TO_DATE('09/06/2020 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('10/06/2020 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(300000000,'DDD4444',TO_DATE('10/01/2021 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('11/01/2021 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(300000000,'DDD4444',TO_DATE('11/01/2021 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('12/01/2021 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(400000000,'EEE5555',TO_DATE('08/01/2021 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('09/01/2021 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO RENTING VALUES(500000000,'EEE5555',TO_DATE('20/02/2021 11:30','DD/MM/YYYY HH24/MI'),NULL);

--EXTRA INSERTS GIA TASK 5

INSERT INTO PHONE VALUES(200000000,6970000602);
INSERT INTO CUSTOMER VALUES(500001234,'AK55755','DIMITRIADHS','MARIOS',TO_DATE('10/02/2021', 'DD/MM/YYYY'));
INSERT INTO RENTING VALUES(500001234,'CCC3333',TO_DATE('08/04/2021 11:30','DD/MM/YYYY HH24/MI'),TO_DATE('09/04/2021 11:00','DD/MM/YYYY HH24/MI'));
INSERT INTO CUSTOMER VALUES(505301234,'AK58755','DIMITRIADHS','NIKOS',TO_DATE('13/02/2021', 'DD/MM/YYYY'));
INSERT INTO CUSTOMER VALUES(527541234,'AK54755','DIMITRIADOU','KATERINA',TO_DATE('10/07/2021', 'DD/MM/YYYY'));

INSERT INTO EXTRAS VALUES('MUSIC SYSTEM',8);

drop table VEHICLE_EXTRAS;
drop table RENTING;
drop table PHONE;
drop table EXTRAS;
drop table VEHICLE;
drop table VEHICLECAT;
drop table Customer;


