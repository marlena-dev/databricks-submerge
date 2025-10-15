-- Silver Layer: fact_quotation_assets
-- União de cotações BTC e yFinance com padronização de ativo, preço e moeda

CREATE OR REFRESH STREAMING TABLE silver.fact_quotation_assets
AS SELECT 
  ativo,
  CAST(preco AS DECIMAL(18,4)) as preco,
  moeda,
  horario_coleta,
  ingested_at,
  current_timestamp() as processed_at
FROM (
  -- Cotações Bitcoin
  SELECT 
    ativo,
    preco,
    moeda,
    horario_coleta,
    ingested_at
  FROM bronze.quotation_btc
  
  UNION ALL
  
  -- Cotações yFinance
  SELECT 
    ativo,
    preco,
    moeda,
    horario_coleta,
    ingested_at
  FROM bronze.quotation_yfinance
) combined_quotations

-- Data Quality Rules
CONSTRAINT preco_positive EXPECT (preco > 0) ON VIOLATION DROP ROW,
CONSTRAINT horario_coleta_valid EXPECT (horario_coleta <= current_timestamp()) ON VIOLATION DROP ROW,
CONSTRAINT ativo_valid EXPECT (ativo IS NOT NULL AND ativo != '') ON VIOLATION DROP ROW,
CONSTRAINT moeda_valid EXPECT (moeda = 'USD') ON VIOLATION DROP ROW
