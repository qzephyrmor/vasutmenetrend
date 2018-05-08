create table felhasznalo(
  name VARCHAR2(127),
  username VARCHAR2(32),
  email VARCHAR2(1024),
  password VARCHAR2(32),
  user_id NUMBER(4),
  active NUMBER(11),
    PRIMARY KEY(user_id)
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