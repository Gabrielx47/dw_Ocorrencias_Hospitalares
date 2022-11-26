use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_hospital(@DATA_CARGA datetime)
as
BEGIN
	declare @COD_HOSPITAL int, @NOME varchar(100), @RUA varchar(100), @BAIRRO varchar(100), @CIDADE varchar(50)

	declare hospitais cursor 
	for select COD_HOSPITAL, NOME, RUA, BAIRRO, CIDADE 
	from TB_AUX_HOSPITAL
	where DATA_CARGA = @DATA_CARGA

	open hospitais

	fetch next from hospitais
	into @COD_HOSPITAL, @NOME, @RUA, @BAIRRO, @CIDADE

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		if(@COD_HOSPITAL in (select COD_HOSPITAL from DIM_HOSPITAL))
		BEGIN
			update DIM_HOSPITAL
			set COD_HOSPITAL = @COD_HOSPITAL, NOME = @NOME, RUA = @RUA, BAIRRO = @BAIRRO, CIDADE = @CIDADE
			where COD_HOSPITAL = @COD_HOSPITAL
		END
		else
		BEGIN
			insert into DIM_HOSPITAL
			values(@COD_HOSPITAL, @NOME, @RUA, @BAIRRO, @CIDADE)
		END

		fetch next from hospitais
		into @COD_HOSPITAL, @NOME, @RUA, @BAIRRO, @CIDADE
	END
	
	close hospitais
	deallocate hospitais
END

-- Executando procedimento
exec sp_dim_hospital'20221020'

select * from DIM_HOSPITAL