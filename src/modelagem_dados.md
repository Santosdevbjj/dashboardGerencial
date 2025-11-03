# 🧱 Modelagem de Dados – Dashboard Gerencial

Este documento descreve a **estrutura lógica e física** do modelo de dados usado no projeto.

---

## 📊 Modelo Estrela (Star Schema)

**Tabela Fato:** `FatoVendas`  
**Tabelas Dimensão:** `Produtos`, `Clientes`, `Regioes`

### 🔸 FatoVendas
Contém os eventos de vendas individuais e métricas quantitativas.
| Campo | Tipo | Descrição |
|--------|------|------------|
| ID_Venda | INT | Identificador único da venda |
| DataVenda | DATE | Data da transação |
| ID_Produto | VARCHAR(10) | Chave para Produtos |
| ID_Cliente | VARCHAR(10) | Chave para Clientes |
| ID_Regiao | VARCHAR(10) | Chave para Regiões |
| Quantidade | INT | Quantidade de itens vendidos |
| ValorUnitario | DECIMAL(10,2) | Preço unitário |
| Desconto | DECIMAL(4,2) | Percentual aplicado |
| ValorTotal | DECIMAL(10,2) | Total da venda |
| Lucro | DECIMAL(10,2) | Margem de lucro obtida |

---

### 🔹 Produtos
| Campo | Tipo | Descrição |
|--------|------|------------|
| ID_Produto | VARCHAR(10) | Identificador do produto |
| NomeProduto | VARCHAR(100) | Nome comercial |
| Categoria | VARCHAR(50) | Categoria do produto |
| PrecoCusto | DECIMAL(10,2) | Custo de aquisição |
| PrecoVenda | DECIMAL(10,2) | Preço de venda |
| Fornecedor | VARCHAR(100) | Nome do fornecedor |

---

### 🔹 Clientes
| Campo | Tipo | Descrição |
|--------|------|------------|
| ID_Cliente | VARCHAR(10) | Identificador único |
| NomeCliente | VARCHAR(100) | Nome completo |
| Sexo | CHAR(1) | Gênero do cliente |
| Idade | INT | Idade |
| Cidade | VARCHAR(100) | Cidade de origem |
| Estado | CHAR(2) | Estado |
| Segmento | VARCHAR(50) | Tipo de cliente (Corporativo, Empresarial, etc.) |

---

### 🔹 Regiões
| Campo | Tipo | Descrição |
|--------|------|------------|
| ID_Regiao | VARCHAR(10) | Identificador da região |
| NomeRegiao | VARCHAR(50) | Nome geográfico |
| Estado | CHAR(2) | Estado principal |
| GerenteRegional | VARCHAR(100) | Responsável regional |

---

## 🔗 Relacionamentos

| Tabela Fato | Dimensão | Tipo de Relacionamento |
|--------------|-----------|------------------------|
| FatoVendas.ID_Produto | Produtos.ID_Produto | 1:N |
| FatoVendas.ID_Cliente | Clientes.ID_Cliente | 1:N |
| FatoVendas.ID_Regiao | Regioes.ID_Regiao | 1:N |

---

## 📈 Medidas DAX Utilizadas

```DAX
Total Vendas = SUM(FatoVendas[ValorTotal])
Lucro Total = SUM(FatoVendas[Lucro])
Ticket Médio = DIVIDE([Total Vendas], DISTINCTCOUNT(FatoVendas[ID_Venda]))
Quantidade Total = SUM(FatoVendas[Quantidade])

---
```



🎯 **Benefícios do Modelo Estrela**

Simplicidade e desempenho em consultas analíticas;

Facilidade para manutenção e expansão;

Compatibilidade com ferramentas de BI (Power BI, Excel, SQL Server Analysis Services);

Clareza visual para o usuário final.



---

📘 **Referências**

Microsoft Learn – Power BI Data Modeling Best Practices

Kimball, R. – The Data Warehouse Toolkit

---

