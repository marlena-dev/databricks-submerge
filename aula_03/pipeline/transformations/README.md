# Pipeline de Segmentação de Clientes - Lakeflow Declarative Pipelines

Este pipeline implementa a segmentação de clientes conforme especificado no documento de requisitos, utilizando Lakeflow Declarative Pipelines do Databricks.

## Estrutura do Pipeline

### Bronze Layer

- **customers.sql**: Ingestão de dados brutos de clientes
- **transaction_btc.sql**: Ingestão de transações Bitcoin
- **transaction_commodities.sql**: Ingestão de transações de commodities
- **quotation_btc.sql**: Ingestão de cotações Bitcoin
- **quotation_yfinance.sql**: Ingestão de cotações yFinance

### Silver Layer

- **fact_transaction_assets.sql**: União de transações BTC e commodities com normalização
- **fact_quotation_assets.sql**: União de cotações BTC e yFinance com padronização
- **dim_clientes.sql**: Dimensão de clientes com anonimização (SHA2)
- **fact_transaction_revenue.sql**: Junção entre transações e cotações, cálculo de valor e receita de taxa

### Gold Layer

- **fact_transaction_revenue.sql**: Cópia da tabela Silver para a camada Gold
- **mostvaluableclient.sql**: Métricas de segmentação e ranking de clientes

## Regras de Qualidade de Dados

Todas as tabelas implementam regras de qualidade usando a sintaxe oficial `CONSTRAINT ... EXPECT` conforme [documentação do Databricks](https://docs.databricks.com/aws/en/dlt/expectations?language=SQL):

- **Validação de valores positivos**: `quantidade > 0`, `preco > 0`
- **Verificação de campos obrigatórios**: `data_hora IS NOT NULL`, `customer_id IS NOT NULL`
- **Validação de domínios permitidos**: `tipo_operacao IN ('COMPRA','VENDA')`, `segmento IN ('Financeiro', 'Indústria', 'Varejo', 'Tecnologia')`
- **Anonimização de dados sensíveis**: `SHA2(documento, 256)` para documentos
- **Consistência temporal**: `horario_coleta <= current_timestamp()`
- **Ações de violação**: `ON VIOLATION DROP ROW` para remover registros inválidos

## Configuração

- **Frequência**: Execução a cada 1 hora (H+00)
- **SLA**: Publicação da camada Gold até H+15 minutos
- **Governança**: Unity Catalog
- **Monitoramento**: Data Quality nativo via EXPECT/CONSTRAINT

## Volumes de Origem

Os dados são ingeridos dos seguintes volumes usando `cloud_files`:

- `/Volumes/lakehouse/raw_public/customers` (CSV)
- `/Volumes/lakehouse/raw_public/transaction_btc` (CSV)
- `/Volumes/lakehouse/raw_public/transaction_commodities` (CSV)
- `/Volumes/lakehouse/raw_public/quotation_btc` (CSV)
- `/Volumes/lakehouse/raw_public/quotation_yfinance` (CSV)

### Configuração cloud_files

Todas as tabelas Bronze utilizam a função `cloud_files` com as seguintes configurações:

- **Formato**: CSV
- **Header**: true (primeira linha contém cabeçalhos)
- **InferSchema**: true (inferência automática de tipos de dados)
