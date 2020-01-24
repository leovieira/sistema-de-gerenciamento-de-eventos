--
-- File generated with SQLiteStudio v3.1.1 on sáb nov 30 13:57:19 2019
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: administrador
CREATE TABLE administrador (cod_administrador INTEGER PRIMARY KEY NOT NULL UNIQUE, nome VARCHAR (200) NOT NULL, usuario VARCHAR (200) NOT NULL, senha VARCHAR (200) NOT NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
