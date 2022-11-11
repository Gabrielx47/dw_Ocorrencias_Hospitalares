create or alter procedure sp_oltp_paciente(@dataCarga datetime)
as
begin

	insert into tb_aux_paciente
	select @data_carga, cod_paciente, nome, cpf, rua, bairro, cidade, data_nascimento, sexo
	from tb_paciente
end