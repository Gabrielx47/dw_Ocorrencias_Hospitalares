use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_faixa_etaria(@DATA_CARGA datetime) 
as
begin
	declare @COD_FAIXA_ETARIA int, @IDADE_INICIAL VARCHAR(100), @IDADE_FINAL VARCHAR(100), @FAIXA_ETARIA VARCHAR(100)

	declare faixas_etarias cursor 
	for select COD_FAIXA_ETARIA, IDADE_INICIAL, IDADE_FINAL, FAIXA_ETARIA
	from TB_AUX_FAIXA_ETARIA
	where DATA_CARGA = @DATA_CARGA


	open faixas_etarias

	fetch next from faixas_etarias
	into @COD_FAIXA_ETARIA, @IDADE_INICIAL, @IDADE_FINAL, @FAIXA_ETARIA

	WHILE(@@FETCH_STATUS = 0)
	BEGIN
		if(@COD_FAIXA_ETARIA in (select COD_FAIXA_ETARIA from DIM_FAIXA_ETARIA))
		BEGIN
			update DIM_FAIXA_ETARIA
			set COD_FAIXA_ETARIA = @COD_FAIXA_ETARIA, IDADE_INICIAL = @IDADE_INICIAL, IDADE_FINAL = @IDADE_FINAL, FAIXA_ETARIA =@FAIXA_ETARIA
			where COD_FAIXA_ETARIA = @COD_FAIXA_ETARIA
		END
		else
		BEGIN
			insert into DIM_FAIXA_ETARIA
			values(@COD_FAIXA_ETARIA, @IDADE_INICIAL, @IDADE_FINAL, @FAIXA_ETARIA)
		END

		fetch next from faixas_etarias
	into @COD_FAIXA_ETARIA, @IDADE_INICIAL, @IDADE_FINAL, @FAIXA_ETARIA
	END
	
	close faixas_etarias
	deallocate faixas_etarias
end

-- Executando procedimento
exec sp_dim_faixa_etaria'20221020'

select * from DIM_FAIXA_ETARIA