create or alter procedure sp_oltp_hospital(@dataCarga datetime)
as
begin

    
	insert into tb_aux_hospital
	select @data_carga, cod_hospital, nome, rua, bairro, cidade
	from tb_hospital
end