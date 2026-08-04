/*
================================================================================
-- Nome        : Consulta de Clientes por Estado (UF)
-- Função      : Listar clientes localizados em um estado específico
-- Conceitos   : Filtros condicionais (WHERE), Ordenação alfabética (ORDER BY)
================================================================================
*/

-- Listagem de clientes do estado de SP ordenados pelo nome
SELECT 
    cod_cliente,
    nome_cliente,
    tipo_cliente,
    uf_estado
FROM tb_cliente
WHERE uf_estado = 'SP'
ORDER BY nome_cliente ASC;
