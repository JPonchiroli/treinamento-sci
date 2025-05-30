DROP TABLE TCARRO
CREATE TABLE TCARRO (
    BDCODCAR    INTEGER,
    BDNOMECAR   VARCHAR(174),
    BDPLACACAR  VARCHAR(8),
    BDVALORCAR  NUMERIC(12,2)
);

ALTER TABLE TCARRO DROP BDCODCAR
ALTER TABLE TCARRO ADD BDCODCAR INTEGER NOT NULL

ALTER TABLE TCARRO ADD
CONSTRAINT PK_TCARRO PRIMARY KEY (BDCODCAR)

INSERT INTO TCARRO (BDCODCAR, BDNOMECAR, BDPLACACAR, BDVALORCAR)
VALUES
(1, 'Passat ano 78, branco', 'QWS-8876', 3000.32)

INSERT INTO TCARRO (BDCODCAR, BDNOMECAR, BDPLACACAR, BDVALORCAR)
VALUES
(2, 'Audi TT', 'QWS-7744', 50200.32)


-- ALTER TABLE TCARRO ALTER BDCODCID TO BDCODCIDADE -- Alterar nome do campo

ALTER TABLE TCARRO ADD BDCODCID INTEGER

ALTER TABLE TCARRO ADD
CONSTRAINT FK_TCARRO_CIDADE FOREIGN KEY(BDCODCID)
REFERENCES TCIDADE(BDCODCID)

UPDATE TCARRO
SET BDCODCID = 2,
    BDNOMECAR LIKE 'Fusca'
WHERE BDCODCAR = 1

UPDATE TCARRO
SET BDCODCID = 1
WHERE BDCODCAR = 2

-----------------------------------------

DROP TABLE TCIDADE
CREATE TABLE TCIDADE (
    BDCODCID    INTEGER,
    BDNOMECID   VARCHAR(84),
    BDUF        CHAR(2)
);

ALTER TABLE TCIDADE DROP BDCODCID
ALTER TABLE TCIDADE ADD BDCODCID INTEGER NOT NULL

ALTER TABLE TCIDADE ADD
CONSTRAINT PK_TCIDADE PRIMARY KEY (BDCODCID)

INSERT INTO TCIDADE (BDCODCID, BDNOMECID, BDUF)
VALUES (1, 'Blumenau', 'SC')

INSERT INTO TCIDADE (BDCODCID, BDNOMECID, BDUF)
VALUES (2, 'Gaspar', 'SC')

INSERT INTO TCIDADE (BDCODCID, BDNOMECID, BDUF)
VALUES (3, 'Curitiba', 'PR')
