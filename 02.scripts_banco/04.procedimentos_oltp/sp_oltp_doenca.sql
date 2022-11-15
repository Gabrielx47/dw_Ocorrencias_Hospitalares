use dw_ocorrencias_hospitalares

create or alter procedure sp_oltp_doenca(@data_carga date) 
as
begin
	insert into TB_AUX_DOENCA
	select @data_carga, COD_DOENCA, NOME 
	FROM TB_DOENCA
end

--Executando o procedimento
exec sp_oltp_doenca '20221020'

select * from tb_aux_doenca