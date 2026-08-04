/*
================================================================================
-- Nome        : Financeiro - Grupos de Contas e Critérios de Rateio
-- Função      : Consultar estrutura de grupos de contas a receber/pagar e contas reduzidas
-- Conceitos   : Seleção de colunas com alias, Ordenação de dados (ORDER BY)
================================================================================
*/

-- Visualizar estrutura de grupos de contas e parametrizações de rateio
SELECT 
    cod_empresa          AS empresa,
    cod_grupo_contas     AS grupo_contas,
    criterio_rateio      AS criterio_rateio,
    conta_reduzida_1     AS conta_reduzida_um,
    conta_reduzida_2     AS conta_reduzida_dois,
    conta_reduzida_3     AS conta_reduzida_tres,
    conta_reduzida_4     AS conta_reduzida_quatro 
FROM tb_financeiro_grupo_contas
ORDER BY cod_grupo_contas ASC;
