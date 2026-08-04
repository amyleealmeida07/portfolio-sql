/*
================================================================================
-- Nome        : Balança & Logística - Validação de Período de Pesagem
-- Função      : Consultar e atualizar validação de data/hora de pesagem com vigência do período
-- Conceitos   : Filtros condicionais (WHERE), Atualizações globais e pontuais (UPDATE)
================================================================================
*/

-- 1. Consultar configurações de janela de operação com a validação de período ativada
SELECT 
    id, 
    item_id                   AS item_id,
    tru_operation_id          AS operacao_id,
    distribution_description  AS descricao_distribuicao,
    valid_date_with_period    AS flag_validacao_periodo
FROM tb_balanca_janela_config 
WHERE valid_date_with_period = 1;

-- 2. Ativar a validação de data/hora da pesagem com o período para todos os registros pendentes
UPDATE tb_balanca_janela_config 
SET valid_date_with_period = 1
WHERE valid_date_with_period = 0;

-- 3. Definir exceção específica para uma janela de operação (regra pontual)
UPDATE tb_balanca_janela_config
SET valid_date_with_period = 0
WHERE id = 4;
