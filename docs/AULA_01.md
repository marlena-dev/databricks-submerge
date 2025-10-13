# 📚 AULA 01: Fundamentos do Lakehouse na Prática — Ingestão, Agendamento e DLT

## 🎯 Objetivo da Aula
Construir, agendar e operacionalizar ingestões de dados a partir de 2 fontes de APIs (Bitcoin e commodities: ouro, prata e petróleo) e 1 fonte relacional (Supabase), simulando um data lake com camadas raw→bronze usando DLT.

---

## ⏰ Duração Estimada
**3-4 horas** (incluindo exercícios práticos)

---

## 📋 Pré-requisitos
- [ ] Conta no GitHub criada
- [ ] Conhecimentos básicos de SQL (recomendado)
- [ ] Conhecimentos básicos de Python (opcional)
- [ ] Navegador web atualizado
- [ ] Conta no Supabase (para o banco relacional)

---

## 🗺️ Roteiro da Aula

### Parte 1: Introdução ao Databricks (20-30 min)

#### 1.1 O que é Databricks?
- [ ] Conceito de Lakehouse e evolução dos data warehouses
- [ ] Plataforma unificada: Analytics + AI + Data Engineering
- [ ] Benefícios: performance, escalabilidade, governança

#### 1.2 Arquitetura Lakehouse
- [ ] Data Warehouse vs Data Lake vs Lakehouse
- [ ] Componentes: Spark, Delta Lake, Unity Catalog
- [ ] Benefícios: ACID, versionamento, governança

### Parte 2: Configuração do Ambiente (30-45 min)

#### 2.1 Criando Conta no Databricks
- [ ] Acesso ao Community Edition
- [ ] Registro e configuração inicial
- [ ] Navegação: Workspace, clusters, notebooks

#### 2.2 Integração com GitHub
- [ ] Configurar Git Integration
- [ ] Conectar repositório e sincronizar (clone/pull/push)
- [ ] Fluxo de branches (main/desenvolvimento)

#### 2.3 Organização do projeto neste repositório
- [ ] `src/ingestao/`: notebooks base de ingestão (bitcoin, yfinance/commodities)
- [ ] `src/sql/`: scripts SQL (tabelas e cargas simuladas)
- [ ] `src/bronze/`: notebooks DLT para camadas bronze
- [ ] `dlt_bronze_bitcoin_pipeline-(1)/transformations/`: SQLs DLT

---

## 💾 Parte 3: Ingestão via APIs (40-60 min)

#### 3.1 Fontes e escopo
- [ ] Bitcoin: preço/volume
- [ ] Commodities: ouro, prata e petróleo (yfinance)

#### 3.2 Implementação (usando notebooks como base para scripts)
- [ ] Revisar `src/ingestao/ingest_bitcoin_to_volume.ipynb`
- [ ] Revisar `src/ingestao/ingest_yfinance_to_volume.ipynb`
- [ ] Converter para scripts Python executáveis e salvar em `src/ingestao/`
- [ ] Definir diretórios de saída para camada raw (simulando data lake)

Exemplo de pontos-chave nos scripts:
- Extração da API (requests/yfinance)
- Normalização de colunas e carimbo de tempo (ingestion_time)
- Escrita em formato parquet/CSV na área raw

#### 3.3 Agendamento
- [ ] Agendar 2 scripts (bitcoin e commodities)
- [ ] Frequência: a cada 10 minutos (cron local, crontab, ou Databricks Jobs)
- [ ] Log mínimo: timestamp da execução e quantidade de registros gravados

---

## 🗄️ Parte 4: Ingestão de Banco SQL (Supabase) (30-45 min)

#### 4.1 Criação do Banco
- [ ] Criar projeto no Supabase (Postgres habilitado)
- [ ] Executar `src/sql/create_table.sql`
- [ ] Popular base inicial com `src/sql/seed_customer.sql`

#### 4.2 Cargas e rotinas de atualização (simulação de transações)
- [ ] Executar `src/sql/cron_sales_btc.sql` (transações BTC)
- [ ] Executar `src/sql/cron_sales_commodities.sql` (transações commodities)
- [ ] Agendar 2 rotinas a cada 10 minutos

Observação: manter credenciais seguras e variáveis de ambiente fora do código.

---

## 🪄 Parte 5: DLT — Raw para Bronze (30-45 min)

#### 5.1 Visão Geral do DLT
- [ ] O que é Delta Live Tables e quando usar
- [ ] Boas práticas de camadas raw→bronze

#### 5.2 Implementação
- [ ] Utilizar `src/bronze/dlt_bronze_bitcoin.ipynb` (quando aplicável)
- [ ] Referenciar SQLs em `dlt_bronze_bitcoin_pipeline-(1)/transformations/`
- [ ] Criar tabelas bronze a partir dos arquivos raw (bitcoin e commodities)

#### 5.3 Execução e validação
- [ ] Rodar pipeline DLT
- [ ] Verificar lineage e qualidade básica
- [ ] Consultar tabelas bronze

---

## 🎯 Objetivos de Aprendizagem

Ao final desta aula, você será capaz de:

- [ ] Implementar ingestões a partir de APIs (bitcoin e commodities)
- [ ] Agendar execuções recorrentes (cron/Jobs) a cada 10 minutos
- [ ] Configurar um banco relacional no Supabase e executar cargas SQL
- [ ] Organizar dados em camadas (raw e bronze) no Lakehouse
- [ ] Operacionalizar um pipeline DLT do raw para bronze
- [ ] Auditar e validar dados ingeridos e transformados

---

## 📚 Recursos Adicionais

### Documentação Oficial
- [Databricks Documentation](https://docs.databricks.com/)
- [Unity Catalog Guide](https://docs.databricks.com/data-governance/unity-catalog/index.html)
- [Delta Lake Documentation](https://docs.delta.io/)

### Tutoriais Recomendados
- [Getting Started with Databricks](https://docs.databricks.com/getting-started/index.html)
- [Unity Catalog Quickstart](https://docs.databricks.com/data-governance/unity-catalog/get-started.html)
- [Delta Lake Quickstart](https://docs.delta.io/latest/quick-start.html)

### Comunidade
- [Databricks Community Forum](https://community.databricks.com/)
- [Stack Overflow - Databricks](https://stackoverflow.com/questions/tagged/databricks)

---

## ✅ Checklist de Conclusão

- [ ] Scripts de ingestão (bitcoin e commodities) criados e funcionando
- [ ] Agendamentos configurados para rodar a cada 10 minutos
- [ ] Supabase criado, tabelas e seeds aplicados
- [ ] Rotinas SQL de transações rodando no Supabase
- [ ] Dados raw escritos no data lake simulado
- [ ] Pipeline DLT executado e tabelas bronze criadas
- [ ] Consultas de validação executadas nas tabelas bronze

---

## 🚀 Próximos Passos

**Aula 2:** Modelagem, KPIs e Governança
- Modelagem lógica/física das tabelas silver
- KPIs iniciais e agregações
- Qualidade de dados (expectations) e governança
