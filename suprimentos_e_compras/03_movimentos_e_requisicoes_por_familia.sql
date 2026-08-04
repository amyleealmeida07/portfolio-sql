/*
================================================================================
-- Nome        : Movimentos e Requisições de Estoque por Família
-- Função      : Consultar famílias, movimentações físicas e requisições (Produtos e Serviços)
-- Conceitos   : Filtros por lista de valores (IN), Separação por tipo de item (P/S)
================================================================================
*/

-- 1. Visualizar famílias de produtos e serviços
SELECT 
    cod_empresa, 
    cod_familia, 
    descricao_familia 
FROM tb_familia_produto;

-- 2. Visualizar movimentos de estoque
SELECT 
    cod_empresa,
    cod_produto,
    cod_deposito,
    data_movimento,
    sequencia_movimento,
    cod_transacao, 
    qtd_movimentada,
    saldo_estoque,
    num_documento
FROM tb_estoque_movimento;

-- 3. Visualizar requisições de estoque para produtos
SELECT 
    cod_empresa       AS cod_empresa,
    num_requisicao    AS cod_requisicao,
    seq_requisicao    AS seq_requisicao,
    data_requisicao   AS data_requisicao,               
    cod_produto       AS cod_produto,                       
    desc_produto      AS desc_produto,
    cod_familia       AS cod_familia       
FROM tb_estoque_requisicao
WHERE tipo_item = 'P'
  AND cod_produto IN (1000503, 1000504, 1000505, 1000564, 1000656) -- Exemplos de códigos de produtos
  AND cod_familia IN ('GE006', 'GE017', 'GE019', 'MC008', 'MC009'); -- Exemplos de famílias

-- 4. Visualizar requisições de estoque para serviços
SELECT 
    cod_empresa       AS cod_empresa,
    num_requisicao    AS cod_requisicao,
    seq_requisicao    AS seq_requisicao,
    data_requisicao   AS data_requisicao,               
    cod_servico       AS cod_servico,    
    desc_servico      AS desc_servico,
    cod_familia       AS cod_familia       
FROM tb_estoque_requisicao
WHERE tipo_item = 'S'
  AND cod_servico IN ('0101', '0102', '0103', 'S000041', 'S000065') -- Exemplos de códigos de serviços
  AND cod_familia IN ('SC001', 'SC002', 'SC009', 'SC101');         -- Exemplos de famílias
