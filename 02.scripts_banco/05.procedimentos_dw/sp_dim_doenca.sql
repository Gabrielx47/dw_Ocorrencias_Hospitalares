use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_doenca(@DATA_CARGA datetime)
as
BEGIN
	declare @COD_DOENCA int, @NOME VARCHAR(50)

	declare doencas cursor 
	for select COD_DOENCA, NOME
	from TB_AUX_DOENCA
	where DATA_CARGA = @DATA_CARGA

	open doencas

	fetch next from doencas
	into @COD_DOENCA, @NOME

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		if(@COD_DOENCA in (select COD_DOENCA from DIM_DOENCA))
		BEGIN
			update DIM_DOENCA
			set COD_DOENCA = @COD_DOENCA, NOME = @NOME
			where COD_DOENCA = @COD_DOENCA
		END
		else
		BEGIN
			insert into DIM_DOENCA
			values(@COD_DOENCA, @NOME)
		END

		fetch next from doencas
		into @COD_DOENCA, @NOME
	END
	
	close doencas
	deallocate doencas
END

-- Executando procedimento
exec sp_dim_doenca'20221020'

select * from DIM_DOENCA