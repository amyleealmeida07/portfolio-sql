/*
================================================================================
-- Nome        : Consulta de Produtos por Família
-- Função      : Retornar a lista completa de produtos vinculados a uma família
-- Conceitos   : Filtro direto por atributo de agrupamento (WHERE)
================================================================================
*/

-- Listagem de produtos pertencentes a uma família de itens específica
SELECT 
    cod_empresa,
    cod_produto,
    descricao_produto,
    cod_familia
FROM tb_produto
WHERE cod_familia = 'MC027';
