use dw_ocorrencias_hospitalares

create or alter procedure sp_oltp_ocorrencia(@dataCarga datetime) 
as
BEGIN
	insert into TB_AUX_OCORRENCIA
	select @dataCarga, O.CNPJ, p.DATA_NASCIMENTO, d.COD_DOENCA, m.COD_MEDICO, p.COD_SUS, 1 
	from TB_OCORRENCIA O inner join TB_HOSPITAL h on(O.CNPJ = h.CNPJ) 
	inner join TB_PACIENTE p on(O.COD_SUS = p.COD_SUS) 
	inner join TB_DOENCA d on(O.COD_DOENCA = d.COD_DOENCA)
	inner join TB_MEDICO m on(O.COD_MEDICO = m.COD_MEDICO)
END