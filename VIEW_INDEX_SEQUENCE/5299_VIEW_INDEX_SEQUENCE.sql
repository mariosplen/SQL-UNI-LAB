--1. Na dhmiourghthei opsh me tis paroxes pou einai dwrean (dwrean 
--einai aytes pou den exoun katholou timh(oute kan mhden) sth sthlh 
--ePrice). 


CREATE VIEW
FREE_EXTRAS(ename) 
AS 
 SELECT ename
 FROM extras
 WHERE eprice is NULL;


--2. Na dhmiourghthei opsh pou tha perilambanei ta stoixeia twn 
--pelatwn me ta thlefwna tous. 


CREATE VIEW
CUSTOMERS_PHONES(cafm, cat, clastname, cfirstname, cregdate ,cphone) 
AS 
 SELECT c.cafm, c.cat, c.clastname, c.cfirstname, c.cregdate ,p.cphone
 FROM customer c, phone p
 WHERE c.cafm = p.cafm;


--3. Na dhmiourghthei opsh pou tha perilambanei tous pelates pou den 
--exoun thlefwno. 


CREATE VIEW
CUSTOMERS_WITHOUT_PHONES(cafm, cat, clastname, cfirstname, cregdate ) 
AS 
 SELECT c.cafm, c.cat, c.clastname, c.cfirstname, c.cregdate
 FROM customer c, phone p
 WHERE c.cafm = p.cafm(+)
    AND
       p.cafm IS NULL;


--4. Na kataskeyastei opsh me tous pelates pou ekanan eggrafh tis 
--teleytaies 5 hmeres. (Sthn SQL mporoume na efarmosoume thn 
--mathhmatikh praksh ths afaireshs metaksy dyo hmeromhniwn.)


CREATE VIEW
LAST_5_DAYS_REGISTRATIONS(cafm, cat, clastname, cfirstname, cregdate) 
AS 
    SELECT cafm, cat, clastname, cfirstname, cregdate
    FROM customer
    WHERE SYSDATE - cregdate <=5;


--5. Na kataskeyastei opsh pou tha perilambanei lista me to 
--onomatepwnymo twn pelatwn pou ayth th stigmh exoun 
--enoikiasmeno oxhma sthn etaireia enoikiashs. Dipla apo to 
--onomatepwnymo tha fainetai epishs o kwdikos tou 
--oxhmatos(arithmos pinakidas), h hmeromhnia paralabhs kai h 
--hmeromhnia epistrofhs tou oxhmatos apo ton pelath. 



CREATE VIEW
ENOIKIASEIS_TORA(cfirstname, clastname, vplatenumber, hmeromhnia_paralabhs, hmeromhnia_epistrofhs) 
AS 
    SELECT c.cfirstname, c.clastname, r.vplatenumber, TO_CHAR(outdate, 'DD/MM/YY'), TO_CHAR(indate, 'DD/MM/YY')
    FROM customer c, renting r
    WHERE r.cafm = c.cafm
        AND
          r.outdate <= SYSDATE AND SYSDATE < r.indate; 

--ENALAKTIKOS TROPOS AN I VASI MAS IPOSTIRIZEI NULL STO INDATE, DILADI DEN KSEROUME POTE THA EPISTRAFEI TO OXIMA:
--CREATE VIEW
--ENOIKIASEIS_TORA_NULL_SUPPORT(cfirstname, clastname, vplatenumber, hmeromhnia_paralabhs, hmeromhnia_epistrofhs) 
--AS 
--    SELECT c.cfirstname, c.clastname, r.vplatenumber, TO_CHAR(outdate, 'DD/MM/YY'), TO_CHAR(indate, 'DD/MM/YY')
--    FROM customer c, renting r
--    WHERE r.cafm = c.cafm(+)
--        AND
--          r.outdate <= SYSDATE AND SYSDATE < NVL(r.indate,SYSDATE+1); --an einai NULL to kanoume SYSDATE+1 gia na kratisoume kai tin periptosi NULL ;



--6. Na dhmiourghthei akolouthia me onoma RentSeq me bhma 
--prosaykshshs 10 kai me arxikh timh 1000. 


CREATE SEQUENCE RentSeq INCREMENT BY 10 START WITH 1000;


--7. Me xrhsh ths entolhs ALTER TABLE na prostethei h sthlh 
--RENT_ID ston pinaka enoikiasewn. 


ALTER TABLE renting
ADD RENT_ID NUMBER;


--8. Na dothei h katallhlh entolh UPDATE wste na gemisei me times h 
--«adeia» sthlh RENT_ID pou dhmiourghsate prohgoumenws. 


UPDATE renting SET RENT_ID = RentSeq.NEXTVAL;


--9. Me xrhsh ths entolhs ALTER TABLE na prostethei periorismos 
--monadikothtas pou tha eksasfalizei th monadikothta twn timwn ths 
--sthlhs RENT_ID. 


ALTER TABLE renting
MODIFY RENT_ID UNIQUE;



--10. Na dhmiourghthei ena eyrethrio ston pinaka pelatwn gia tis 
--sthles onomatepwnymou.


CREATE INDEX customer_idx ON customer (cfirstname, clastname); 

