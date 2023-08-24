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
