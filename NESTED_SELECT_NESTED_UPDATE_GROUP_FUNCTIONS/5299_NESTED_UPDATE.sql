--ola ta extras na exoun tin idia timi me afti tou akrivoterou extra
UPDATE EXTRAS
SET EPRICE = (SELECT MAX(EPRICE) FROM EXTRAS);


--eksisosi tou CFIRSTNAME kai CLASTNAME tou pelati 100000000 me tou 200000000
UPDATE CUSTOMER
SET (CLASTNAME,CFIRSTNAME)=(SELECT CLASTNAME,CFIRSTNAME FROM CUSTOMER WHERE CAFM=100000000)
WHERE CAFM = 200000000;
