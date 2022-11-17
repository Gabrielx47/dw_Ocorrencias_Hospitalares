use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_medico
as
BEGIN
	insert into DIM_MEDICO
	select COD_medico, CRM, NOME, ESPECIALIDADE
	from TB_AUX_MEDICO
END