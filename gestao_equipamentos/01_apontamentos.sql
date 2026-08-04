/*
================================================================================
-- Nome        : Consulta de Apontamentos de Equipamentos
-- Função      : Filtrar histórico de apontamentos por equipamento e data
-- Conceitos   : Filtros condicionais (WHERE), Operadores lógicos (AND)
================================================================================
*/

-- Seleção de colunas específicas e listagem do histórico de uso por equipamento
SELECT 
    id_apontamento,
    cod_equipamento,
    cod_empresa,
    cod_funcionario,
    data_apontamento,
    data_digitacao
FROM tb_equipamento_apontamento
WHERE cod_equipamento = '30212' 
  AND data_digitacao > '2026-02-01'
ORDER BY data_digitacao DESC;

