--1 Na brethei to plhthos twn thlefwnwn ana AFM pelath. Ta apotelesmata tha deixnoun monon AFM pelath kai to plhthos thlefwnwn.

SELECT cafm, COUNT(cphone) AS "Plhthos Thlefwnwn"
FROM phone
GROUP BY cafm;


--2 Na brethei to plhthos twn oxhmatwn pou exei kathe kathgoria oxhmatwn. Ta apotelesmata tha bgainoun se fthinousa seira 
--taksinomhshs me bash to plhthos. (Na xrhsimopoihthei o pinakas VEHICLE)

SELECT vehcatname, COUNT(vplatenumber) AS "PLhthos Oxhmatwn"
FROM vehicle
GROUP BY vehcatname
ORDER BY 2 DESC;

--3 Na brethei to plhthos twn oxhmatwn gia kathe xrwma oxhmatos. Ta apotelesmata tha bgainoun se ayksousa seira taksinomhshs 
--me bash ton xrwma.

SELECT vcolor, COUNT(vplatenumber) AS "Plhthos Oxhmatwn"
FROM vehicle
GROUP BY vcolor
ORDER BY vcolor ASC;

--4 Na brethei to plhthos twn paroxwn pou exei kathe oxhma.

SELECT vplatenumber, COUNT(ename) AS "Plhthos Paroxwn"
FROM vehicle_extras
GROUP BY vplatenumber;

--5 Na brethei to synoliko athroisma kybikwn kai to synoliko athroisma ippwn gia kathe kathgoria oxhmatwn.

SELECT vehcatname, SUM(vcc) AS "Athroisma Kybikwn", SUM(vhorsepower) AS "Athroisma Ippwn"
FROM vehicle
GROUP BY vehcatname;


--6 Na brethei to plhthos pelatwn pou exoun kanei eggrafh thn idia hmeromhnia. THa brethoun monon oi pelates pou to AFM tous 
--teleiwnei se ‘1’ h ‘5’. Ta apotelesmata tha deixnoun monon hmeromhnia eggrafhs kai to plhthos eggegrammenwn. An yparxei pelaths 
--pou den exei kanei eggrafh thn idia hmera me kapoion allon tote aytos o pelaths den tha lambanetai ypopsh kai h antistoixh 
--hmeromhnia den tha emfanizetai sth lista.


SELECT TO_CHAR(cregdate, 'DD/MM/YYYY') AS "Hmeromhnia", COUNT(cafm) AS "Plhthos Eggegrammenwn"
FROM customer
WHERE cafm LIKE '%1' OR cafm LIKE '%5'
GROUP BY cregdate;


--7 Na emfanistei lista me to synolo twn oxhmatwn pou exei kanei enoikiash kathe pelaths.

SELECT cafm, COUNT(outdate) AS "Synolo Enoikiasewn"
FROM renting
GROUP BY cafm;


--8 Na emfanistei poses fores exei enoikiastei kathe oxhma. (Na xrhsimopoihthei o pinakas RENTING). Sthn katametrhsh tha 
--perilambanontai monon oi enoikiaseis twn oxhmatwn pou exoun ginei entos tou 2021. 

SELECT vplatenumber, COUNT(vplatenumber) AS "Plhthos Enoikiasewn(2021)"
FROM renting
WHERE 
        outdate >= TO_DATE('2021/01/01', 'yyyy/mm/dd') 
    AND 
        outdate < TO_DATE('2022/01/01', 'yyyy/mm/dd')
        
GROUP BY vplatenumber;


--9 Na emfanistei lista me to synolo twn enoikiasewn ana xrwma kathgorias oxhmatwn: dhladh poses enoikiaseis exoun ginei sta
--oxhmata kathgorias CAR pou exoun xrwma RED, poses enoikiaseis exoun ginei sta oxhmata kathgorias CAR pou exoun xrwma GREEN klp, 
--poses enoikiaseis exoun ginei sta oxhmata kathgorias BICYCLE pou exoun xrwma RED k.o.k. H lista den tha perilambanei sto metrhma 
--ta oxhmata ths kathgorias pou exoun ligotera apo 50 ippous. H lista de tha emfanizei kathgoria kai xrwma an to synolo 
--(twn enoikiasewn) xrwmatos ths kathgorias einai megalytero apo 3. (An gia paradeigma yparxoun 5 enoikiaseis xrwmatos BLACK ths 
--kathgorias VAN tote h grammh VAN – BLACK tha apousiazei apo th lista).


SELECT vehcatname, vcolor, SUM(vrenttimes) AS "Synolo Enoikiasewn"
FROM vehicle
WHERE vhorsepower >= 50
GROUP BY vcolor, vehcatname
HAVING SUM(vrenttimes) <= 3;


--10 Na emfanistei lista me to plhthos twn enoikiasewn pou exoun ginei ana arithmo pinakidas oxhmatos kai ana mhna enoikiashs 
--apo thn etaireia enoikiashs, mono gia tous kalokairinous mhnes tou etous 2021 kai mono gia ta oxhmata pou exoun kokkino xrwma. 
--Na agnohthoun oi mhnes pou exoun ligoteres apo treis enoikiaseis. 


SELECT vplatenumber, TO_CHAR(outdate, 'MONTH')AS MONTH ,COUNT(outdate) AS "Plhthos Enoikiasewn"
FROM RENTING
WHERE 
        outdate >= TO_DATE('2021/06/01', 'yyyy/mm/dd') 
    AND 
        outdate < TO_DATE('2021/09/01', 'yyyy/mm/dd')
    AND
        vplatenumber IN (SELECT vplatenumber
                         FROM vehicle
                         where vcolor = 'RED')
                         
GROUP BY vplatenumber, TO_CHAR(outdate, 'MONTH')
HAVING COUNT(outdate) >=3;
