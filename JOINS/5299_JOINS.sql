--1. a. Na grafei entolh SELECT pou deixnei to kartesiano ginomeno twn
--pinakwn CUSTOMER kai PHONE.


SELECT customer.*, phone.*
FROM customer, phone;


--b. Na grafei entolh SELECT pou deixnei to kartesiano ginomeno twn
--pinakwn CUSTOMER, VEHICLE kai RENTING.


SELECT customer.*, vehicle.*, renting.*
FROM customer, vehicle, renting;


--2. Na emfanistei lista me tous pelates kai ola ta thlefwna tous. H
--lista tha perilambanei mono ta stoixeia: AFM pelath, arithmo
--taytothtas, onomatepwnymo, kai arithmo thlefwnou.


SELECT customer.cafm, customer.cat, customer.cfirstname, customer.clastname, phone.cphone
FROM customer, phone
WHERE phone.cafm = customer.cafm;


--3. Na kataskeyastei lista me ta oxhmata kai tis kathgories pou
--anhkoun. H lista tha perilambanei mono ta stoixeia: kwdikos
--pinakidas, basiko xrwma, kybika, kathgoria oxhmatos kai elaxisth
--timh kathgorias oxhmatwn.


SELECT vehicle.vplatenumber, vehicle.vcolor, vehicle.vcc, vehicle.vehcatname, vehiclecat.vehiclecategoryprice
FROM vehicle, vehiclecat
WHERE vehicle.vehcatname = vehiclecat.name;


--4. Na brethoun oi pelates pou exoun kanei eggrafh thn 10 hmera
--opoioudhpote mhna tou etous 2021 kai exoun kanei krathsh
--oxhmatwn xrwmatos kokkino. H lista tha perilambanei ta stoixeia:
--AFM pelath, onomatepwnymo, hmeromhnia eggrafhs, pinakida
--oxhmatos, xrwma, kathgoria oxhmatos, hmeromhnia paralabhs kai
--hmeromhnia epistrofhs.


SELECT customer.cafm, customer.cfirstname, customer.clastname, TO_CHAR(customer.cregdate,'DD/MM/YY') AS "HMEROMHNIA EGGRAFHS", vehicle.vplatenumber, vehicle.vcolor, vehicle.vehcatname, TO_CHAR(renting.outdate,'DD/MM/YY')AS "HMEROMHNIA PARALABHS",TO_CHAR(renting.indate,'DD/MM/YY') AS "HMEROMHNIA EPISTROFHS" 
FROM customer, vehicle, renting
WHERE customer.cafm = renting.cafm
    AND
      vehicle.vplatenumber = renting.vplatenumber
    AND
       vehicle.vcolor = 'RED'
    AND
       TO_CHAR(customer.cregdate,'DD') = '10'
    AND
       TO_CHAR(customer.cregdate,'YYYY') = '2021';



--5. Deikste plhrh stoixeia bashs dedomenwn ths etaireias enoikiashs.
--Prospathhste na diatypwsete thn ekfwnhsh (kai ylopoihste to
--erwthma SELECT) opws fainetai sthn Enothta 5, Selida 6, Askhsh
--10.


-- POIOS PELATHS EXEI POIOYS ARITHMOYS
-- POIES ENOIKIASEIS EXEI KANEI
-- POIA OXHMATA EXEI NOIKIASEI
-- TI PAROXES EXOYN 
-- POSO KOSTIZOUN OI PAROXES AFTES
-- KAI POSO KOSTIZEI I KATIGORIA TOU OXIMATOS POU EXEI NIKIASEI KAI POSA OXIMATA THS KATIGORIAS EXEI H ETAIRIA

SELECT *
FROM customer, phone, renting, vehicle, vehicle_extras, extras, vehiclecat
WHERE customer.cafm = phone.cafm
    AND
      customer.cafm = renting.cafm
    AND
       renting.vplatenumber = vehicle.vplatenumber
    AND
       vehicle.vplatenumber = vehicle_extras.vplatenumber
    AND
       vehicle_extras.ename = extras.ename
    AND 
       vehicle.vehcatname = vehiclecat.name;
    
       


--6. Na kataskeyastei lista me tous pelates pou den exoun thlefwno
--(tha xrhsimopoihsete outer join).


SELECT customer.*
FROM customer, phone
WHERE customer.cafm = phone.cafm(+)
    AND
      phone.cafm IS NULL;


--7. Na brethoun ta oxhmata pou kapoia apo tis paroxes tous einai
--dwrean. H lista tha perilambanei monon pinakida oxhmatos, xrwma,
--kathgoria oxhmatos, onoma paroxhs (proairetika) kai timh paroxhs.


SELECT vehicle.vplatenumber, vehicle.vcolor, vehicle.vehcatname, extras.ename, extras.eprice
FROM vehicle, extras, vehicle_extras
WHERE vehicle.vplatenumber = vehicle_extras.vplatenumber
    AND
      vehicle_extras.ename = extras.ename
    AND
      extras.eprice = 0;


--8. Na kataskeyastei lista me tis paroxes twn oxhmatwn. Sth lista tha
--emfanizontai epishs kai paroxes pou den prosferontai apo kanena
--oxhma. H lista tha perilambanei onoma paroxhs, timh paroxhs kai
--pinakida oxhmatos. Oi paroxes pou den prosferontai apo kanena
--oxhma, sth sthlh pinakida oxhmatos tha emfanizetai -sth lista- timh
--0.


SELECT extras.ename, extras.eprice, NVL(vehicle_extras.vplatenumber,0) AS "PINAKIDA OXHMATOS"
FROM extras, vehicle_extras
WHERE extras.ename = vehicle_extras.ename(+);


--9. Na kataskeyastei lista me tous pelates kai to plhthos twn
--oxhmatwn pou exoun krathsei to 2021 sthn etaireia enoikiashs. H
--lista tha perilambanei kwdiko pelath, onomatepwnymo, etos
--krathshs (gia to etos na xrhsimopoihsete th synarthsh
--hmeromhniwn TO_CHAR), kai plhthos oxhmatwn.


SElECT customer.cafm, customer.cfirstname, customer.clastname, TO_CHAR(renting.outdate,'YYYY') AS "ETOS KRATHSHS", COUNT(renting.outdate) AS "PLHTHOS OXHMATWN"
FROM customer, renting
WHERE customer.cafm = renting.cafm
    AND
      TO_CHAR(renting.outdate,'YYYY') = '2021'
GROUP BY customer.cafm, customer.cfirstname, customer.clastname, TO_CHAR(renting.outdate,'YYYY');


--10. Na brethei to synolo twn xrhmatwn pou exei kataballei kathe
--pelaths sthn etaireia enoikiashs apo to synolo twn krathsewn pou
--exei kanei. H lista tha perilambanei kwdiko pelath, onomatepwnymo
--kai poso. (Ston ypologismo tou posou tha agnohsete to kostos
--paroxwn).


SELECT customer.cafm, customer.cfirstname, customer.clastname, SUM(vehiclecat.vehiclecategoryprice)
FROM customer, vehiclecat, vehicle, renting
WHERE customer.cafm = renting.cafm
    AND
      renting.vplatenumber = vehicle.vplatenumber
    AND
      vehicle.vehcatname = vehiclecat.name
GROUP BY customer.cafm, customer.cfirstname, customer.clastname;

