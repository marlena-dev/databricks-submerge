-- Silver Layer: fact_transaction_assets
-- União de transações BTC e Commodities com normalização de asset_symbol e quantidade

CREATE OR REFRESH STREAMING TABLE silver.fact_transaction_assets(
  CONSTRAINT quantidade_positive EXPECT (quantidade > 0) ON VIOLATION DROP ROW,
  CONSTRAINT data_hora_not_null EXPECT (data_hora IS NOT NULL) ON VIOLATION DROP ROW,
  CONSTRAINT tipo_operacao_valid EXPECT (tipo_operacao IN ('COMPRA','VENDA')) ON VIOLATION DROP ROW,
  CONSTRAINT asset_symbol_not_null EXPECT (asset_symbol IS NOT NULL AND asset_symbol != 'UNKNOWN') ON VIOLATION DROP ROW
) AS SELECT 
  transaction_id,
  data_hora,
  CASE 
    WHEN ativo IS NOT NULL THEN ativo
    WHEN commodity_code IS NOT NULL THEN commodity_code
    ELSE 'UNKNOWN'
  END as asset_symbol,
  CAST(quantidade AS DECIMAL(18,8)) as quantidade,
  tipo_operacao,
  moeda,
  cliente_id,
  canal,
  mercado,
  arquivo_origem,
  importado_em,
  ingested_at,
  current_timestamp() as processed_at
FROM (
  -- Transações Bitcoin
  SELECT 
    transaction_id,
    data_hora,
    ativo,
    NULL as commodity_code,
    quantidade,
    tipo_operacao,
    moeda,
    cliente_id,
    canal,
    mercado,
    arquivo_origem,
    importado_em,
    ingested_at
  FROM STREAM(bronze.transaction_btc)
  
  UNION ALL
  
  -- Transações Commodities
  SELECT 
    transaction_id,
    data_hora,
    NULL as ativo,
    commodity_code,
    quantidade,
    tipo_operacao,
    moeda,
    cliente_id,
    canal,
    mercado,
    arquivo_origem,
    importado_em,
    ingested_at
  FROM STREAM(bronze.transaction_commodities)
) combined_transactions
