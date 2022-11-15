create or alter procedure sp_oltp_paciente(@dataCarga datetime)
as
begin
	insert into tb_aux_paciente
	select @dataCarga, cod_sus, nome, cpf, rua, bairro, cidade, data_nascimento, sexo
	from tb_paciente
end
