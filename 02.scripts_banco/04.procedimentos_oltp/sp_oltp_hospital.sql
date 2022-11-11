create or alter procedure sp_oltp_hospital(@dataCarga datetime)
as
begin
	insert into tb_aux_hospital
	-- CNPJ = COD_HOSPITAL
	select @datacarga, CNPJ, nome, rua, bairro, cidade
	from tb_hospital
end
