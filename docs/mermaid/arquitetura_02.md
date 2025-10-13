# 🏗️ Arquitetura PySpark + Delta Lake

Este diagrama mostra a arquitetura interna do PySpark Engine e sua integração com o Delta Lake Storage.

```mermaid
graph TD
    subgraph Engine["⚙️ PySpark Engine"]
        A[Driver Program]
        B[Executors]
        C[Spark SQL / DataFrame API]
        D[Spark Cluster]
        A --> B
        A --> C
        C --> D
    end

    subgraph Storage["💾 Delta Lake Storage"]
        E[Delta Tables]
        F[Transaction Log _delta_log]
        G[Parquet Files]
        E --> F
        E --> G
    end

    D -->|Read, Write, Update, Merge| E

    classDef engine fill:#E3F2FD,stroke:#90CAF9,color:#0D47A1;
    classDef storage fill:#E8F5E9,stroke:#81C784,color:#1B5E20;

    class A,B,C,D engine;
    class E,F,G storage;
```

## 📋 Componentes da Arquitetura

### ⚙️ PySpark Engine
- **Driver Program**: Coordena a execução dos jobs
- **Executors**: Processam as tarefas em paralelo
- **Spark SQL / DataFrame API**: Interface de alto nível para manipulação de dados
- **Spark Cluster**: Infraestrutura distribuída de processamento

### 💾 Delta Lake Storage
- **Delta Tables**: Tabelas com suporte a ACID transactions
- **Transaction Log**: Registro de todas as operações (_delta_log)
- **Parquet Files**: Arquivos de dados otimizados para analytics

## 🔄 Fluxo de Dados
O Spark Cluster interage com o Delta Lake através de operações de:
- **Read**: Leitura de dados das Delta Tables
- **Write**: Escrita de novos dados
- **Update**: Atualização de registros existentes
- **Merge**: Operações de upsert (insert/update)
