/*
================================================================================
-- Nome        : Frota & Transporte - Informe Diário e Alocação de Equipe
-- Função      : Consultar informes diários de transporte e atualizar alocação de equipe por registro
-- Conceitos   : Filtros diretos (WHERE), Atualização relacional (UPDATE)
================================================================================
*/

-- 1. Consultar informe diário de transporte por código do registro
SELECT 
    id,
    code,
    date_entry,
    driver_id,
    vehicle_id,
    status
FROM tb_transporte_informe_diario 
WHERE code = '213658';

-- 2. Atualizar id da equipe nos itens do informe diário selecionado
UPDATE tb_transporte_informe_item 
SET team_id = 1
WHERE entry_id = '749';
