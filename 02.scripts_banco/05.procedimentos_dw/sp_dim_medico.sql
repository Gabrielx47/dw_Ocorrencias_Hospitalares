use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_medico(@DATA_CARGA datetime)
as
BEGIN
	declare @COD_MEDICO int, @NOME VARCHAR(100), @CRM int, @ESPECIALIDADE VARCHAR(100)

	declare medicos cursor 
	for select COD_MEDICO, NOME, CRM, ESPECIALIDADE
	from TB_AUX_MEDICO
	where DATA_CARGA = @DATA_CARGA

	open medicos

	fetch next from medicos
	into @COD_MEDICO, @NOME, @CRM, @ESPECIALIDADE

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		if(@COD_MEDICO in (select COD_MEDICO from DIM_MEDICO))
		BEGIN
			update DIM_MEDICO
			set COD_MEDICO = @COD_MEDICO, NOME = @NOME, CRM = @CRM, ESPECIALIDADE = @ESPECIALIDADE
			where COD_MEDICO = @COD_MEDICO
		END
		else
		BEGIN
			insert into DIM_MEDICO
			values(@COD_MEDICO, @NOME, @CRM, @ESPECIALIDADE)
		END

		fetch next from medicos
		into @COD_MEDICO, @NOME, @CRM, @ESPECIALIDADE
	END
	
	close medicos
	deallocate medicos
END

-- Executando procedimento
exec sp_dim_medico'20221020'

select * from DIM_MEDICO