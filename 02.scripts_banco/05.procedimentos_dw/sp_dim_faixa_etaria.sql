use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_faixa_etaria(@DATA_CARGA datetime) 
as
begin
	insert into DIM_FAIXA_ETARIA
	select COD_FAIXA_ETARIA, IDADE_INICIAL, IDADE_FINAL, FAIXA_ETARIA
	from TB_AUX_FAIXA_ETARIA
	where DATA_CARGA = @DATA_CARGA
end