/*
================================================================================
-- Nome        : Consulta e Atualização de Quantidade Cancelada (Solicitação de Compra)
-- Função      : Validar dados da solicitação e atualizar a quantidade cancelada
-- Conceitos   : Manipulação de dados (UPDATE), Filtros compostos (WHERE, AND)
================================================================================
*/

-- 1. Consulta prévia para validação dos dados antes do ajuste
SELECT 
    num_solicitacao,
    cod_empresa,
    cod_produto,
    qtd_solicitada,
    qtd_cancelada,
    status_solicitacao
FROM tb_solicitacao_compra
WHERE num_solicitacao = '280'
  AND cod_empresa = '2';

-- 2. Atualização segura da quantidade cancelada
-- Define a quantidade cancelada para itens que ainda constavam como '0'
UPDATE tb_solicitacao_compra
SET qtd_cancelada = '4'
WHERE qtd_cancelada = '0'
  AND num_solicitacao = '280'
  AND cod_empresa = '2';
