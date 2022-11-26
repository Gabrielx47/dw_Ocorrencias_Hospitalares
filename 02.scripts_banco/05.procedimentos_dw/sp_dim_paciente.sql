use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_paciente(@DATA_CARGA datetime)
as
BEGIN
	declare @COD_PACIENTE int, @NOME VARCHAR(100), @CPF VARCHAR(15), @RUA VARCHAR(100), @BAIRRO VARCHAR(100), @CIDADE VARCHAR(50), @SEXO varchar(3), @DATA_NASCIMENTO date

	declare pacientes cursor 
	for select COD_PACIENTE, NOME, CPF, RUA, BAIRRO, CIDADE, DATA_NASCIMENTO, SEXO
	from TB_AUX_PACIENTE
	where DATA_CARGA = @DATA_CARGA

	open pacientes

	fetch next from pacientes
	into @COD_PACIENTE, @NOME, @CPF, @RUA, @BAIRRO, @CIDADE, @DATA_NASCIMENTO, @SEXO

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		if(@COD_PACIENTE in (select COD_PACIENTE from DIM_PACIENTE))
		BEGIN
			update DIM_PACIENTE
			set COD_PACIENTE = @COD_PACIENTE, NOME = @NOME, CPF = @CPF, RUA = @RUA, BAIRRO = @BAIRRO, CIDADE = @CIDADE, DATA_NASCIMENTO = @DATA_NASCIMENTO, SEXO = @SEXO
			where COD_PACIENTE = @COD_PACIENTE
		END
		else
		BEGIN
			insert into DIM_PACIENTE
			values(@COD_PACIENTE, @NOME, @CPF, @RUA, @BAIRRO, @CIDADE, @DATA_NASCIMENTO, @SEXO)
		END

		fetch next from pacientes
		into @COD_PACIENTE, @NOME, @CPF, @RUA, @BAIRRO, @CIDADE, @DATA_NASCIMENTO, @SEXO
	END
	
	close pacientes
	deallocate pacientes
END

-- Executando procedimento
exec sp_dim_paciente'20221020'

select * from DIM_PACIENTE