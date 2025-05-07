-- CREATE DATABASE Academia


CREATE TABLE TPessoa (
    BDCOD     INTEGER,
    BDNOME    VARCHAR(67),
    BDSALARIO NUMERIC(10,2) -- Ponto Flutuante, 12 caracteres com duas casas decimais apos virgula
)

ALTER TABLE TPessoa ADD BDCPF CHAR(14)

ALTER TABLE TPessoa ADD BDAPAGA BOOLEAN
ALTER TABLE TPessoa DROP BDAPAGA

DROP TABLE TPessoa