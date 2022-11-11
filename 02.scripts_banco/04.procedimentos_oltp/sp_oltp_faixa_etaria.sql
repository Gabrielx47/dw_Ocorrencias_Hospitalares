create or alter procedure sp_oltp_faixa_etaria(@dataCarga datetime)
as
begin

	insert into tb_aux_faixa_etaria
	select @data_carga, cod_faixa_etaria, idade_inicial, idade_final, faixa_etaria
	from tb_faixa_etaria
end