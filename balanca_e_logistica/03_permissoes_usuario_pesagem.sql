/*
================================================================================
-- Nome        : Balança & Logística - Controle de Permissões de Usuários
-- Função      : Consultar, mapear lacunas, inserir e atualizar permissões de pesagem por usuário
-- Conceitos   : Subconsultas com NOT EXISTS, Inserção via SELECT, Junções (INNER JOIN), UPDATE
================================================================================
*/

-- 1. Consultar todos os usuários e suas respectivas permissões registradas
SELECT 
    u.id                         AS user_id, 
    u.user_name                  AS nome_usuario, 
    u.active                     AS usuario_ativo, 
    p.id                         AS permissao_id, 
    p.block_edit_closed_ts_entry AS flag_bloqueio_edicao
FROM tb_usuario u
INNER JOIN tb_balanca_usuario_permissao p 
    ON p.user_id = u.id;

-- 2. Mapear usuários ativos que ainda não possuem registro de permissão cadastrado
SELECT 
    u.id        AS user_id,
    u.user_name AS nome_usuario,
    u.active    AS usuario_ativo
FROM tb_usuario u
WHERE NOT EXISTS (
    SELECT 1 
    FROM tb_balanca_usuario_permissao p 
    WHERE p.user_id = u.id
)
ORDER BY u.id ASC;

-- 3. Inserir permissão padrão para usuários sem registro prévio (evita duplicidade)
INSERT INTO tb_balanca_usuario_permissao 
(
    user_id,
    enable_manual_weighing,
    block_edit_closed_ts_entry
)
SELECT
    u.id,
    0,  -- Pesagem manual desativada por padrão
    0   -- Bloqueio de edição desativado por padrão
FROM tb_usuario u
WHERE NOT EXISTS (
    SELECT 1 
    FROM tb_balanca_usuario_permissao p 
    WHERE p.user_id = u.id
);

-- 4. Consultar usuários que estão com a flag de bloqueio de edição desativada
SELECT 
    u.id                         AS user_id, 
    u.user_name                  AS nome_usuario, 
    u.active                     AS usuario_ativo, 
    p.id                         AS permissao_id, 
    p.block_edit_closed_ts_entry AS flag_bloqueio_edicao
FROM tb_usuario u
INNER JOIN tb_balanca_usuario_permissao p 
    ON p.user_id = u.id
WHERE p.block_edit_closed_ts_entry = 0
ORDER BY u.id ASC;

-- 5. Atualizar todas as permissões para ativar o bloqueio de edição em pesagens encerradas
UPDATE tb_balanca_usuario_permissao
SET block_edit_closed_ts_entry = 1;
