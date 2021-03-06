CREATE TABLE JUGADORES
(NUM_JUGADORE INT PRIMARY KEY
, NUM_EQUIPO INT
, JNOMBRE NVARCHAR(50));

CREATE TABLE EQUIPO
(NUM_EQUIPO INT PRIMARY KEY
, NOM_EQUIPO NVARCHAR(50)
, CIUDAD NVARCHAR(50));

CREATE view InformacionJugadores
as
	select ISNULL(IDEMJUGADOR, 0) as IDEMJUGADOR, JNOMBRE, NOM_EQUIPO, CIUDAD FROM
	(select JUGADORES.NUM_JUGADORE as IDEMJUGADOR, JUGADORES.JNOMBRE, EQUIPO.NOM_EQUIPO, EQUIPO.CIUDAD from JUGADORES
	inner join EQUIPO on JUGADORES.NUM_EQUIPO=EQUIPO.NUM_EQUIPO) CONSULTA
go
select * from InformacionJugadores;
INSERT INTO EQUIPO VALUES (10, 'LAKERS', 'LOS ANGELES');
INSERT INTO EQUIPO VALUES (20, 'BULLS', 'ILLINOIS');
INSERT INTO EQUIPO VALUES (30, 'SPURS', 'SAN ANTONIO');
INSERT INTO EQUIPO VALUES (40, 'GOLDEN STATE WARRIORS', 'OAKLAND');
SELECT * FROM EQUIPO;
INSERT INTO JUGADORES VALUES (23, 10, 'LEBRON JAMES');
INSERT INTO JUGADORES VALUES (19, 10, 'TOMAS A');
INSERT INTO JUGADORES VALUES (12, 10, 'TOMAS B');
INSERT INTO JUGADORES VALUES (13, 10, 'TOMAS C');
INSERT INTO JUGADORES VALUES (14, 10, 'TOMAS D');

INSERT INTO JUGADORES VALUES (8, 20, 'ZACH LAVINE');
INSERT INTO JUGADORES VALUES (16, 30, 'PAU GASOL');
INSERT INTO JUGADORES VALUES (30, 40, 'STEPHEN CURRY');
SELECT * FROM JUGADORES;
select * from InformacionJugadores;