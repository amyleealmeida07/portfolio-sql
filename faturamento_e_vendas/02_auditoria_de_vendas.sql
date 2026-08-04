/*
================================================================================
-- Nome        : Auditoria de Vendas e Faturamento
-- Função      : Consolidar notas fiscais de venda, itens faturados e clientes
-- Conceitos   : Junções (INNER JOIN, LEFT JOIN), Alias de colunas, Mapeamento N:M
================================================================================
*/

-- Listagem consolidada de vendas para auditoria de faturamento
SELECT 
    nf.num_nota_fiscal   AS num_nota_fiscal, 
    nf.data_emissao      AS data_emissao,
    cli.nome_cliente     AS nome_cliente,
    item.cod_produto     AS cod_produto,
    item.qtd_faturada    AS quant_faturada,
    item.preco_unitario  AS valor_unitario
FROM tb_faturamento_nf nf
INNER JOIN tb_faturamento_nf_item item 
    ON item.cod_empresa = nf.cod_empresa
   AND item.cod_filial = nf.cod_filial
   AND item.cod_serie_nf = nf.cod_serie_nf
   AND item.num_nota_fiscal = nf.num_nota_fiscal
LEFT JOIN tb_cliente cli
    ON cli.cod_cliente = nf.cod_cliente;
