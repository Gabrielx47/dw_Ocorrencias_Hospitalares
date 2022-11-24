use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_doenca(@DATA_CARGA datetime)
as
BEGIN
	insert into DIM_DOENCA
	select COD_DOENCA, NOME
	from TB_AUX_DOENCA
	where DATA_CARGA = @DATA_CARGA
END