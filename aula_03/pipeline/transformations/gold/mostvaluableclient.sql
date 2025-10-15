-- Gold Layer: mostvaluableclient
-- Agregação por cliente: total, média, frequência, ticket médio e ranking

CREATE OR REFRESH STREAMING TABLE gold.mostvaluableclient(
  CONSTRAINT transacoes_minimas EXPECT (total_transacoes >= 1) ON VIOLATION DROP ROW,
  CONSTRAINT valor_total_positive EXPECT (valor_total > 0) ON VIOLATION DROP ROW,
  CONSTRAINT ticket_medio_positive EXPECT (ticket_medio > 0) ON VIOLATION DROP ROW,
  CONSTRAINT comissao_total_positive EXPECT (comissao_total > 0) ON VIOLATION DROP ROW,
  CONSTRAINT classificacao_valid EXPECT (classificacao_cliente IN ('Top 20', 'Top 50', 'Bottom 50', 'Outros')) ON VIOLATION DROP ROW
) AS SELECT 
  customer_sk,
  c.customer_name,
  c.segmento,
  c.pais,
  c.estado,
  -- Métricas de transações
  COUNT(*) as total_transacoes,
  SUM(gross_value) as valor_total,
  AVG(gross_value) as ticket_medio,
  MIN(data_hora) as primeira_transacao,
  MAX(data_hora) as ultima_transacao,
  -- Frequência média últimos 30 dias
  COUNT(CASE 
    WHEN data_hora >= current_timestamp() - INTERVAL 30 DAYS 
    THEN 1 
  END) as transacoes_ultimos_30_dias,
  -- Receita total de taxas
  SUM(fee_revenue) as comissao_total,
  -- Ranking percentual
  PERCENT_RANK() OVER (ORDER BY SUM(gross_value) DESC) as ranking_percentual,
  -- Classificação
  CASE 
    WHEN PERCENT_RANK() OVER (ORDER BY SUM(gross_value) DESC) <= 0.2 THEN 'Top 20'
    WHEN PERCENT_RANK() OVER (ORDER BY SUM(gross_value) DESC) <= 0.5 THEN 'Top 50'
    WHEN PERCENT_RANK() OVER (ORDER BY SUM(gross_value) DESC) >= 0.5 THEN 'Bottom 50'
    ELSE 'Outros'
  END as classificacao_cliente,
  current_timestamp() as calculated_at
FROM STREAM(silver.fact_transaction_revenue) r
INNER JOIN STREAM(silver.dim_clientes) c ON r.customer_sk = c.customer_id
GROUP BY 
  customer_sk,
  c.customer_name,
  c.segmento,
  c.pais,
  c.estado
