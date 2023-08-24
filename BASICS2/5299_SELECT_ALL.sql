SELECT CAFM,CAT,CLASTNAME,CFIRSTNAME,TO_CHAR(cRegDate,'DD/MM/YYYY') AS CREGDATE
FROM CUSTOMER;

SELECT ENAME,EPRICE
FROM EXTRAS;

SELECT CAFM,CPHONE
FROM PHONE;

SELECT CAFM,VPLATENUMBER,TO_CHAR(OUTDATE,'DD/MM/YYYY HH24:MI') AS OUTDATE,TO_CHAR(INDATE,'DD/MM/YYYY HH24:MI') AS INDATE
FROM RENTING;

SELECT VPLATENUMBER,VCOLOR,VCC,VHORSEPOWER,VRENTTIMES,VEHCATNAME
FROM VEHICLE;

SELECT VPLATENUMBER,ENAME
FROM VEHICLE_EXTRAS;

SELECT NAME,VEHICLECATEGORYPRICE,VEHICLECOUNT
FROM VEHICLECAT;