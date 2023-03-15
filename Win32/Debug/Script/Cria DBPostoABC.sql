SET SQL DIALECT 3;

SET NAMES WIN1252;

SET CLIENTLIB 'C:\Program Files (x86)\Firebird\Firebird_4_0\fbclient.dll';

CREATE DATABASE 'D:\Teste\Fortes Inform�tica\Win32\Debug\DB\DBPostoABC.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;

/******************************************************************************/

CREATE GENERATOR GEN_ABASTECIMENTO_ID START WITH 1 INCREMENT BY 1;
SET GENERATOR GEN_ABASTECIMENTO_ID TO 0;

CREATE GENERATOR GEN_BOMBA_ID START WITH 1 INCREMENT BY 1;
SET GENERATOR GEN_BOMBA_ID TO 0;

CREATE GENERATOR GEN_TANQUE_ID START WITH 1 INCREMENT BY 1;
SET GENERATOR GEN_TANQUE_ID TO 0;

/******************************************************************************/

RECREATE TABLE ABASTECIMENTO (
    IDABASTECIMENTO  INTEGER NOT NULL,
    PERCIMPOSTO      NUMERIC(15,2) NOT NULL,
    DIA              DATE NOT NULL,
    LITROS           NUMERIC(15,2) NOT NULL,
    VALORABASTECIDO  NUMERIC(15,2) NOT NULL,
    BOMBA            INTEGER NOT NULL
);

RECREATE TABLE BOMBA (
    IDBOMBA          INTEGER NOT NULL,
    NOMEBOMBA        VARCHAR(80) NOT NULL,
    TIPOCOMBUSTIVEL  VARCHAR(40) NOT NULL
);

RECREATE TABLE TANQUE (
    IDTANQUE    INTEGER NOT NULL,
    NOMETANQUE  VARCHAR(40) NOT NULL,
    BOMBA       INTEGER NOT NULL
);

/******************************************************************************/

ALTER TABLE ABASTECIMENTO ADD CONSTRAINT PK_ABASTECIMENTO PRIMARY KEY (IDABASTECIMENTO);
ALTER TABLE BOMBA ADD CONSTRAINT PK_BOMBA PRIMARY KEY (IDBOMBA);
ALTER TABLE TANQUE ADD CONSTRAINT PK_TANQUE PRIMARY KEY (IDTANQUE);
ALTER TABLE ABASTECIMENTO ADD CONSTRAINT FK_ABASTECIMENTO_1 FOREIGN KEY (BOMBA) REFERENCES BOMBA (IDBOMBA);
ALTER TABLE TANQUE ADD CONSTRAINT FK_TANQUE_1 FOREIGN KEY (BOMBA) REFERENCES BOMBA (IDBOMBA);

/******************************************************************************/

CREATE OR ALTER TRIGGER ABASTECIMENTO_BI FOR ABASTECIMENTO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.idabastecimento is null) then
    new.idabastecimento = gen_id(gen_abastecimento_id,1);
end;

CREATE OR ALTER TRIGGER BOMBA_BI FOR BOMBA
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.idbomba is null) then
    new.idbomba = gen_id(gen_bomba_id,1);
end;

CREATE OR ALTER TRIGGER TANQUE_BI FOR TANQUE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.idtanque is null) then
    new.idtanque = gen_id(gen_tanque_id,1);
end;