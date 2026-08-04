/*
================================================================================
-- Nome        : Consulta de Cadastro de Materiais
-- Função      : Buscar detalhes e especificações do material por código
-- Conceitos   : Seleção direta por chave/código
================================================================================
*/

-- Busca de cadastro completo do material por código identificador
SELECT 
    cod_material,
    descricao_material,
    unidade_medida,
    categoria
FROM tb_equipamento_material
WHERE cod_material = '2001015';
