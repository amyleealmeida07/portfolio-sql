/*
================================================================================
-- Nome        : Consulta de Cadastro Completo de Produtos e Depósitos
-- Função      : Listar produtos ativos vinculando empresa, família, usuário e depósitos
-- Conceitos   : Junções (INNER JOIN, LEFT JOIN), Alias de colunas, Filtros (WHERE)
================================================================================
*/

SELECT 
    p.cod_empresa        AS cod_empresa,
    e.nome_empresa       AS nome_empresa,
    p.cod_produto        AS cod_produto,
    p.desc_produto       AS desc_produto,
    p.cod_familia        AS cod_familia,
    f.desc_familia       AS desc_familia,
    dep.cod_deposito     AS cod_deposito,
    p.unidade_medida     AS unidade_medida,
    p.data_cadastro      AS data_cadastro,
    p.cod_usuario_criador AS cod_usuario,
    u.nome_usuario       AS usuario_cadastro
FROM tb_produto p
INNER JOIN tb_empresa e 
    ON e.cod_empresa = p.cod_empresa 
LEFT JOIN tb_familia_produto f
    ON f.cod_empresa = p.cod_empresa
   AND f.cod_familia = p.cod_familia
LEFT JOIN tb_usuario u
    ON u.cod_usuario = p.cod_usuario_criador
LEFT JOIN tb_produto_deposito dep 
    ON dep.cod_empresa = p.cod_empresa
   AND dep.cod_produto = p.cod_produto
WHERE p.status_produto = 'A';
