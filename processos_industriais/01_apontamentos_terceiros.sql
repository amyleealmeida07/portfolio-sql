/*
================================================================================
-- Nome        : Consulta de Apontamentos e Equipes de Terceiros
-- Função      : Consultar equipes, cadastro de terceiros e histórico de apontamentos
-- Conceitos   : Filtros condicionais (WHERE), Busca por padrão (LIKE)
================================================================================
*/

-- 1. Visualizar equipes de prestadores externos
SELECT 
    id_equipe,
    nome_equipe,
    eh_externa,
    data_cadastro
FROM tb_recurso_equipe
WHERE eh_externa = '1' 
  AND id_equipe = '002CD15';

-- 2. Visualizar dados cadastrais do funcionário terceiro
SELECT 
    cod_funcionario,
    nome_funcionario,
    cpf,
    status_ativo
FROM tb_recurso_funcionario
WHERE cod_funcionario = '915219';

-- 3. Visualizar relacionamento entre equipe e ID dos funcionários
SELECT 
    id_equipe,
    cod_funcionario,
    funcao_equipe,
    data_vinculo
FROM tb_equipe_funcionario
WHERE id_equipe = '002CD15';

-- 4. Visualizar histórico de apontamentos realizados pelo funcionário
SELECT 
    id_apontamento,
    cod_funcionario,
    data_apontamento,
    descricao_atividade,
    horas_apontadas
FROM tb_apontamento_horas
WHERE cod_funcionario LIKE '%915221%';
