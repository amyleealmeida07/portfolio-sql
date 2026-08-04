/*
================================================================================
-- Nome        : Financeiro - Histórico de Parametrização de Fornecedores
-- Função      : Consultar a estrutura contábil, rateios e contas reduzidas vinculadas a fornecedores
-- Conceitos   : Junções (INNER JOIN), Alias de colunas
================================================================================
*/

-- Visualizar parâmetros contábeis e financeiros vinculados a cada fornecedor
SELECT 
    hist.cod_empresa       AS empresa,
    hist.cod_fornecedor    AS fornecedor,		
    forn.nome_fornecedor   AS nome,
    hist.criterio_rateio   AS criterio_rateio,
    hist.conta_reduzida_1  AS conta_reduzida_um,
    hist.conta_reduzida_2  AS conta_reduzida_dois,
    hist.conta_reduzida_3  AS conta_reduzida_tres,
    hist.conta_reduzida_4  AS conta_reduzida_quatro
FROM tb_financeiro_fornecedor_hist hist
INNER JOIN tb_fornecedor forn 
    ON hist.cod_fornecedor = forn.cod_fornecedor;
