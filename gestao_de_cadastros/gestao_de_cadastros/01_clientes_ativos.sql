/*
================================================================================
-- Nome        : Consulta de Clientes Ativos
-- Função      : Listar clientes com cadastro ativo (código, nome, documento e situação)
-- Conceitos   : Filtros condicionais (WHERE), Seleção de colunas específicas
================================================================================
*/

-- Listagem de clientes com cadastro ativo no sistema
SELECT 
    cod_cliente,
    nome_cliente,
    cnpj_cpf,
    status_cliente
FROM tb_cliente
WHERE status_cliente = 'A';
