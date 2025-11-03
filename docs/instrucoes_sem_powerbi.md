# 🧩 Instruções para Criar o Dashboard Sem o Power BI Instalado

Este documento descreve o processo completo para **criar o Dashboard Gerencial sem precisar instalar o Power BI Desktop**.  
O objetivo é permitir que você **reproduza e compreenda o relatório manualmente**, utilizando ferramentas gratuitas como **Excel, Google Sheets, Power BI Service Online e Power BI Report Builder**.

---

## 🧠 Objetivo

Recriar a estrutura visual e analítica do relatório **SalesReport.pbix** e **Exemplo.pbix** usando métodos alternativos, mantendo o mesmo raciocínio de modelagem e UX de dados.

---

## 🔧 Etapa 1 – Preparar os Dados

1. Acesse a pasta `/data` do repositório.
2. Abra os arquivos:
   - `sales_data_sample.csv`
   - `products.csv`
   - `customers.csv`
   - `regions.csv`
3. No Excel ou Google Sheets:
   - Verifique o formato das colunas (Datas, Números e Texto)
   - Crie tabelas nomeadas (`tblSales`, `tblProducts`, etc.)
   - Use o recurso **PROCV / XLOOKUP** para relacionar as tabelas.
   - Gere uma tabela consolidada chamada `FatoVendas`.

> 💡 Dica: mantenha colunas com nomes consistentes, sem espaços e acentuação (ex.: `DataVenda`, `Valor`, `Produto`, `Regiao`).

---

## 🧩 Etapa 2 – Modelagem de Dados Manual

Crie um **modelo estrela simples**, como o Power BI faria:

| Tipo | Tabela | Chave Primária | Chave Estrangeira |
|------|---------|----------------|-------------------|
| Fato | FatoVendas | ID_Venda | - |
| Dimensão | Produtos | ID_Produto | ID_Produto |
| Dimensão | Clientes | ID_Cliente | ID_Cliente |
| Dimensão | Regiões | ID_Regiao | ID_Regiao |

No Excel, utilize **Power Pivot (se disponível)** ou crie as relações manualmente via fórmulas.

---

## 📊 Etapa 3 – Criação dos Gráficos

Reproduza os visuais principais utilizando **gráficos nativos do Excel**:

| Visual | Tipo | Fonte | Finalidade |
|--------|------|--------|-------------|
| Faturamento Mensal | Gráfico de Área | FatoVendas | Analisar evolução |
| Matriz de Vendas | Tabela Dinâmica | FatoVendas + Produtos | Cruzar produtos x regiões |
| Vendas por Região | Gráfico de Barras | FatoVendas + Regiões | Comparar performance |
| Indicadores Principais | Cartões (células formatadas) | FatoVendas | KPIs de receita, lucro e volume |

> 💡 Utilize **cores consistentes e contraste leve** para seguir os princípios de UX: legibilidade, espaçamento e hierarquia visual.

---

## 🧭 Etapa 4 – Simulando Navegação

Como o Power BI permite botões interativos, você pode simular essa função:

1. Crie **abas** no Excel chamadas:
   - `Resumo`
   - `Matriz`
   - `Análise`
2. Adicione **formas com hiperlinks** (Inserir → Forma → Atribuir link → Nome da aba).
3. Crie um menu fixo (por exemplo, na parte superior da planilha) com botões:
   - 🏠 Início | 📊 Vendas | 🔍 Análise

---

## 🎨 Etapa 5 – Aplicando Estilo Visual

Siga os princípios do desafio:

- **Proporção Áurea:** balanceie o espaço dos gráficos (Ex.: 1/3 e 2/3 da tela)
- **Contraste:** texto escuro sobre fundo claro
- **Posicionamento:** KPIs no topo, gráficos abaixo
- **Segmentação:** crie filtros manuais (listas suspensas ou segmentadores)

---

## ☁️ Etapa 6 – Visualização Online (Power BI Service)

1. Acesse [https://app.powerbi.com](https://app.powerbi.com)
2. Faça login com sua conta Microsoft gratuita.
3. Clique em **Carregar > Arquivo Local**.
4. Importe o `.pbix` ou `.xlsx` criado.
5. Use o recurso **“Exibir Relatório”** para interagir online.

---

## ✅ Resultado Esperado

Ao final, você terá um **Dashboard Gerencial funcional**, com:
- KPIs de Vendas e Receita
- Gráfico de Área com Tendência Temporal
- Matriz de Vendas por Região e Produto
- Navegação simulada entre páginas

---

## 📚 Referências

- Microsoft Learn – [Modelagem de Dados no Excel](https://learn.microsoft.com/pt-br/power-query/)
- Power BI Docs – [Power BI Service](https://learn.microsoft.com/pt-br/power-bi/)
- Curso: *Atualizando Relatório Financeiro com Foco na Experiência do Usuário*
