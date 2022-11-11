create or alter procedure sp_oltp_medico(@dataCarga datetime)
as
begin
	insert into tb_aux_medico
	select @dataCarga, cod_medico, nome, crm
	from tb_medico
end