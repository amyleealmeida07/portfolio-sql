/*
================================================================================
-- Nome        : Consulta de Exportação de Notas Fiscais e Ordens de Compra
-- Função      : Consolidar fornecedores, ordens de compra (produtos/serviços) e NFs
-- Conceitos   : Joins (INNER/LEFT), Expressão CASE, Agrupamento (GROUP BY), CONCAT
================================================================================
*/

-- 1. Consulta básica de dados cadastrais de fornecedores
SELECT 
    cod_fornecedor, 
    nome_fornecedor, 
    cnpj_cpf  
FROM tb_fornecedor;

-- 2. Listagem geral de ordens de compra
SELECT 
    num_ordem_compra,
    cod_fornecedor,
    data_emissao,
    valor_total
FROM tb_ordem_compra;

-- 3. Identificação de itens de nota fiscal vinculados a ordens de compra
SELECT 
    cod_empresa, 
    cod_fornecedor, 
    num_nota_fiscal, 
    num_ordem_compra, 
    sequencia_item 
FROM tb_nota_fiscal_servico_item 
WHERE num_ordem_compra > 0 
  AND sequencia_item > 1;

-- 4. Consulta consolidada: Notas Fiscais, Fornecedores e Ordens de Compra (Produtos/Serviços)
SELECT
    nf.cod_empresa          AS cod_empresa, 
    nf.cod_fornecedor       AS codigo_fornecedor,
    f.nome_fornecedor       AS nome_do_fornecedor,
    CONCAT('´', f.cnpj_cpf) AS cnpj,
    CASE
        WHEN nfs.num_ordem_compra IS NOT NULL THEN nfs.num_ordem_compra 
        WHEN nfp.num_ordem_compra IS NOT NULL THEN nfp.num_ordem_compra 
    END AS ordem_compra, 
    nf.num_nota_fiscal      AS numero_nf, 
    nf.tipo_nota_fiscal     AS tipo_nf
FROM tb_nota_fiscal nf
INNER JOIN tb_fornecedor f 
    ON f.cod_fornecedor = nf.cod_fornecedor
LEFT JOIN tb_nota_fiscal_produto_item nfp 
    ON nf.cod_empresa = nfp.cod_empresa 
   AND nf.cod_filial = nfp.cod_filial
   AND nf.cod_fornecedor = nfp.cod_fornecedor
   AND nf.num_nota_fiscal = nfp.num_nota_fiscal
   AND nf.cod_serie_nf = nfp.cod_serie_nf
   AND nfp.data_geracao = nf.data_geracao
   AND nfp.num_ordem_compra != 0
LEFT JOIN tb_nota_fiscal_servico_item nfs 
    ON nf.cod_empresa = nfs.cod_empresa 
   AND nf.cod_filial = nfs.cod_filial 
   AND nf.cod_fornecedor = nfs.cod_fornecedor 
   AND nf.num_nota_fiscal = nfs.numnfc 
   AND nf.cod_serie_nf = nfs.cod_serie_nf
   AND nfs.data_geracao = nf.data_geracao
   AND nfs.num_ordem_compra != 0
WHERE nf.situacao_nf = 2
  AND nf.tipo_nota_fiscal = 1
  AND nf.data_geracao < '2026-03-23'
  AND (nfs.num_ordem_compra IS NOT NULL OR nfp.num_ordem_compra IS NOT NULL)
GROUP BY 
    nf.cod_empresa,
    nf.cod_fornecedor,
    f.nome_fornecedor,
    f.cnpj_cpf,
    nfs.num_ordem_compra,
    nfp.num_ordem_compra,
    nf.num_nota_fiscal, 
    nf.tipo_nota_fiscal;

-- 5. Detalhamento de Ordens de Compra por Produto e Serviço
SELECT 
    oc.num_ordem_compra AS numero_oc,
    ocp.num_ordem_compra AS oc_produto,
    ocp.cod_produto      AS codigo_produto,
    ocp.desc_produto     AS desc_produto,
    ocs.num_ordem_compra AS oc_servico,
    ocs.cod_servico      AS codigo_servico,
    ocs.desc_servico     AS desc_servico
FROM tb_ordem_compra oc 
LEFT JOIN tb_ordem_compra_produto ocp 
    ON oc.num_ordem_compra = ocp.num_ordem_compra
LEFT JOIN tb_ordem_compra_servico ocs 
    ON oc.num_ordem_compra = ocs.num_ordem_compra
WHERE ocp.cod_produto IS NOT NULL 
   OR ocs.cod_servico IS NOT NULL;
