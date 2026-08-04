/*
================================================================================
-- Nome        : Consulta de Notas Fiscais por Cliente
-- Função      : Listar clientes e suas respectivas notas fiscais de venda com valor líquido
-- Conceitos   : Junções (INNER JOIN), Agrupamento (GROUP BY)
================================================================================
*/

-- Listagem de clientes e suas notas fiscais de venda faturadas
SELECT 
    cli.cod_cliente     AS cod_cliente,
    cli.nome_cliente    AS nome_cliente,
    nf.num_nota_fiscal  AS num_nota_fiscal,
    nf.valor_liquido    AS valor_liquido
FROM tb_faturamento_nf nf
INNER JOIN tb_cliente cli 
    ON cli.cod_cliente = nf.cod_cliente
GROUP BY 
    cli.cod_cliente,
    cli.nome_cliente,
    nf.num_nota_fiscal,
    nf.valor_liquido;
