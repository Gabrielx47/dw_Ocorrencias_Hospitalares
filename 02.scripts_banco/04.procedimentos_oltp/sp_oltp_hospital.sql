use dw_ocorrencias_hospitalares

create or alter procedure sp_oltp_hospital(@dataCarga datetime)
as
begin
	insert into tb_aux_hospital
	select @dataCarga, CNPJ, nome, rua, bairro, cidade
	from tb_hospital
end

-- Executando procedimento
exec sp_oltp_hospital '20221020'

select * from TB_AUX_HOSPITAL
