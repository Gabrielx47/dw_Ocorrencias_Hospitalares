use dw_ocorrencias_hospitalares

create or alter procedure sp_povoar_operacional
as
BEGIN
	-- Inseridos dados na tabela TB_HOSPITAL
	delete TB_HOSPITAL
	INSERT INTO TB_HOSPITAL (CNPJ, NOME, RUA, BAIRRO, CIDADE, UF)
	VALUES(1,'Centro De Especialidades De Itabaiana', 'R. Pedro Diniz Gonçalves', 'Serrano', 'Itabaina', 'SE'),
		  (2,'Hospital e Maternidade São José', 'R. Jackson de Figueiredo', 'Centro', 'Itabaina', 'SE');

	-- Inseridos dados na tabela TB_PACIENTE
	DELETE TB_PACIENTE
	INSERT INTO TB_PACIENTE (COD_SUS, NOME,CPF, RUA, BAIRRO, CIDADE, UF, SEXO, DATA_NASCIMENTO)
	VALUES(1,'Mônica Ferreira', '813.123.375-83', 'R. Itabaina', 'Centro', 'Moita Bonita', 'SE', 'F', '1995-02-10'),
		  (2,'Fernando Bezerra', '105.805.375-28', 'R. Domingos Francisco da Costa', 'Centro', 'Moita Bonita', 'SE', 'M', '2019-02-11'),
		  (3,'Letícia Araújo', '857.912.255-47', 'Av. Dr. Luiz Magalhães', 'Centro', 'Itabaiana', 'SE', 'F', '2008-05-16'),
		  (4,'José Alves da Silva', '308.270.555-36', 'R. 28 de Agosto', 'Centro', 'Itabaiana', 'SE', 'M', '1960-10-10')

	-- Inseridos dados na tabela TB_MEDICO
	DELETE TB_MEDICO
	INSERT INTO TB_MEDICO (COD_MEDICO, CRM, NOME, ESPECIALIDADE) VALUES (1, 1, 'André Nascimento', 'Clínico Geral')
	INSERT INTO TB_MEDICO (COD_MEDICO, CRM, NOME, ESPECIALIDADE) VALUES (2, 2, 'Andréia Leal', 'Clínico Geral')
	
	-- Inseridos dados na tabela TB_DOENCA
	DELETE TB_DOENCA
	INSERT INTO TB_DOENCA(COD_DOENCA, NOME) VALUES (1, 'COVID')
	INSERT INTO TB_DOENCA(COD_DOENCA, NOME) VALUES (2, 'RESFRIADO')

	-- Inseridos dados na tabela TB_OCORRENCIA
	DELETE TB_OCORRENCIA
	INSERT INTO TB_OCORRENCIA(COD_OCORRENCIA, DT_DATA, COD_MEDICO, CNPJ, COD_SUS, COD_DOENCA)
	VALUES(1, GETDATE(), 1,1, 1, 1)
	INSERT INTO TB_OCORRENCIA(COD_OCORRENCIA, DT_DATA, COD_MEDICO, CNPJ, COD_SUS, COD_DOENCA)
	VALUES(2, GETDATE(), 1,1, 2, 2)

END

-- Executando o procedimento
exec sp_povoar_operacional