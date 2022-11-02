-- Scripts ddl para a �rea de staging

USE dw_ocorrencias_hospitalares

DROP TABLE IF EXISTS TB_AUX_HOSPITAL
DROP TABLE IF EXISTS TB_AUX_FAIXA_ETARIA
DROP TABLE IF EXISTS TB_AUX_DOENCA
DROP TABLE IF EXISTS TB_AUX_PACIENTE
DROP TABLE IF EXISTS TB_AUX_MEDICO

CREATE TABLE TB_AUX_HOSPITAL (
    ID_HOSPITAL INT NOT NULL,
	COD_HOSTIPAL INT NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	RUA VARCHAR(100) NOT NULL,
	BAIRRO VARCHAR(100) NOT NULL,
	CIDADE VARCHAR(50) NOT NULL
)

CREATE TABLE TB_AUX_FAIXA_ETARIA(
    ID_FAIXA_ETARIA INT NOT NULL,
	IDADE_INICIAL VARCHAR(100),
	IDADE_FINAL VARCHAR(100),
	FAIXA_ETARIA VARCHAR(100)
)

CREATE TABLE TB_AUX_DOENCA(
    ID_DOENCA INT NOT NULL,
	COD_DOENCA INT NOT NULL,
	NOME VARCHAR(100) NOT NULL
)

CREATE TABLE TB_AUX_PACIENTE(
    ID_PACIENTE INT NOT NULL,
	COD_PACIENTE INT NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	CPF VARCHAR(15) NOT NULL,
	RUA VARCHAR(100) NOT NULL,
	BAIRRO VARCHAR(100) NOT NULL,
	CIDADE VARCHAR(50) NOT NULL,
	DATA_NASCIMENTO DATE,
	SEXO VARCHAR(3) NOT NULL CHECK(SEXO IN ('S','F'))
)

CREATE TABLE TB_AUX_MEDICO(
   ID_MEDICO INT NOT NULL,
   COD_MEDICO INT NOT NULL,
   NOME VARCHAR(100) NOT NULL,
   CRM INT NOT NULL,
   ESPECIALIDADE VARCHAR(100) NOT NULL
)
