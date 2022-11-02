-- Scripts ddl para o ambiente dimensional

USE dw_ocorencias_hospitalares

DROP TABLE IF EXISTS FATO_OCORRENCIA
DROP TABLE IF EXISTS DIM_TEMPO
DROP TABLE IF EXISTS DIM_HOSPITAL
DROP TABLE IF EXISTS DIM_MEDICO
DROP TABLE IF EXISTS DIM_DOENCA
DROP TABLE IF EXISTS DIM_PACIENTE
DROP TABLE IF EXISTS DIM_FAIXA_ETARIA


CREATE TABLE DIM_MEDICO (
   ID_MEDICO INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   COD_MEDICO INT NOT NULL,
   NOME VARCHAR(100) NOT NULL,
   CRM INT NOT NULL,
   ESPECIALIDADE VARCHAR(100) NOT NULL
)


CREATE INDEX IX_DIM_MEDICO_COD_MEDICO ON DIM_MEDICO(COD_MEDICO)

CREATE TABLE DIM_PACIENTE (
	ID_PACIENTE INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	COD_PACIENTE INT NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	CPF VARCHAR(15) NOT NULL,
	RUA VARCHAR(100) NOT NULL,
	BAIRRO VARCHAR(100) NOT NULL,
	CIDADE VARCHAR(50) NOT NULL,
	DATA_NASCIMENTO DATE,
	SEXO VARCHAR(3) NOT NULL CHECK(SEXO IN ('S','F'))
)


CREATE INDEX IX_DIM_PACIENTE_COD_PACIENTE ON DIM_PACIENTE(COD_PACIENTE)


CREATE TABLE DIM_DOENCA (
    ID_DOENCA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	COD_DOENCA INT NOT NULL,
	NOME VARCHAR(100) NOT NULL
	
)


CREATE INDEX IX_DIM_DOENCA_COD_DOENCA ON DIM_DOENCA(COD_DOENCA)

CREATE TABLE DIM_FAIXA_ETARIA (
	ID_FAIXA_ETARIA INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	IDADE_INICIAL VARCHAR(100),
	IDADE_FINAL VARCHAR(100),
	FAIXA_ETARIA VARCHAR(100)
)

CREATE INDEX IX_DIM_FAIXA_ETARIA 
ON DIM_FAIXA_ETARIA(ID_FAIXA_ETARIA)


CREATE TABLE DIM_HOSTIPAL (
	ID_HOSPITAL INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	COD_HOSTIPAL INT NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	RUA VARCHAR(100) NOT NULL,
	BAIRRO VARCHAR(100) NOT NULL,
	CIDADE VARCHAR(50) NOT NULL
)

CREATE INDEX IX_DIM_HOSTIPAL_COD_HOSPITAL ON DIM_HOSTIPAL(COD_HOSPITAL)

CREATE TABLE DIM_TEMPO (
	ID_TEMPO BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	DATA DATETIME NULL,
	DIA INT  NULL,
	MES INT  NULL,
	ANO INT NOT NULL,
	TRIMESTRE INT  NULL,
	SEMESTRE INT  NULL,
	NOME_TRIMESTRE VARCHAR(100)  NULL,
	NOME_SEMESTRE VARCHAR(100)  NULL,
	DIA_SEMANA VARCHAR(50)  NULL
)

CREATE INDEX IX_DIM_TEMPO ON DIM_TEMPO (DATA)


CREATE TABLE FATO_OCORRENCIA (
	ID_DOENCA BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ID_TEMPO BIGINT NOT NULL,
	ID_HOSPITAL INT NOT NULL,
	ID_PACIENTE INT NOT NULL,
	ID_MEDICO INT NOT NULL,
	ID_FAIXA_ETARIA INT NOT NULL,
	QUANTIDADE INT NOT NULL DEFAULT (1)
	CONSTRAINT FK_DIM_DOENCA FOREIGN KEY (ID_DOENCA) REFERENCES DIM_DOENCA (ID_DOENCA),
	CONSTRAINT FK_DIM_HOSPITAL FOREIGN KEY (ID_HOSPITAL) REFERENCES DIM_HOSPITAL(ID_HOSPITAL),
	CONSTRAINT FK_DIM_PACIENTE FOREIGN KEY (ID_PACIENTE) REFERENCES DIM_PACIENTE (ID_PACIENTE),
	CONSTRAINT FK_DIM_TEMPO FOREIGN KEY (ID_TEMPO) REFERENCES DIM_TEMPO (ID_TEMPO),
	CONSTRAINT FK_DIM_FAIXA_ETARIA FOREIGN KEY (ID_FAIXA_ETARIA) REFERENCES DIM_FAIXA_ETARIA (ID_FAIXA_ETARIA),
	CONSTRAINT FK_DIM_MEDICO FOREIGN KEY (ID_MEDICO) REFERENCES DIM_MEDICO(ID_MEDICO)
)


CREATE INDEX IX_FATO_OCORRENCIA_TEMPO ON FATO_OCORRENCIA(ID_TEMPO)
CREATE INDEX IX_FATO_OCORRENCIA_HOSPITAL ON FATO_OCORRENCIA(ID_HOSPITAL)
CREATE INDEX IX_FATO_OCORRENCIA_FAIXA_ETARIA ON FATO_OCORRENCIA(ID_FAIXA_ETARIA)
CREATE INDEX IX_FATO_OCORRENCIA_DOENCA ON FATO_OCORRENCIA(ID_DOENCA)
CREATE INDEX IX_FATO_OCORRENCIA_PACIENTE ON FATO_OCORRENCIA(ID_PACIENTE)
CREATE INDEX IX_FATO_OCORRENCIA_MEDICO ON FATO_OCORRENCIA(COD_MEDICO)