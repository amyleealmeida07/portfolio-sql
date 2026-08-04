/*
================================================================================
-- Nome        : Consulta de Produtos Ativos por Família
-- Função      : Filtrar produtos cadastrados que estão ativos por código de família
-- Conceitos   : Filtros condicionais (WHERE), Operadores lógicos (AND)
================================================================================
*/

-- Seleção dos produtos ativos pertencentes a uma família específica
SELECT 
    cod_produto,
    descricao_produto,
    unidade_medida
FROM tb_produto
WHERE status_produto = 'A'
  AND cod_familia = 'MC027';
