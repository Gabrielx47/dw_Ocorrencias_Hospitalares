use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_hospital
as
BEGIN
	insert into DIM_HOSPITAL
	select COD_HOSPITAL, NOME, RUA, BAIRRO, CIDADE 
	from TB_AUX_HOSPITAL
END