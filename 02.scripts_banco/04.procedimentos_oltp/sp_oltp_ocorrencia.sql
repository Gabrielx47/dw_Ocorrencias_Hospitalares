use dw_ocorrencias_hospitalares

create or alter procedure sp_oltp_ocorrencia(@dataCarga datetime) 
as
BEGIN
	declare @CNPJ int, @DATA_NASCIMENTO datetime, @COD_DOENCA int, @COD_MEDICO int, @COD_SUS int, @idade int, @COD_FAIXA_ETARIA int

	declare ocorrencias cursor
	for select O.CNPJ, p.DATA_NASCIMENTO, p.COD_SUS, d.COD_DOENCA, m.COD_MEDICO
	from TB_OCORRENCIA O inner join TB_HOSPITAL h on(O.CNPJ = h.CNPJ) 
	inner join TB_PACIENTE p on(O.COD_SUS = p.COD_SUS) 
	inner join TB_DOENCA d on(O.COD_DOENCA = d.COD_DOENCA)
	inner join TB_MEDICO m on(O.COD_MEDICO = m.COD_MEDICO)

	open ocorrencias

	fetch next from ocorrencias
	into @CNPJ, @DATA_NASCIMENTO, @COD_SUS, @COD_DOENCA, @COD_MEDICO

	while @@FETCH_STATUS = 0
	BEGIN
		set @idade = (datediff(year, @DATA_NASCIMENTO, GETDATE()))
		
		-- Selecionando o código da faixa etária do paciente
		if(@idade <= 12)
		BEGIN
			SET @COD_FAIXA_ETARIA = 1
		END
		else
		BEGIN
			if(@idade < 21)
			BEGIN
				SET @COD_FAIXA_ETARIA = 2
			END
			else
			BEGIN
				if(@idade < 66)
				BEGIN
					SET @COD_FAIXA_ETARIA = 3
				END
				else
				BEGIN
					SET @COD_FAIXA_ETARIA = 4	
				END
			END
		END

		insert into TB_AUX_OCORRENCIA
		values(@dataCarga, @CNPJ, @COD_FAIXA_ETARIA, @COD_DOENCA, @COD_SUS, @COD_MEDICO, 1)

		fetch next from ocorrencias
		into @CNPJ, @DATA_NASCIMENTO, @COD_SUS, @COD_DOENCA, @COD_MEDICO
	END

	close ocorrencias
	deallocate ocorrencias
END

-- Executando procedimento
exec sp_oltp_ocorrencia'20221020'

select * from TB_AUX_OCORRENCIA