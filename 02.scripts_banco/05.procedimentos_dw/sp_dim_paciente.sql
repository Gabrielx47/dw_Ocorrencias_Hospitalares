use dw_ocorrencias_hospitalares

create or alter procedure sp_dim_paciente(@DATA_CARGA datetime)
as
BEGIN
	insert into DIM_PACIENTE
	select COD_PACIENTE, NOME, CPF, RUA, BAIRRO, CIDADE, SEXO, DATA_NASCIMENTO
	from TB_AUX_PACIENTE
	where DATA_CARGA = @DATA_CARGA 
END