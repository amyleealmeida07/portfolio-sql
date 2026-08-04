/*
================================================================================
-- Nome        : Faturamento - Alteração de Depósito em Notas Fiscais de Saída
-- Função      : Consultar, mapear e atualizar depósitos nos itens de NF de saída
-- Conceitos   : Filtros (WHERE), Agrupamento (GROUP BY), Atualização (UPDATE)
================================================================================
*/

-- 1. Visualizar itens de notas fiscais vinculados a um depósito específico
SELECT 
    cod_empresa,
    num_nota_fiscal,
    cod_produto,
    cod_deposito,
    qtd_faturada,
    valor_total
FROM tb_faturamento_nf_item 
WHERE cod_empresa = 1
  AND cod_deposito = 202;

-- 2. Listar depósitos distintos utilizados nos itens de faturamento
SELECT 
    cod_deposito
FROM tb_faturamento_nf_item 
WHERE cod_empresa = 1
GROUP BY cod_deposito;

-- 3. Atualizar o depósito nos itens das notas fiscais de saída
UPDATE tb_faturamento_nf_item 
SET cod_deposito = 102
WHERE cod_deposito = 202
  AND cod_empresa = 1;
