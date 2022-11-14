use dw_ocorrencias_hospitalares

create or alter procedure sp_oltp_ocorrencia(@dataCarga datetime) 
as
BEGIN
	insert into TB_AUX_OCORRENCIA
	select @dataCarga, O.CNPJ, p.DATA_NASCIMENTO, 
	from TB_OCORRENCIA O inner join TB_HOSPITAL h on(O.CNPJ = h.CNPJ) 
	inner join TB_PACIENTE p on(O.COD_SUS = p.COD_SUS) 
	inner join TB_DOENCA d on(O.COD_OCORRENCIA)
END