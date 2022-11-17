use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_doenca
as
BEGIN
	insert into DIM_MEDICO
	select COD_DOENCA, NOME
	from TB_AUX_MEDICO
END