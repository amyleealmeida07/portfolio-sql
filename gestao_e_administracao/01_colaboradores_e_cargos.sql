/*
================================================================================
-- Nome        : Administração de Pessoal - Consulta de Colaboradores e Cargos
-- Função      : Listar colaboradores exibindo matrícula, nome, cargo e data de admissão
-- Conceitos   : Junções (INNER JOIN), Filtro por lista (IN), Ordenação (ORDER BY)
================================================================================
*/

-- Listagem de colaboradores e seus respectivos cargos
SELECT 
    emp.code         AS matricula,
    emp.name         AS nome,
    post.description AS descricao_cargo,
    emp.date_start   AS data_admissao		
FROM tb_colaborador emp
INNER JOIN tb_cargo post
    ON emp.post_id = post.id
WHERE emp.code IN (
    '26363', '26364', '26365', '26366', '26367', 
    '26368', '26369', '26370', '26371', '26372'
)
ORDER BY emp.code ASC;
