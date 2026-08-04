/*
================================================================================
-- Nome        : Faturamento - Notas Fiscais de Saída por Produto
-- Função      : Consultar itens de produto, natureza de operação e emissões faturadas
-- Conceitos   : Junções (LEFT JOIN), Conversão de tipos (CONVERT/VARCHAR), 
--               Filtros por regras de negócio e DFe, Agrupamento (GROUP BY)
================================================================================
*/

-- 1. Agrupamento de naturezas de operação utilizadas para um produto específico
SELECT 
    noppro AS natureza_operacao
FROM tb_faturamento_nf_item 
WHERE cod_produto = '5100002'
GROUP BY noppro;

-- 2. Consolidado de notas fiscais de saída por linha de produto e DFe
SELECT 
    nf.cod_empresa                     AS cod_empresa,
    nf.cod_filial                      AS cod_filial,
    nf.num_nota_fiscal                 AS num_nf,
    nf.cod_serie_nf                    AS cod_serie_nf,      
    nf.noppro                          AS natureza_operacao,
    CONVERT(VARCHAR, nf.data_emissao, 103) AS data_emissao,
    CONCAT('´', dfe.chave_documento)   AS chave_documento,
    item.qtd_faturada                  AS quantidade_faturada
FROM tb_faturamento_nf nf       
LEFT JOIN tb_faturamento_dfe dfe 
    ON nf.cod_empresa = dfe.cod_empresa
   AND nf.cod_filial = dfe.cod_filial  
   AND nf.cod_serie_nf = dfe.cod_serie_nf  
   AND nf.num_nota_fiscal = dfe.num_nota_fiscal  
LEFT JOIN tb_faturamento_nf_item item 
    ON nf.cod_empresa = item.cod_empresa  
   AND nf.cod_filial = item.cod_filial  
   AND nf.cod_serie_nf = item.cod_serie_nf
   AND nf.num_nota_fiscal = item.num_nota_fiscal  
WHERE nf.cod_empresa = 1               
  AND nf.status_nota_fiscal = '2'       -- '2': Nota fiscal fechada
  AND dfe.status_documento IN (3, 16)   -- 3: Autorizada / 16: Autorizada em contingência
  AND nf.noppro IN ('5501', '6501')     -- Códigos de Natureza de Operação (CFOP)
  AND nf.data_emissao < '2026-01-01';
