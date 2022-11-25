use dw_ocorrencias_hospitalares

create or alter procedure sp_oltp_medico(@dataCarga datetime)
as
begin
	insert into tb_aux_medico
	select @dataCarga, cod_medico, nome, crm, especialidade 
	from tb_medico
end

-- Executando procedimento
exec sp_oltp_medico'20221020'

select * from TB_AUX_MEDICO

