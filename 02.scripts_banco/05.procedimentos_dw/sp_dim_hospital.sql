use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_hospital(@DATA_CARGA datetime)
as
BEGIN
	insert into DIM_HOSPITAL
	select COD_HOSPITAL, NOME, RUA, BAIRRO, CIDADE 
	from TB_AUX_HOSPITAL
	where DATA_CARGA = @DATA_CARGA
END