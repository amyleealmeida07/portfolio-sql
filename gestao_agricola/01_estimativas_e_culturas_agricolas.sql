/*
================================================================================
-- Nome        : Gestão Agrícola - Estimativas e Ciclo de Cultura por Talhão
-- Função      : Consultar e atualizar estimativas, estado de cultura e fases de plantio
-- Conceitos   : Filtros condicionais (WHERE / IN), Comandos de atualização (UPDATE)
================================================================================
*/

-- 1. Consultar estimativas agrícolas por identificador
SELECT 
    id,
    farm_id,
    estimate_value,
    active
FROM tb_agricola_estimativa 
WHERE id IN (910, 911);

-- 2. Atualizar status de ativação das estimativas agrícolas
UPDATE tb_agricola_estimativa 
SET active = '0' 
WHERE id IN (910, 911);

UPDATE tb_agricola_estimativa 
SET active = '1' 
WHERE id IN (910, 911);

-- 3. Consultar dados de cultura agrícola por área de talhão
SELECT 
    id,
    cell_id,
    culture_id,
    area,
    culture_state,
    cell_culture_phase
FROM tb_agricola_talhao_cultura 
WHERE area = '6.01';

-- 4. Consultar dados de cultura por identificador do talhão/célula
SELECT 
    id,
    cell_id,
    culture_id,
    area,
    culture_state,
    cell_culture_phase
FROM tb_agricola_talhao_cultura 
WHERE id IN (1430, 1431);

-- 5. Atualizar estado da cultura e fase para "Novo Plantio" nos talhões selecionados
UPDATE tb_agricola_talhao_cultura 
SET culture_state = '8' 
WHERE id IN (1430, 1431);

UPDATE tb_agricola_talhao_cultura 
SET cell_culture_phase = '2' -- Fase 2: Novo Plantio
WHERE id IN (1430, 1431);
