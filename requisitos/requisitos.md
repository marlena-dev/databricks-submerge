```markdown
# Iniciativa 001: Segmentação de Cliente

## Informações Gerais

| Campo | Descrição |
|-------|------------|
| **Nome** | Segmentação de cliente |
| **Área de Negócio** | Pricing |
| **Data de Início** | 14/10/2025 |
| **Data Prevista de Finalização** | 15/10/2025 |
| **Status Atual** | Em especificação |

---

## 1. Contexto e Impacto

### Problema / Desafio Atual
- Não existe priorização de atendimento entre clientes de alto e baixo valor.  
- As análises atuais são manuais e demoradas, dificultando decisões estratégicas.  
- Há baixa personalização no relacionamento com clientes e oportunidades perdidas de upsell.  
- Clientes com pouca atividade tendem ao churn, sem monitoramento preventivo.  

### Situação Atual
- Todos os clientes são tratados da mesma forma, sem segmentação baseada em valor, frequência ou margem.

### Objetivo
- Criar segmentação de clientes baseada em comportamento transacional, rentabilidade e frequência de uso.  
- Identificar clientes mais valiosos (Top 20/50) e clientes em risco (Bottom 50) para personalização de atendimento e aumento de rentabilidade.

### Impacto Esperado
- Aumento de receita com base em clientes prioritários.  
- Diminuição do churn com ações proativas.  
- Melhoria no LTV (Lifetime Value) e na lucratividade total da carteira.

### KPIs / Indicadores Alvo
- Redução de churn (%)  
- Aumento do LTV médio (R$)  
- Crescimento da receita de taxa  
- Maior frequência média de transações (últimos 30 dias)  
- Aumento do ticket médio de transação  

---

## 2. Pontos de Atenção

| Ponto | Data de Identificação | Ação Necessária | Responsável | Status |
|-------|-----------------------|-----------------|--------------|--------|
| Padronizar cliente_id e customer_id | 14/10 | Uniformizar nomenclatura em toda a pipeline | Engenharia de Dados | Em andamento |
| Conversão de moeda | 14/10 | Normalizar preços e taxas para USD | Engenharia de Dados | Pendente |
| Privacidade de dados pessoais | 14/10 | Aplicar hash SHA2 e RLS no Databricks | Segurança / Dados | Em andamento |
| Categorias válidas (segmento, estado, país) | 14/10 | Validar domínio permitido | QA | Em andamento |
| Quantidade e preço válidos | 14/10 | Garantir valores positivos e tipos numéricos | QA | Em andamento |

---

## 3. Escopo Técnico

- **Ferramenta:** Lakeflow (Databricks SQL)  
- Toda a modelagem será feita em SQL declarativo, com governança no **Unity Catalog**.  
- Monitoramento e data quality nativos via **EXPECT/CONSTRAINT**.  
- **Frequência:** execução a cada 1 hora (H+00) via **Lakeflow Scheduler**.  
- **SLA:** publicação da camada Gold até H+15 minutos.  

---

## 4. Arquitetura e Camadas

| Camada | Tabela | Descrição | Regras de Qualidade |
|---------|---------|------------|----------------------|
| **Bronze** | customers, transaction_btc, transaction_commodities, quotation_btc, quotation_yfinance | Dados brutos ingeridos via Erathos | Verificação de schema e nulls obrigatórios |
| **Silver** | fact_transaction_assets | União de transações BTC e Commodities, normalização de asset_symbol e quantidade | `quantidade > 0`, `tipo_operacao` válido, `data_hora` não nula |
| **Silver** | fact_quotation_assets | União de cotações BTC e yFinance; padronização de ativo, preço e moeda | `preco` convertido para DECIMAL, `preco > 0`, `timestamp` válido |
| **Silver** | dim_clientes | Cópia anonimizada da base de clientes; validação de categorias | `documento` anonimizado via SHA2, `segmento/pais/estado` válidos, `customer_id` único |
| **Gold** | fact_transaction_revenue | Junção entre transações e cotações, cálculo de valor e receita de taxa | `gross_value = quantidade × preço`, `fee_revenue = gross_value × 0.25%`, cotação válida |
| **Gold** | mostvaluableclient | Agregação por cliente: total, média, frequência, ticket médio e ranking | `transações ≥ 1`, métricas consistentes |

---

## 5. Regras de Qualidade de Dados (Data Quality)

### 5.1 fact_transaction_assets
- `quantidade > 0`  
- `data_hora` não nula  
- `tipo_operacao IN ('COMPRA','VENDA')`  
- `asset_symbol` padronizado  
- **Ação:** registros inválidos enviados para `dq_quarantine.fact_transaction_assets`

### 5.2 fact_quotation_assets
- `preco` convertido para `DECIMAL(18,4)`  
- `preco > 0`  
- `horario_coleta <= current_timestamp()`  
- `ativo` dentro do domínio permitido  
- **Ação:** registros inconsistentes enviados para `dq_quarantine.fact_quotation_assets`

### 5.3 dim_clientes
- `documento_hash = SHA2(documento, 256)`  
- `segmento ∈ {Financeiro, Indústria, Varejo, Tecnologia}`  
- `estado ∈ siglas BR + (DE, US)`  
- `pais ∈ {Brasil, Alemanha, Estados Unidos}`  
- `customer_id` único  
- **Ação:** campos nulos ou fora de domínio enviados para `dq_quarantine.dim_clientes`

### 5.4 fact_transaction_revenue
- Cada transação deve possuir cotação válida ≤ `ts`  
- `gross_value > 0`  
- `fee_revenue > 0`  
- `customer_sk` não nulo (join válido com `dim_clientes`)  
- **Ação:** inconsistências enviadas para `dq_quarantine.fact_transaction_revenue`

### 5.5 mostvaluableclient
- **Métricas:**  
  - `COUNT(transações)`  
  - `SUM(valor_total)`  
  - `AVG(ticket_médio)`  
  - `MIN/MAX(data_transacao)`  
  - Frequência média últimos 30 dias  
  - `MAX(comissão)`  
- **Ranking:** Top 20 / Top 50 / Bottom 50  
- **Ação:** reprocessamento automático se violação de DQ > 1%

---

## 6. Anonimização e Segurança

| Tipo | Técnica | Implementação |
|------|----------|----------------|
| **PII (documentos, nomes, endereços)** | Hash (SHA2 256) | `SHA2(documento, 256)` aplicado em `dim_clientes` |
| **Acesso a dados sensíveis** | Row Level Security (RLS) | Implementado via Lakeflow / Databricks SQL |
| **Governança** | Unity Catalog | Grants por camada: leitura apenas na Gold |
| **Auditoria e Linhagem** | Lakeflow Lineage | Rastreabilidade completa dos fluxos |
```

## 7. Volumes do CSV

Eles vão iniciar o processo e serão por onde o DLT irá copiar do RAW para a camada Bronze.

Eles estão no:

lakehouse.raw_public/customers
lakehouse.raw_public/quotation_btc
lakehouse.raw_public/quotation_yfinance
lakehouse.raw_public/transaction_btc
lakehouse.raw_public/transaction_commodities


Foram montados no catalogo lakehouse como volumes.

Como os dados estão no volume, é necessario utilizar o cloud_files para copiar para a camada raw_public até bronze