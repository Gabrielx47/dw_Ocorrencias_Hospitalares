use dw_ocorrencias_hospitalares

create or alter procedure sp_oltp_faixa_etaria(@dataCarga datetime)
as
begin

	insert into tb_aux_faixa_etaria
	values (@dataCarga, 1, '0', '11', 'Criança'),
	       (@dataCarga, 2, '12', '20', 'Adolescente'),
		   (@dataCarga, 3, '21', '65', 'Adulto'),
		   (@dataCarga, 1, '66', 'Ou mais', 'Idoso')
	-- Link com as faixas etárias: https://www.todamateria.com.br/fases-da-vida/
end


-- Executando o procedimento
exec sp_oltp_faixa_etaria '20220410'

SELECT * FROM TB_AUX_FAIXA_ETARIA
