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


  ---


**Relacionamentos 1:N entre dimensões e fato**



---

🔹 **Etapa 4 – Construção dos Visuais**

1. Página 1: KPIs e gráfico de área


2. Página 2: Matriz de vendas


3. Página 3: Navegação e resumo geral



> Cada página deve seguir os princípios de UX (equilíbrio, contraste e hierarquia visual).




---

🔹 **Etapa 5 – Interatividade e Navegação**

Inserção de botões de página e menus horizontais

Efeitos de foco e seleção

Cores e ícones consistentes



---

🔹 **Etapa 6 – Testes e Ajustes**

Verificação de medidas DAX

Testes de responsividade e legibilidade

Aplicação do checklist visual (/tests/checklist_layout.md)



---

🔹 **Etapa 7 – Documentação e Publicação**

Geração dos arquivos .pbix e .csv

Atualização da documentação técnica

Publicação no GitHub:

git add .
git commit -m "Versão final do Dashboard Gerencial"
git push origin main



---

🧭 **Resultado Final Esperado**

Dashboard interativo com 3 páginas

Matriz de vendas funcional

Design profissional e coerente com princípios de UX

Documentação completa e reprodutível mesmo sem Power BI instalado


---


  
