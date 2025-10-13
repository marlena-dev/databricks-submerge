# 📚 AULA 02: Modelagem, KPIs e Governança

## 🎯 Objetivo da Aula
Aplicar a arquitetura Medallion (Bronze, Silver, Gold) e implementar governança de dados robusta, criando KPIs e métricas de qualidade.

---

## ⏰ Duração Estimada
**4-5 horas** (incluindo exercícios práticos e projetos)

---

## 📋 Pré-requisitos
- [ ] AULA 01 concluída com sucesso
- [ ] Conta Databricks configurada
- [ ] Unity Catalog funcionando
- [ ] Integração GitHub ativa
- [ ] Conhecimentos básicos de SQL

---

## 🗺️ Roteiro da Aula

### **Parte 1: Arquitetura Medallion (60 min)**

#### 1.1 Conceitos da Medallion Architecture
- [ ] **Bronze Layer**: Dados brutos, ingestão raw
- [ ] **Silver Layer**: Dados limpos e validados
- [ ] **Gold Layer**: Dados agregados e prontos para consumo
- [ ] **Fluxo de dados**: Pipeline entre camadas
- [ ] **Vantagens**: Governança, qualidade, performance

#### 1.2 Implementação da Estrutura
- [ ] **Criação de schemas**: bronze, silver, gold
- [ ] **Configuração de permissões**: Acesso por camada
- [ ] **Definição de padrões**: Nomenclatura, estrutura
- [ ] **Documentação**: Metadados e descrições

### **Parte 2: Change Data Capture (CDC) (90 min)**

#### 2.1 Fundamentos do CDC
- [ ] **O que é CDC**: Captura de mudanças incrementais
- [ ] **Tipos de CDC**: Log-based, Trigger-based, Timestamp-based
- [ ] **Vantagens**: Eficiência, tempo real, auditoria
- [ ] **Casos de uso**: Replicação, sincronização, analytics

#### 2.2 Implementação no Databricks
- [ ] **Auto Loader**: Ingestão automática de arquivos
- [ ] **Streaming**: Processamento em tempo real
- [ ] **Delta Live Tables**: Pipeline declarativo
- [ ] **Configuração de triggers**: Eventos e schedules

#### 2.3 Hands-on CDC
- [ ] **Simulação de dados**: Gerador de eventos
- [ ] **Configuração de Auto Loader**: S3, file formats
- [ ] **Pipeline Bronze**: Ingestão automática
- [ ] **Monitoramento**: Logs, métricas, alertas

### **Parte 3: Camada Bronze (75 min)**

#### 3.1 Estratégias de Ingestão
- [ ] **Batch vs Streaming**: Quando usar cada abordagem
- [ ] **Formato de dados**: JSON, Parquet, CSV, Avro
- [ ] **Compressão**: Gzip, Snappy, LZ4
- [ ] **Particionamento**: Por data, região, categoria

#### 3.2 Qualidade de Dados
- [ ] **Validação de schema**: Tipos, obrigatoriedade
- [ ] **Detecção de anomalias**: Outliers, valores inválidos
- [ ] **Deduplicação**: Identificação de duplicatas
- [ ] **Enriquecimento**: Dados de referência

#### 3.3 Implementação Prática
- [ ] **Criação de tabelas Bronze**: Estrutura inicial
- [ ] **Pipeline de ingestão**: Auto Loader + validações
- [ ] **Logs de auditoria**: Rastreabilidade
- [ ] **Métricas de qualidade**: KPIs de ingestão

### **Parte 4: Governança e KPIs (90 min)**

#### 4.1 Governança de Dados
- [ ] **Data Lineage**: Rastreamento de origem
- [ ] **Data Catalog**: Descoberta e documentação
- [ ] **Access Control**: Permissões granulares
- [ ] **Compliance**: LGPD, GDPR, SOX

#### 4.2 KPIs de Qualidade
- [ ] **Completude**: % de campos preenchidos
- [ ] **Conformidade**: % de registros válidos
- [ ] **Consistência**: % de dados coerentes
- [ ] **Temporalidade**: % de dados atualizados

#### 4.3 Implementação de KPIs
- [ ] **Criação de dashboards**: Métricas visuais
- [ ] **Alertas automáticos**: Thresholds e notificações
- [ ] **Relatórios**: Documentação de qualidade
- [ ] **Ações corretivas**: Workflows de correção

### **Parte 5: Projeto Prático (90 min)**

#### 5.1 Dataset de E-commerce
- [ ] **Estrutura de dados**: Produtos, vendas, clientes
- [ ] **Simulação de eventos**: Transações em tempo real
- [ ] **Implementação Bronze**: Ingestão completa
- [ ] **Validações**: Regras de negócio

#### 5.2 Pipeline Completo
- [ ] **Configuração de schemas**: bronze, silver, gold
- [ ] **Pipeline automatizado**: Delta Live Tables
- [ ] **Monitoramento**: Jobs, execuções, erros
- [ ] **Documentação**: README, comentários

#### 5.3 Análise de Qualidade
- [ ] **Cálculo de KPIs**: Métricas de qualidade
- [ ] **Visualizações**: Gráficos e dashboards
- [ ] **Relatórios**: Documentação de resultados
- [ ] **Recomendações**: Melhorias identificadas

---

## 🎯 Objetivos de Aprendizagem

Ao final desta aula, você será capaz de:

- [ ] **Implementar** a arquitetura Medallion completa
- [ ] **Configurar** pipelines de CDC com Auto Loader
- [ ] **Criar** camadas Bronze com qualidade garantida
- [ ] **Estabelecer** governança robusta de dados
- [ ] **Desenvolver** KPIs de qualidade de dados
- [ ] **Monitorar** pipelines com métricas e alertas
- [ ] **Aplicar** boas práticas de modelagem
- [ ] **Documentar** processos e metadados
- [ ] **Troubleshoot** problemas de ingestão

---

## 🛠️ Ferramentas e Tecnologias

### Databricks
- **Auto Loader**: Ingestão automática
- **Delta Live Tables**: Pipelines declarativos
- **Unity Catalog**: Governança unificada
- **Workflows**: Orquestração de jobs

### Qualidade de Dados
- **Great Expectations**: Validação de dados
- **Data Quality Rules**: Regras nativas
- **Data Profiling**: Análise de qualidade
- **Monitoring**: Métricas e alertas

### Visualização
- **Databricks SQL**: Dashboards nativos
- **Grafana**: Monitoramento avançado
- **Custom Dashboards**: Visualizações personalizadas

---

## 📊 KPIs de Sucesso

### Ingestão
- **Throughput**: Registros processados por minuto
- **Latência**: Tempo entre evento e disponibilidade
- **Disponibilidade**: % de uptime do pipeline
- **Erro Rate**: % de registros com falha

### Qualidade
- **Completude**: % de campos obrigatórios preenchidos
- **Conformidade**: % de registros seguindo schema
- **Consistência**: % de dados coerentes entre sistemas
- **Temporalidade**: % de dados atualizados em tempo hábil

### Governança
- **Lineage Coverage**: % de tabelas com lineage
- **Documentation**: % de objetos documentados
- **Access Control**: % de acessos controlados
- **Compliance**: % de requisitos atendidos

---

## 📚 Recursos Adicionais

### Documentação
- [Delta Live Tables Guide](https://docs.databricks.com/workflows/delta-live-tables/index.html)
- [Auto Loader Documentation](https://docs.databricks.com/ingestion/auto-loader/index.html)
- [Data Quality Guide](https://docs.databricks.com/data-quality/index.html)

### Tutoriais
- [Medallion Architecture Best Practices](https://docs.databricks.com/lakehouse/medallion.html)
- [CDC Implementation Guide](https://docs.databricks.com/ingestion/auto-loader/cloud-files-auto-loader.html)
- [Data Governance with Unity Catalog](https://docs.databricks.com/data-governance/unity-catalog/index.html)

---

## ✅ Checklist de Conclusão

- [ ] Arquitetura Medallion implementada
- [ ] Pipeline CDC funcionando
- [ ] Camada Bronze configurada
- [ ] KPIs de qualidade criados
- [ ] Governança estabelecida
- [ ] Projeto prático concluído
- [ ] Documentação atualizada
- [ ] Código versionado no GitHub

---

## 🚀 Próximos Passos

**Aula 3:** Automação, Agentes de IA e Portfólio
- Desenvolvimento de camadas Silver e Gold
- Implementação de ETL/ELT automatizados
- Criação de visualizações e dashboards
- Exploração de agentes de IA
- Construção de portfólio profissional

---

> 💡 **Dica:** Esta aula é fundamental para estabelecer uma base sólida de governança. Os conceitos aprendidos aqui serão essenciais para escalar seus pipelines de dados!
