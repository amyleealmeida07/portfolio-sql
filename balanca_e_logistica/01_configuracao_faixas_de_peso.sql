/*
================================================================================
-- Nome        : Balança & Logística - Configuração de Faixas de Peso
-- Função      : Consultar e atualizar regras de alerta e bloqueio de pesagem por limite de tara
-- Conceitos   : Filtros por flags booleanas (WHERE), Atualizações condicionais (UPDATE)
================================================================================
*/

-- 1. Consultar tipos de composição de frota com alerta de limite de peso ativado
SELECT 
    id,
    code                       AS codigo,
    description                AS descricao,
    limit_minimum_tara         AS tara_minima,
    limit_maximum_tara         AS tara_maxima,
    enable_warn_limit_weight   AS flag_alerta_peso
FROM tb_balanca_tipo_composicao
WHERE enable_warn_limit_weight = 1;

-- 2. Ativar flag de alerta para extrapolação de faixas de peso
UPDATE tb_balanca_tipo_composicao 
SET enable_warn_limit_weight = 1
WHERE enable_warn_limit_weight = 0;

-- 3. Consultar tipos de composição com flag de bloqueio/trava de pesagem desativada
SELECT 
    id,
    code                       AS codigo,
    description                AS descricao,
    limit_minimum_tara         AS tara_minima,
    limit_maximum_tara         AS tara_maxima,
    enable_lock_limit_weight   AS flag_bloqueio_peso
FROM tb_balanca_tipo_composicao
WHERE enable_lock_limit_weight = 0;

-- 4. Ativar flag de bloqueio/trava do processo de pesagem por faixa de peso
UPDATE tb_balanca_tipo_composicao 
SET enable_lock_limit_weight = 1
WHERE enable_lock_limit_weight = 0;
