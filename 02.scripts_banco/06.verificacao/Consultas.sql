use dw_ocorrencias_hospitalares

-- Indicadores
-- Quantos casos de uma determinada doença ocorreram por dia?
select D.NOME, T.DATA, SUM(FO.QUANTIDADE) AS 'NÚMERO DE CASOS POR DIA'
from FATO_OCORRENCIA FO INNER JOIN DIM_DOENCA D ON(FO.ID_DOENCA = D.ID_DOENCA)
INNER JOIN DIM_TEMPO T ON(FO.ID_TEMPO = T.ID_TEMPO)
WHERE D.NOME = 'covid' AND T.ANO = 2022
GROUP BY D.NOME, T.DATA

-- Quantos casos de uma determinada doença ocorreram  em uma determinada cidade, UF ou bairro?
select D.NOME, P.CIDADE, SUM(FO.QUANTIDADE) AS 'NÚMERO DE CASOS POR CIDADE'
from FATO_OCORRENCIA FO INNER JOIN DIM_DOENCA D ON(FO.ID_DOENCA = D.ID_DOENCA)
INNER JOIN DIM_PACIENTE P ON(FO.ID_PACIENTE = P.ID_PACIENTE)
WHERE D.NOME = 'resfriado'
GROUP BY D.NOME, P.CIDADE

-- Quantas pessoas foram detectadas com determinada doença que são de sexo feminino?
select D.NOME, P.SEXO, SUM(FO.QUANTIDADE) AS 'NÚMERO DE PESSOAS'
from FATO_OCORRENCIA FO INNER JOIN DIM_DOENCA D ON(FO.ID_DOENCA = D.ID_DOENCA)
INNER JOIN DIM_PACIENTE P ON(FO.ID_PACIENTE = P.ID_PACIENTE)
WHERE D.NOME = 'covid' AND P.SEXO = 'F'
GROUP BY D.NOME, P.SEXO

-- Quantas pessoas foram detectadas com determinada doença que são de sexo masculino?
select D.NOME, P.SEXO, SUM(FO.QUANTIDADE) AS 'NÚMERO DE PESSOAS'
from FATO_OCORRENCIA FO INNER JOIN DIM_DOENCA D ON(FO.ID_DOENCA = D.ID_DOENCA)
INNER JOIN DIM_PACIENTE P ON(FO.ID_PACIENTE = P.ID_PACIENTE)
WHERE D.NOME = 'resfriado' AND P.SEXO = 'M'
GROUP BY D.NOME, P.SEXO