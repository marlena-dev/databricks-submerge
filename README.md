# 🚀 Imersão Databricks — Jornada de Dados

Bem-vindo à **Imersão Databricks**, um treinamento intensivo de **3 dias** criado pela **Jornada de Dados** para te levar do zero à construção de pipelines completos na plataforma Databricks, dominando **Spark, Delta Lake e a arquitetura Lakehouse**.

---

## 🎯 Objetivo

Capacitar você a construir pipelines de dados modernos para um **Lakehouse**, aplicando boas práticas de engenharia de dados com **scripts Python para ingestão de APIs** e **Fivetran para ingestão de bancos de dados**, usando **Databricks Free Edition** integrado ao **GitHub** para versionamento e governança.

Durante a imersão, você vai:

- Criar sua conta gratuita no Databricks e integrar com o GitHub.  
- Entender a arquitetura **Bronze, Silver e Gold** dentro do Unity Catalog.  
- Ingerir dados de APIs com **scripts Python** e agendamento.  
- Ingerir dados de bancos relacionais usando **Fivetran**.  
- Aplicar transformações e criar camadas analíticas.  
- Automatizar e visualizar seus pipelines no Databricks.

---

## 🗓️ Estrutura do Treinamento

### **Aula 1: Ingestão via APIs com Python e Lakehouse (Raw→Bronze)**
**Objetivo Principal:** Ingerir dados de 2 APIs (Bitcoin e commodities) com scripts Python, agendar execuções e organizar em camadas no Lakehouse.

**Objetivos Específicos:**
- Converter notebooks de ingestão em scripts Python executáveis e versionados.
- Agendar execuções (cron/Jobs) para coleta recorrente.
- Persistir dados na camada **raw** e promover para **bronze** (DLT).

**Principais Tópicos:** Python (requests/yfinance), arquivos raw, DLT, Databricks Jobs

---

### **Aula 2: Ingestão de Bancos de Dados com Fivetran**
**Objetivo Principal:** Conectar bancos relacionais e ingerir dados para o Lakehouse usando **Fivetran**.

**Objetivos Específicos:**
- Configurar conectores Fivetran (ex.: Postgres/Supabase).
- Sincronizar dados para o storage/lake com Delta.
- Versionamento/monitoração de cargas e qualidade básica.

**Principais Tópicos:** Fivetran, conectores, Lakehouse, Delta, monitoração

---

### **Aula 3: Automação, Modelagem e Portfólio**
**Objetivo Principal:** Automatizar pipelines, modelar **Silver/Gold** e publicar resultados.

**Objetivos Específicos:**
- Desenvolver camadas **Silver** (refinadas) e **Gold** (curadas).
- Orquestrar pipelines e configurar SLAs/SLOs.
- Criar visualizações/dashboards e consolidar portfólio.

**Principais Tópicos:** ETL/ELT, SQL no Databricks, Delta Lake, agendamento, visualização

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
* Conta no [Fivetran](https://www.fivetran.com/) (trial) para a Aula 2
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
* **Fivetran**
* **Amazon S3 (simulado)**
* **Python / SQL**
* **Git e GitHub**

---

## 🏁 Resultados Esperados

Ao final da imersão, você será capaz de:

* Configurar um ambiente Databricks completo.
* Ingerir dados de APIs com scripts Python e de bancos com Fivetran.
* Aplicar boas práticas de governança e versionamento.
* Entender a lógica da arquitetura **Lakehouse**.
* Criar pipelines reprodutíveis e escaláveis.

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

```
