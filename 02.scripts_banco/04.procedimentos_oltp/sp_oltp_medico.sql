create or alter procedure sp_oltp_medico(@dataCarga datetime)
as
begin

    
	insert into tb_aux_medico
	select @data_carga, cod_medico, nome, crm, especialidade
	from tb_medico
end