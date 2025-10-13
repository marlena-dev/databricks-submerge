# 🚀 Imersão Databricks — Jornada de Dados

Bem-vindo à **Imersão Databricks**, um treinamento intensivo de **3 dias** criado pela **Jornada de Dados** para te levar do zero à construção de pipelines completos na plataforma Databricks, dominando **Spark, Delta Lake e a arquitetura Lakehouse**.

---

## 🎯 Objetivo

Capacitar você a construir pipelines de dados modernos para um **Lakehouse**, aplicando boas práticas de engenharia de dados com **scripts Python para ingestão de APIs** e (opcionalmente) **Fivetran para ingestão de bancos de dados**, usando **Databricks Free Edition** integrado ao **GitHub** para versionamento e governança.

Durante a imersão, você vai:

- Criar sua conta gratuita no Databricks e integrar com o GitHub.  
- Entender a arquitetura **Bronze, Silver e Gold** dentro do Unity Catalog.  
- Ingerir dados de APIs com **scripts Python** e agendamento.  
- (Opcional) Ingerir dados de bancos relacionais usando **Fivetran**.  
- Aplicar transformações e criar camadas analíticas.  
- Automatizar e visualizar seus pipelines no Databricks.

---

## 🗓️ Estrutura do Treinamento

### Dia 1 — Aula 01: Ingestão e Lakehouse (Raw→Bronze)
- Ingerir dados de 2 APIs (Bitcoin e commodities) com scripts Python.
- Agendar execuções recorrentes (cron/Jobs) a cada 10 minutos.
- Persistir dados na camada **raw** e promover para **bronze** com DLT.
- Referência: `docs/AULA_01.md`.

### Dia 2 — KPIs e Modelagem (Silver→Gold)
- Definir KPIs e métricas de negócio a partir da bronze.
- Criar camadas **Silver** (refino e padronização) e **Gold** (curadoria e consumo).
- Implementar transformações SQL/PySpark, qualidade de dados e partições.
- Gerar tabelas agregadas para visualização e consumo analítico.

### Dia 3 — Agente de Inteligência Artificial
- Construir um agente de IA que consome dados da **Gold**.
- Expor consultas/insights com linguagem natural (LLM) e prompts guiados.
- Integrar o agente ao pipeline (monitoramento básico e tracing).

---

## 🧱 Arquitetura de Referência

O projeto segue o padrão de camadas **Medallion Architecture**:

```text
Sistema de Origem  →  Bronze (Raw)  →  Silver (Refined)  →  Gold (Curated)
                              |
                           Unity Catalog
                              |
                        Governança & Acesso
````

---

## 👥 Público-Alvo

Profissionais e estudantes de **dados, engenharia, BI e analytics** que desejam aprender na prática como criar pipelines reais e governados com **Spark e Databricks**.

---

## ⚙️ Pré-Requisitos

* Conta gratuita no [Databricks Community Edition](https://community.cloud.databricks.com)
* Conta no [GitHub](https://github.com)
* (Opcional) Conta no [Fivetran](https://www.fivetran.com/) para ingestão de bancos
* Conhecimentos básicos de SQL e Python (opcional)

### 📺 Tutorial: Como Criar sua Conta no Databricks

**Aprenda a criar sua conta no Databricks assistindo este vídeo tutorial:**

🎥 **[Como Criar Conta no Databricks - Tutorial Completo](https://youtu.be/KJv1bZ6-gSY)**

Este vídeo te guiará passo a passo para:
- Criar sua conta gratuita no Databricks Community Edition
- Configurar seu perfil e preferências iniciais
- Navegar pela interface do Databricks
- Configurar seu primeiro workspace

---

## 🧠 Tecnologias Utilizadas

* **Databricks**
* **Apache Spark**
* **Delta Lake**
* **Unity Catalog**
* **Python / SQL**
* **(Opcional) Fivetran**
* **Amazon S3 (simulado)**
* **Git e GitHub**

---

## 🏁 Resultados Esperados

Ao final da imersão, você será capaz de:

* Configurar um ambiente Databricks completo.
* Ingerir dados de APIs com scripts Python e (opcionalmente) de bancos com Fivetran.
* Calcular KPIs e modelar camadas **Silver** e **Gold**.
* Integrar um agente de IA consumindo dados da camada **Gold**.
* Aplicar boas práticas de governança e versionamento.

---

## 📚 Créditos

Desenvolvido por **Luciano Vasconcelos** e o time da **Jornada de Dados**.
Mais informações em: [https://jornadadedados.com.br](https://jornadadedados.com.br)

---

## 💬 Contato

📩 **E-mail:** [contato@jornadadedados.com.br](mailto:contato@jornadadedados.com.br)
💼 **LinkedIn:** [Luciano Vasconcelos](https://linkedin.com/in/lucianovasconcelos)
📺 **YouTube:** [Jornada de Dados](https://youtube.com/@jornadadedados)

---

> “A engenharia de dados moderna começa quando você entende que o dado é o seu produto.”
> — Jornada de Dados
