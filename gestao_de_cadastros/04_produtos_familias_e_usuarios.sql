/*
================================================================================
-- Nome        : Consulta de Produtos, Famílias e Permissões de Usuários
-- Função      : Relacionar produtos/famílias e mapear centros de custo liberados por usuário
-- Conceitos   : Junções (INNER JOIN), Seleção de colunas específicas
================================================================================
*/

-- 1. Relacionar produtos e suas respectivas famílias
SELECT 
    p.cod_empresa     AS cod_empresa,
    p.cod_produto     AS cod_produto,
    p.desc_produto    AS desc_produto,
    p.cod_familia     AS cod_familia,
    f.desc_familia    AS desc_familia
FROM tb_produto p 
INNER JOIN tb_familia_produto f 
    ON f.cod_empresa = p.cod_empresa 
   AND f.cod_familia = p.cod_familia;

-- 2. Cadastro geral de famílias de produtos e serviços
SELECT 
    cod_empresa       AS cod_empresa, 
    cod_familia       AS cod_familia, 
    desc_familia      AS desc_familia 
FROM tb_familia_produto;

-- 3. Mapeamento de centros de custo liberados por usuário
SELECT 
    u.cod_empresa     AS cod_empresa,
    u.cod_usuario     AS cod_usuario,
    u.nome_usuario    AS nome_usuario,
    perm.cod_centro_custo AS cod_centro_custo
FROM tb_usuario u
INNER JOIN tb_usuario_centro_custo perm 
    ON perm.cod_empresa = u.cod_empresa 
   AND perm.cod_usuario = u.cod_usuario;
