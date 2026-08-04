/*
================================================================================
-- Nome        : Consulta de Pedidos de Venda e Itens
-- Função      : Listar pedidos de venda e seus respectivos itens (quantidade e preço)
-- Conceitos   : Junções (INNER JOIN), Chaves compostas (empresa, filial, pedido)
================================================================================
*/

-- Listagem de pedidos de venda com detalhamento de itens solicitados
SELECT 
    ped.num_pedido      AS num_pedido,
    ped.data_emissao    AS data_emissao,
    ped.cod_cliente     AS cod_cliente,
    item.cod_produto    AS cod_produto,
    item.qtd_pedida     AS qtd_solicitada,
    item.preco_unitario AS preco_unitario
FROM tb_vendas_pedido ped
INNER JOIN tb_vendas_pedido_item item 
    ON item.cod_empresa = ped.cod_empresa
   AND item.cod_filial = ped.cod_filial
   AND item.num_pedido = ped.num_pedido;
