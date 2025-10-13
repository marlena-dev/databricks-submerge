# 🚀 Imersão Databricks — Jornada de Dados

Bem-vindo à **Imersão Databricks**, um treinamento intensivo de **3 dias** criado pela **Jornada de Dados** para te levar do zero à construção de pipelines completos na plataforma Databricks, dominando **Spark, Delta Lake e a arquitetura Lakehouse**.

---

## 🎯 Objetivo

Capacitar você a construir pipelines de dados modernos, aplicando boas práticas de engenharia de dados em um ambiente real de nuvem, utilizando **Databricks Free Edition** e conectando com **GitHub** para versionamento e governança.

Durante a imersão, você vai:

- Criar sua conta gratuita no Databricks e integrar com o GitHub.  
- Entender a arquitetura **Bronze, Silver e Gold** dentro do Unity Catalog.  
- Ingerir dados via **CDC (Change Data Capture)** para o Lakehouse.  
- Aplicar transformações e criar camadas analíticas.  
- Automatizar e visualizar seus pipelines no Databricks.

---

## 🗓️ Estrutura do Treinamento

### **Aula 1: O que é Databricks e Fundamentos do Lakehouse**
**Objetivo Principal:** Estabelecer a base conceitual e prática da plataforma Databricks

**Objetivos Específicos:**
- Criar conta gratuita no Databricks Community Edition
- Integrar o ambiente com GitHub para versionamento
- Entender a arquitetura **Lakehouse** e seus benefícios
- Configurar o **Unity Catalog** e **Metastore**
- Compreender os fundamentos do **Apache Spark** e **Delta Lake**
- Explorar a interface do Databricks e suas funcionalidades básicas

**Principais Tópicos:** Conta Free, GitHub, Unity Catalog, Metastore, Fundamentos do Spark

---

### **Aula 2: Modelagem, KPIs e Governança**
**Objetivo Principal:** Aplicar a arquitetura Medallion (Bronze, Silver, Gold) e implementar governança de dados

**Objetivos Específicos:**
- Implementar **Change Data Capture (CDC)** para ingestão de dados
- Configurar camadas **Bronze** (dados brutos) no Lakehouse
- Aplicar transformações usando **Auto Loader** e **S3**
- Entender e implementar a **Medallion Architecture**
- Estabelecer **governança de dados** através do Unity Catalog
- Criar **KPIs** e métricas de qualidade dos dados
- Aplicar boas práticas de **modelagem de dados**

**Principais Tópicos:** CDC, S3, Delta Lake, Auto Loader, Medallion Architecture, Governança

---

### **Aula 3: Automação, Agentes de IA e Portfólio**
**Objetivo Principal:** Automatizar pipelines e criar soluções escaláveis com IA

**Objetivos Específicos:**
- Desenvolver camadas **Silver** (dados refinados) e **Gold** (dados curados)
- Implementar **ETL/ELT** automatizados no Databricks
- Utilizar **SQL no Databricks** para transformações avançadas
- Criar **visualizações** e dashboards
- Explorar **agentes de IA** e automação inteligente
- Implementar **pipelines reprodutíveis e escaláveis**
- Construir um **portfólio prático** com projetos reais
- Aplicar **boas práticas de engenharia de dados**

**Principais Tópicos:** ETL, SQL no Databricks, Visualização, Governança, Agentes de IA, Automação

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
* **Amazon S3 (simulado)**
* **Python / SQL**
* **Git e GitHub**

---

## 🏁 Resultados Esperados

Ao final da imersão, você será capaz de:

* Configurar um ambiente Databricks completo.
* Ingerir e transformar dados de forma incremental.
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

---

Quer que eu adicione uma **seção de instruções práticas** (por exemplo, comandos para configurar o repositório, clonar, conectar ao Databricks e rodar os notebooks)? Isso deixaria o README ainda mais útil para os alunos.
```
