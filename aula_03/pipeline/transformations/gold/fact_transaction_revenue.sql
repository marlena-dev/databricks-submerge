-- Gold Layer: fact_transaction_revenue
-- Cópia da tabela Silver para a camada Gold (conforme arquitetura)

CREATE OR REFRESH MATERIALIZED VIEW gold.fact_transaction_revenue
AS SELECT 
  transaction_id,
  data_hora,
  asset_symbol,
  quantidade,
  tipo_operacao,
  moeda,
  cliente_id,
  canal,
  mercado,
  customer_sk,
  preco_cotacao,
  timestamp_cotacao,
  gross_value,
  fee_revenue,
  processed_at,
  calculated_at
FROM silver.fact_transaction_revenue
