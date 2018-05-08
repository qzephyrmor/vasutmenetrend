create table felhasznalo(
  Neve VARCHAR2(20),
  Email VARCHAR2(30),
  Jelszo VARCHAR2(30),
  Felhasznalo VARCHAR2(30),
  STATUSZ VARCHAR2(10),
    PRIMARY KEY(Felhasznalo)
);


CREATE TABLE jegy (
  ID NUMBER(7) NOT NULL,
  Vonatfajta_ara NUMBER(5) NOT NULL,
  Vonatfajta VARCHAR2(20),
  id_kedvezmeny NUMBER(5) NOT NULL
  PRIMARY KEY(ID)
);


CREATE TABLE jarat (
  ID NUMBER(2) NOT NULL,
  Kezdet  VARCHAR2(20),
  Cel VARCHAR2(20) ,
  Vonat_id NUMBER(3) NOT NULL,
  Fajta VARCHAR2(20),
  Helyfoglalas VARCHAR2(20),
  PRIMARY KEY(ID)
) ;



CREATE TABLE kedvezmeny (
  ID NUMBER(3) NOT NULL,
  Neve VARCHAR2(20),
  kedvezmeny NUMBER(3,3) NOT NULL,
  Kezdet DATE  ,
  Meddig DATE,
  PRIMARY KEY(ID)
) ;



CREATE TABLE menet (
  ID NUMBER(2) NOT NULL,
  Jarat_id NUMBER(2) NOT NULL,
  Honnan VARCHAR2(20),
  Hova VARCHAR2(20),
  Indul TIMESTAMP,
  Erkezik TIMESTAMP,
  HelySzam NUMBER(2),
  PRIMARY KEY(ID)
);




CREATE TABLE vonat (
  Neve VARCHAR2(10),
  Fajta VARCHAR2(20),
  FoglalhatHely NUMBER(2),
  Sebesseg NUMBER(3),
  ID NUMBER(2) NOT NULL,
  PRIMARY KEY(Neve)
) ;



CREATE TABLE Allomas (
  Neve VARCHAR2(20),
  Iranyitoszam NUMBER(4) NOT NULL,
  PRIMARY KEY(Neve)
);



CREATE TABLE Ulohely (
  MENET_ID NUMBER(2) NOT NULL,
  Sorszam NUMBER(3) NOT NULL,
  PRIMARY KEY(Menetrend_ID, Sorszam)
);

INSERT into KEDVEZMENY values(1,'Teljes aru jegy',1,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(2,'26 even aluli',0.77,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(3,'Csaladi kedvezmeny(18 év alatti gyermekkel egyutt utazo felnott/ek)',0.33,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(4,'Gyermek 6-14 eves korig',0.5,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(5,'Kozszolgalati alkalmazott',0.5,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(6,'Nyugdijas(evi 16 egyuti)',0.5,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(7,'Tanulo(levelezo)-tanintezet és a lakóhely között',0.5,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(8,'Tanuló(nappali)-diakigazolvannyal rendelkezo',0.5,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(9,'Fogyatekossaggal elo szemely',0.1,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(10,'Nyugdijas(evi 2 egyeti)',0.1,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(11,'65 even felüli szemely',0,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(12,'Gyermek 6 eves korig',0,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));
INSERT into KEDVEZMENY values(13,'Vasuti igazolvannyal rendelkezo szemely',0,TO_DATE('2017 01 01','yyyy mm dd'),TO_DATE('2017 12 31','yyyy mm dd'));

INSERT into VONAT values('Thomas','IC-Gyors', 100, 30, 1);
INSERT into VONAT values('Majonéz','IC-Gyors', 100, 30, 2);
INSERT into VONAT values('SZTE','IC-Gyors', 100, 30, 3);
INSERT into VONAT values('Paprika','Sima', 60, 30, 4);
INSERT into VONAT values('Bugacpuszta','IC-Gyors', 60, 30, 5);
INSERT into VONAT values('Sajt','IC-Gyors', 60, 30, 6);







INSERT into ALLOMAS values(1,'Budapest',1529);
INSERT into ALLOMAS values(2,'Kecskemét',2700);
INSERT into ALLOMAS values(3,'SZeged',2750);
INSERT into ALLOMAS values(4,'Eger',6000);
INSERT into ALLOMAS values(5,'Debrecen',6100);
INSERT into ALLOMAS values(6,'Zala',6700);





INSERT into FELHASZNALO values('Ady Endre', 'endre@hotmail.com', 'tank', 'Endre', 'USER');
INSERT into FELHASZNALO values('Kiss Károly', 'karoly2121@hotmail.com', '2313', 'Karoly2121', 'USER');
INSERT into FELHASZNALO values('Mátyás Király', 'matyi10@hotmail.com', 'makk', 'Matyi10', 'USER');
INSERT into FELHASZNALO values('Nemcsak Kitti', 'kiti@hotmail.com', 'hal', 'Kiti', 'USER');
INSERT into FELHASZNALO values('Véres Marok', 'M@hotmail.com', 'tank', 'M', 'USER');
INSERT into FELHASZNALO values('Czédli professzor', 'prof@hotmail.com', 'tank', 'prof', 'USER');
INSERT into FELHASZNALO values('Ady hacsak', 'hacsak@hotmail.com', 'tank', 'Hacsak', 'USER');
INSERT into FELHASZNALO values('Ady Endre', 'endre1@hotmail.com', 'tank', 'Endre1', 'USER');
INSERT into FELHASZNALO values('Hajós Alfréd', 'alfred@hotmail.com', 'tank', 'Alfred', 'USER');
INSERT into FELHASZNALO values('MÁV ADMIN', 'mav@hotmail.com', 'kesek', 'MÁV', 'ADMIN');



INSERT INTO MENET VALUES (1,1, 1, 5,  TO_TIMESTAMP('2017-07-02 08:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_TIMESTAMP('2017-04-19 09:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MENET VALUES (2,1, 5, 3,  TO_TIMESTAMP('2017-07-02 09:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_TIMESTAMP('2017-04-19 10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MENET VALUES (3,1, 1, 5,  TO_TIMESTAMP('2017-07-02 14:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_TIMESTAMP('2017-04-19 15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MENET VALUES (4,1, 5, 3,  TO_TIMESTAMP('2017-07-02 15:00', 'YYYY-MM-DD HH24:MI:SS'),  TO_TIMESTAMP('2017-04-19 16:00', 'YYYY-MM-DD HH24:MI:SS'));




INSERT into JARAT values(1, 'Budapest', 'SZeged',1, 'Gyors', 'Lehet' );
INSERT into JARAT values(2, 'Budapest', 'SZeged',2, 'Gyors', 'Lehet' );
INSERT into JARAT values(3, 'Budapest', 'Debrecen',3, 'Gyors', 'Lehet' );
INSERT into JARAT values(4, 'SZeged', 'Budapest',1, 'Gyors', 'Lehet' );
INSERT into JARAT values(5, 'SZeged', 'Budapest',2, 'Gyors', 'Lehet' );
INSERT into JARAT values(6, 'Debrecen', 'Budapest',3, 'Gyors', 'Lehet' );

INSERT into JARAT values(7, 'Budapest', 'SZeged', 'SIMA', 'Nem lehet' );
INSERT into JARAT values(8, 'Budapest', 'SZeged', 'SIMA', 'Nem lehet' );
INSERT into JARAT values(9, 'Budapest', 'Debrecen', 'SIMA', 'Nem lehet' );
INSERT into JARAT values(10, 'SZeged', 'Budapest', 'SIMA', 'Nem lehet' );
INSERT into JARAT values(11, 'SZeged', 'Budapest', 'SIMA', 'Nem lehet' );
INSERT into JARAT values(12, 'Debrecen', 'Budapest', 'SIMA', 'Nem lehet' );



CREATE OR REPLACE TRIGGER nevmodositas
BEFORE UPDATE ON FELHASZNALO
FOR EACH ROW
DECLARE
BEGIN 
  DBMS_OUTPUT.PUT_LINE('Regi nev: '|| :OLD.NEVE);
  DBMS_OUTPUT.PUT_LINE('Uj nev: '|| :NEW.NEVE);
END;

CREATE OR REPLACE TRIGGER regisztralas
BEFORE UPDATE ON FELHASZNALO
FOR EACH ROW
DECLARE
FELHASZNALO_NEVE VARCHAR2(100);
BEGIN 
  IF INSERTING THEN
    SELECT NEVE INTO FELHASZNALO_NEVE FROM FELHASZNALO WHERE NEVE=:NEW.NEVE;
    DBMS_OUTPUT.PUT_LINE('Hiba! Van mar ilyen felhasznalo nev.');
  END IF;
END;
