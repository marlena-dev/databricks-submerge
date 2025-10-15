-- Gold Layer: mostvaluableclient
-- Agregação por cliente: total, média, frequência, ticket médio e ranking

CREATE OR REFRESH STREAMING TABLE gold.mostvaluableclient(
) AS SELECT
  customer_sk,
  
  -- Métricas principais
  COUNT(*) AS total_transacoes,
  ROUND(SUM(gross_value), 2) AS valor_total,
  ROUND(AVG(gross_value), 2) AS ticket_medio,
  MIN(data_hora) AS primeira_transacao,
  MAX(data_hora) AS ultima_transacao,

  -- Transações nos últimos 30 dias
  COUNT(CASE 
    WHEN data_hora >= current_timestamp() - INTERVAL 30 DAYS THEN 1 
  END) AS transacoes_ultimos_30_dias,

  ROUND(SUM(fee_revenue), 2) AS comissao_total,

  -- Ranking baseado no número total de transações
  RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking_por_transacoes,

  -- Classificação Top 1 / Top 2 / Top 3
  CASE 
    WHEN RANK() OVER (ORDER BY COUNT(*) DESC) = 1 THEN 'Top 1'
    WHEN RANK() OVER (ORDER BY COUNT(*) DESC) = 2 THEN 'Top 2'
    WHEN RANK() OVER (ORDER BY COUNT(*) DESC) = 3 THEN 'Top 3'
    ELSE 'Outros'
  END AS classificacao_cliente,

  current_timestamp() AS calculated_at

FROM lakehouse.silver.fact_transaction_revenue
GROUP BY customer_sk
ORDER BY total_transacoes DESC;
