--emfanisi timi fthinoterou oximatos
SELECT MIN(VEHICLECATEGORYPRICE) AS "PRICE OF CHEAPER OPTION"
FROM VEHICLECAT;

--emfanisi tis ipsiloteris ippodynamis
SELECT MAX(VHORSEPOWER) AS "MAX HORSEPOWER"
FROM VEHICLE;

--athrisma ton VCC olon ton oximaton
SELECT SUM(VCC) AS "VCC SUM"
FROM VEHICLE;

--emfanisi mesou orou ton VCC
SELECT AVG(VCC) AS "AVERAGE VCC"
FROM VEHICLE;

--emfanisi tou plithous ton pelaton
SELECT COUNT(CAFM) AS "NUMBER OF CUSTOMERS"
FROM CUSTOMER;

