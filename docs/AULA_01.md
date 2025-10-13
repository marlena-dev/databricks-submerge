# 📚 AULA 01: O que é Databricks e Fundamentos do Lakehouse

## 🎯 Objetivo da Aula
Estabelecer a base conceitual e prática da plataforma Databricks, preparando o ambiente para desenvolvimento de pipelines de dados modernos.

---

## ⏰ Duração Estimada
**3-4 horas** (incluindo exercícios práticos)

---

## 📋 Pré-requisitos
- [ ] Conta no GitHub criada
- [ ] Conhecimentos básicos de SQL (recomendado)
- [ ] Conhecimentos básicos de Python (opcional)
- [ ] Navegador web atualizado

---

## 🗺️ Roteiro da Aula

### **Parte 1: Introdução ao Databricks (30 min)**

#### 1.1 O que é Databricks?
- [ ] **Conceito de Lakehouse**: Entendendo a evolução dos data warehouses
- [ ] **Databricks como plataforma unificada**: Analytics + AI + Data Engineering
- [ ] **Vantagens competitivas**: Performance, escalabilidade, governança
- [ ] **Casos de uso reais**: Empresas que usam Databricks

#### 1.2 Arquitetura Lakehouse
- [ ] **Comparação**: Data Warehouse vs Data Lake vs Lakehouse
- [ ] **Componentes principais**: Spark, Delta Lake, Unity Catalog
- [ ] **Benefícios da arquitetura**: ACID, versionamento, governança

### **Parte 2: Configuração do Ambiente (45 min)**

#### 2.1 Criando Conta no Databricks
- [ ] **Acesso ao Community Edition**: [community.cloud.databricks.com](https://community.cloud.databricks.com)
- [ ] **Processo de registro**: Email, verificação, configuração inicial
- [ ] **Navegação na interface**: Workspace, clusters, notebooks
- [ ] **Configurações básicas**: Perfil, preferências, idioma

#### 2.2 Integração com GitHub
- [ ] **Configuração do Git no Databricks**: Settings → Git Integration
- [ ] **Conectando repositório**: URL do repo, autenticação
- [ ] **Sincronização inicial**: Clone, pull, push
- [ ] **Configuração de branch**: main, desenvolvimento

### **Parte 3: Unity Catalog e Governança (60 min)**

#### 3.1 Unity Catalog - Visão Geral
- [ ] **O que é Unity Catalog**: Governança unificada de dados
- [ ] **Conceitos fundamentais**: Catalogs, Schemas, Tables
- [ ] **Hierarquia de objetos**: Organização lógica dos dados
- [ ] **Benefícios**: Segurança, auditoria, descoberta

#### 3.2 Configurando o Metastore
- [ ] **Criação do Metastore**: Configuração inicial
- [ ] **Definição de Catalogs**: Estrutura organizacional
- [ ] **Criação de Schemas**: Agrupamento lógico
- [ ] **Configuração de permissões**: Acesso e segurança

#### 3.3 Primeiros Objetos
- [ ] **Criando tabelas de exemplo**: Dados de demonstração
- [ ] **Explorando metadados**: Schema, estatísticas, histórico
- [ ] **Testando consultas**: SQL básico no Databricks

### **Parte 4: Apache Spark e Delta Lake (45 min)**

#### 4.1 Fundamentos do Apache Spark
- [ ] **Arquitetura do Spark**: Driver, Executors, Cluster
- [ ] **Conceitos de RDD**: Resilient Distributed Datasets
- [ ] **DataFrames e Datasets**: APIs de alto nível
- [ ] **Lazy Evaluation**: Otimização de execução

#### 4.2 Delta Lake - O Coração do Lakehouse
- [ ] **O que é Delta Lake**: ACID transactions em data lakes
- [ ] **Versionamento de dados**: Time travel, histórico
- [ ] **Schema evolution**: Evolução de esquemas
- [ ] **Upsert operations**: MERGE, UPDATE, DELETE

#### 4.3 Primeiro Notebook
- [ ] **Criando notebook**: Interface, células, execução
- [ ] **Código Python básico**: Spark SQL, DataFrames
- [ ] **Código SQL**: Consultas diretas
- [ ] **Visualizações**: Gráficos e dashboards

### **Parte 5: Hands-on Prático (60 min)**

#### 5.1 Exercício 1: Configuração Completa
- [ ] **Setup do ambiente**: Cluster, bibliotecas, configurações
- [ ] **Criação de dados de exemplo**: Dataset de vendas
- [ ] **Primeira tabela Delta**: Criação e inserção
- [ ] **Consultas básicas**: SELECT, WHERE, GROUP BY

#### 5.2 Exercício 2: Explorando Funcionalidades
- [ ] **Time Travel**: Visualizando versões anteriores
- [ ] **Schema Evolution**: Adicionando colunas
- [ ] **VACUUM**: Limpeza de arquivos antigos
- [ ] **OPTIMIZE**: Compactação de dados

#### 5.3 Exercício 3: Integração GitHub
- [ ] **Commit de código**: Salvando notebooks
- [ ] **Sincronização**: Pull/Push com repositório
- [ ] **Versionamento**: Controle de versões
- [ ] **Colaboração**: Trabalho em equipe

---

## 🎯 Objetivos de Aprendizagem

Ao final desta aula, você será capaz de:

- [ ] **Explicar** o conceito de Lakehouse e suas vantagens
- [ ] **Configurar** uma conta Databricks e integrar com GitHub
- [ ] **Navegar** pela interface do Databricks com confiança
- [ ] **Entender** a arquitetura do Unity Catalog
- [ ] **Criar** e gerenciar objetos no Unity Catalog
- [ ] **Compreender** os fundamentos do Apache Spark
- [ ] **Trabalhar** com Delta Lake e suas funcionalidades
- [ ] **Desenvolver** notebooks básicos no Databricks
- [ ] **Aplicar** boas práticas de governança de dados

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

- [ ] Conta Databricks criada e configurada
- [ ] Integração com GitHub funcionando
- [ ] Unity Catalog configurado com catalogs e schemas
- [ ] Primeiro notebook criado e executado
- [ ] Tabela Delta criada com dados de exemplo
- [ ] Consultas SQL básicas executadas
- [ ] Código versionado no GitHub
- [ ] Conceitos fundamentais compreendidos

---

## 🚀 Próximos Passos

**Aula 2:** Modelagem, KPIs e Governança
- Implementação da arquitetura Medallion
- Ingestão de dados com CDC
- Configuração de camadas Bronze
- Estabelecimento de governança avançada

---

> 💡 **Dica:** Mantenha este roteiro como referência durante toda a imersão. Os conceitos aprendidos aqui serão fundamentais para as próximas aulas!
