use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_doenca
as
BEGIN
	insert into DIM_DOENCA
	select COD_DOENCA, NOME
	from TB_AUX_DOENCA
END