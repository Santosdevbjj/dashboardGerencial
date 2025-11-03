# ✅ Verificação de Dados – Dashboard Gerencial

Este documento apresenta os testes de consistência e qualidade de dados aplicados às fontes do projeto **Dashboard Gerencial para Tomada de Decisões**.

---

## 🔍 1. Verificação de Integridade Referencial

| Teste | Descrição | Resultado Esperado | Status |
|-------|------------|--------------------|--------|
| FK_Produto | Cada `ID_Produto` em FatoVendas deve existir em Produtos | 100% correspondência | ✅ |
| FK_Cliente | Cada `ID_Cliente` em FatoVendas deve existir em Clientes | 100% correspondência | ✅ |
| FK_Regiao | Cada `ID_Regiao` em FatoVendas deve existir em Regiões | 100% correspondência | ✅ |

---

## 🧮 2. Verificação de Totais e Agregações

| Métrica | Descrição | Valor Esperado | Resultado |
|----------|------------|----------------|------------|
| Total de Vendas | Soma de `ValorTotal` = Soma de `Quantidade * ValorUnitario * (1 - Desconto)` | Igualdade total | ✅ |
| Total de Lucro | Soma de `Lucro` > 0 em todas as regiões | Nenhum lucro negativo | ✅ |
| Ticket Médio | `Total Vendas / Nº Vendas` coerente com base de dados | Dentro de ±2% de variação | ⚠️ R04 com diferença de 0,5% |

---

## 🧾 3. Verificação de Formatos de Dados

| Campo | Tipo | Exemplo | Validação |
|--------|------|----------|------------|
| DataVenda | Date (AAAA-MM-DD) | 2024-02-10 | ✅ |
| ID_Produto | Texto (prefixo P) | P001 | ✅ |
| ID_Cliente | Texto (prefixo C) | C001 | ✅ |
| ID_Regiao | Texto (prefixo R) | R01 | ✅ |
| ValorTotal | Decimal (2 casas) | 750.00 | ✅ |

---

## 📊 4. Verificação de Cardinalidade

| Relacionamento | Tipo | Resultado |
|----------------|------|------------|
| Produtos → FatoVendas | 1:N | ✅ |
| Clientes → FatoVendas | 1:N | ✅ |
| Regiões → FatoVendas | 1:N | ✅ |

---

## 🧠 5. Observações Gerais

- Nenhuma linha duplicada detectada em `FatoVendas`;
- Datas de vendas dentro do intervalo 2024-01-01 a 2024-03-31;
- Todos os valores monetários positivos;
- Dimensões normalizadas e bem definidas.

**Status Final:** ✅ Base de dados validada e pronta para modelagem no Power BI.  

