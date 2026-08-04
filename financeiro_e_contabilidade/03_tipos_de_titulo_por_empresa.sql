/*
================================================================================
-- Nome        : Financeiro - Tipos de Título e Parametrização Contábil
-- Função      : Consultar os tipos de título cadastrados por empresa e suas regras de rateio
-- Conceitos   : Seleção de colunas com alias descritivos, Estruturação contábil
================================================================================
*/

-- Visualizar tipos de título e contas reduzidas por empresa
SELECT 
    tpt.cod_empresa       AS empresa,
    tpt.cod_tipo_titulo   AS tipo_titulo,
    tpt.criterio_rateio   AS criterio_rateio,
    tpt.conta_reduzida_1  AS conta_reduzida_um,
    tpt.conta_reduzida_2  AS conta_reduzida_dois,
    tpt.conta_reduzida_3  AS conta_reduzida_tres,
    tpt.conta_reduzida_4  AS conta_reduzida_quatro
FROM tb_financeiro_tipo_titulo tpt;
