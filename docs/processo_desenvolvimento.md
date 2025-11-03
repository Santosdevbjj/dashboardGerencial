# 🛠️ Processo de Desenvolvimento do Dashboard Gerencial

Este documento descreve o processo completo de construção do dashboard, do planejamento à entrega final no GitHub.

---

## 🔹 Etapa 1 – Entendimento do Desafio

- Análise da descrição (`DescricaoDesafio002.docx`)
- Identificação dos requisitos visuais e de experiência do usuário
- Definição das métricas principais (Faturamento, Lucro, Ticket Médio)

---

## 🔹 Etapa 2 – Preparação dos Dados

1. Obtenção dos arquivos de dados (pasta `/data`)
2. Limpeza e transformação com **Power Query**
3. Criação das dimensões: Produto, Cliente, Região
4. Montagem da tabela fato (`FatoVendas`)

---

## 🔹 Etapa 3 – Modelagem e Medidas DAX

- Construção do modelo estrela
- Criação de medidas:
  ```DAX
  Total Vendas = SUM(FatoVendas[Valor])
  Lucro = SUM(FatoVendas[Lucro])
  Ticket Médio = DIVIDE([Total Vendas], DISTINCTCOUNT(FatoVendas[ID_Venda]))
