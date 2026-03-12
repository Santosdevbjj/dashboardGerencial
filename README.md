# 📊 Dashboard Gerencial — BI com Foco em Decisão e Experiência do Usuário

<img width="1080" height="746" alt="Screenshot_20251102-230621" src="https://github.com/user-attachments/assets/2eed60d2-9d12-470a-8b39-b58284bf825a" />

**Business Intelligence com Power BI**

---

## 1. Problema de Negócio

Organizações que já possuem dados financeiros e operacionais estruturados enfrentam um problema silencioso: **os dados existem, mas as decisões continuam sendo tomadas no escuro.**

O motivo raramente é falta de relatório — é excesso de relatório errado. Planilhas densas, gráficos sem hierarquia visual, KPIs espalhados sem prioridade e navegação confusa fazem com que gestores ignorem os dados disponíveis e tomem decisões pela intuição. O custo disso é invisível até que um indicador crítico seja ignorado por semanas porque estava enterrado na quinta aba de um arquivo Excel.

O desafio deste projeto foi direto: **construir um dashboard gerencial que gestores realmente usem** — onde a informação mais urgente aparece primeiro, a navegação entre visões é intuitiva e qualquer KPI pode ser analisado em profundidade em menos de três cliques.

---

## 2. Contexto

Este projeto foi desenvolvido, com inspiração no desafio "Atualizando Relatório Financeiro com Foco na Experiência do Usuário" — adaptado para um cenário gerencial profissional real.

O ponto de partida foi um conjunto de dados financeiros e operacionais consolidados em fontes heterogêneas (Excel, CSV e SQL), representando o ambiente típico de uma organização que acumula dados em silos sem uma camada analítica unificada.

A solução construída vai além de um relatório bonito: é um **sistema de tomada de decisão visual**, onde cada elemento — da paleta de cores à ordem dos KPIs — foi pensado para reduzir o esforço cognitivo do gestor e aumentar a velocidade de leitura e interpretação dos dados.

---

## 3. Premissas do Projeto

Para o desenvolvimento do dashboard, as seguintes premissas foram adotadas:

- **O usuário-alvo é o gestor, não o analista.** O dashboard foi projetado para ser lido por quem toma decisões, não por quem processa dados. Isso significou priorizar clareza sobre completude em cada escolha de visual.
- **Hierarquia visual é hierarquia de prioridade.** KPIs posicionados no topo e em destaque são os de maior impacto no negócio — não os mais fáceis de calcular. A ordem dos elementos no layout não é estética, é estratégica.
- **Interatividade serve ao fluxo de análise.** Filtros e slicers foram posicionados para guiar o gestor de uma visão consolidada para o detalhe — nunca o inverso. O caminho natural de leitura é: "O que está acontecendo?" → "Onde?" → "Por quê?"
- **Nenhum KPI existe sem contexto.** Faturamento isolado não informa. Faturamento comparado ao período anterior, à meta e ao ticket médio informa. Todas as métricas foram projetadas com comparação temporal ou referência de desempenho.
- **Fontes de dados consolidadas, não duplicadas.** Dados provenientes de Excel, CSV e SQL foram unificados na camada Power Query antes de qualquer modelagem — eliminando inconsistências de origem antes que chegassem ao modelo.

---

## 4. Estratégia da Solução

A construção seguiu um pipeline orientado pelo fluxo de decisão do gestor, não pela lógica técnica do analista:

**Etapa 1 — Mapeamento das perguntas de negócio**
Antes de abrir o Power BI, foram mapeadas as perguntas que o dashboard precisava responder: Qual o faturamento do período? Como estamos em relação ao período anterior? Quais produtos/regiões puxam os resultados para cima — e para baixo? Qual o ticket médio e como ele evoluiu? Onde a margem está pressionada?

Essas perguntas definiram os KPIs, as dimensões de análise e a estrutura de navegação — tudo antes de qualquer visual ser criado.

**Etapa 2 — Consolidação e limpeza das fontes (Power Query)**
Integração das fontes heterogêneas (Excel, CSV, SQL) em um fluxo único de ETL no Power Query. Padronização de tipos de dados, tratamento de valores nulos, normalização de nomes de colunas e remoção de duplicatas. A camada de transformação foi documentada passo a passo para garantir rastreabilidade e facilitar manutenção futura.

**Etapa 3 — Modelagem analítica**
Construção do modelo de dados com separação entre tabelas fato e dimensão, relacionamentos verificados por cardinalidade e direções de filtro configuradas para que os slicers propagassem corretamente entre todas as visões do dashboard.

**Etapa 4 — Criação das medidas DAX**
Desenvolvimento dos KPIs como medidas DAX — não colunas calculadas — garantindo que respondam ao contexto de filtro do relatório em tempo real. Métricas implementadas: Faturamento Total, Margem (% e valor absoluto), Volume de Vendas, Ticket Médio, variação período a período e análise temporal acumulada.

**Etapa 5 — Design orientado à UX de dados**
Aplicação dos princípios de UX em BI: hierarquia visual com KPIs principais em destaque no topo, uso de cores para sinalizar status (verde/vermelho para variações positivas/negativas), espaçamento consistente, tipografia legível em telas de diferentes resoluções e navegação por páginas com botões visuais — não abas técnicas.

**Etapa 6 — Validação com o fluxo de decisão**
Cada página foi revisada com a pergunta: "Um gestor que vê isso pela primeira vez consegue entender o que está acontecendo em menos de 10 segundos?" Ajustes de layout, ordenação de visuais e remoção de elementos desnecessários foram feitos com base nesse critério.

---

## 5. Decisões Técnicas

**Por que medidas DAX e não colunas calculadas para os KPIs?**
Colunas calculadas são avaliadas uma vez, no carregamento — e ficam fixas. Medidas DAX são avaliadas a cada interação do usuário, respondendo ao contexto de filtro ativo. Para um dashboard gerencial onde o gestor filtra por período, região ou produto constantemente, medidas são a única escolha correta: garantem que Faturamento, Margem e Ticket Médio sempre reflitam exatamente o que está selecionado na tela.

**Por que consolidar as fontes no Power Query antes de modelar?**
A tentação em projetos com múltiplas fontes é importar tudo separado e tentar resolver as inconsistências no DAX. Isso cria medidas frágeis cheias de tratamentos condicionais — difíceis de manter e impossíveis de auditar. Consolidar e limpar no Power Query garante que o modelo receba dados já confiáveis, e que qualquer problema de qualidade de dados seja corrigido em um único lugar.

**Por que hierarquia visual e não "mostrar tudo"?**
Dashboards que exibem tudo igualmente exibem nada com efetividade. A decisão de posicionar Faturamento, Margem e Volume de Vendas no topo — em cartões grandes, com comparação ao período anterior — foi deliberada: são os três indicadores que qualquer gestor verifica primeiro ao abrir um relatório financeiro. Os demais KPIs ficam nas páginas de detalhe, acessíveis por navegação guiada.

**Por que navegação por páginas temáticas?**
Um único dashboard com todos os dados em uma página força o usuário a processar informação que não é relevante para a decisão do momento. Páginas temáticas — Visão Geral, Análise de Produtos, Tendência Temporal, Detalhes — permitem que o gestor entre no nível de profundidade que a situação exige, sem ruído visual.

**O que eu faria diferente hoje?**
Implementaria **bookmarks** para salvar estados de filtro frequentes — por exemplo, "visão do último trimestre por região Sul" — permitindo que o gestor acesse análises recorrentes com um clique. Também publicaria o dashboard no **Power BI Service** com alertas automáticos quando um KPI ultrapassar um threshold definido — transformando o dashboard de ferramenta de consulta em sistema de monitoramento ativo.

---

## 6. Insights do Desenvolvimento

Durante a construção do projeto, três aprendizados foram decisivos:

- **O maior inimigo da clareza gerencial é o excesso de informação bem apresentada.** A versão inicial do dashboard tinha mais visuais — e era mais confusa. Cada elemento removido aumentou a velocidade de leitura. O dashboard final tem menos gráficos que a primeira versão, e é significativamente mais útil.
- **UX em BI não é sobre deixar bonito — é sobre reduzir o tempo de decisão.** A escolha de usar cores semafóricas (verde/vermelho) para variações de KPI não foi estética: é uma linguagem universal de alerta que gestores reconhecem sem ler um número. Isso reduz o tempo de interpretação de segundos para milissegundos.
- **O fluxo de análise precisa ser projetado antes do primeiro visual.** Começar pelos visuais e depois tentar criar um fluxo narrativo produz dashboards tecnicamente corretos e analiticamente confusos. Mapear as perguntas de negócio primeiro — e só então criar os visuais que as respondem — foi a decisão que mais impactou a qualidade do resultado final.
- **Medidas DAX bem nomeadas são documentação.** Nomes como `Faturamento Total`, `Margem %` e `Ticket Médio` no painel de medidas tornam o modelo autoexplicativo para qualquer analista que abra o arquivo `.pbix` no futuro — sem precisar de documentação externa para entender o que cada cálculo representa.

---

## 7. Resultados

Com o dashboard gerencial implementado, o projeto entrega:

- ✅ **5 KPIs gerenciais** monitorados com comparação temporal: Faturamento, Margem, Volume de Vendas, Ticket Médio e variação período a período
- ✅ **4 páginas navegáveis** com fluxo de análise projetado — da visão consolidada ao detalhe operacional
- ✅ **ETL documentado** no Power Query consolidando fontes heterogêneas (Excel, CSV, SQL) em modelo único confiável
- ✅ **Layout orientado à UX de dados** com hierarquia visual, cores semafóricas e navegação intuitiva
- ✅ **Modelo analítico** com medidas DAX que respondem corretamente a qualquer combinação de filtros ativos

---

## 8. Próximos Passos

- [ ] Publicar no **Power BI Service** com atualização agendada e compartilhamento por link seguro
- [ ] Configurar **alertas de dados** para notificação automática quando KPIs críticos ultrapassarem thresholds definidos
- [ ] Implementar **bookmarks** para estados de filtro frequentes (ex: "último trimestre por região")
- [ ] Adicionar página de **análise de metas** — comparativo entre realizado e planejado por período
- [ ] Implementar **RLS (Row-Level Security)** para que cada gestor acesse apenas os dados da sua área

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Finalidade |
|---|---|
| Power BI Desktop | Modelagem, criação de medidas e design do dashboard |
| DAX | KPIs e medidas dinâmicas com contexto de filtro |
| Power Query (M) | ETL — consolidação, limpeza e transformação das fontes |
| SQL | Consulta e extração de dados relacionais |
| Excel / CSV | Fontes de dados financeiros e operacionais |
| Git + GitHub | Versionamento e documentação do projeto |

---

## 📊 KPIs do Dashboard

| Indicador | Descrição | Tipo de Visual |
|---|---|---|
| Faturamento Total | Receita bruta do período selecionado | Cartão com variação % |
| Margem | Margem em valor e percentual | Cartão + gráfico de barras |
| Volume de Vendas | Quantidade de unidades/transações | Cartão com comparativo |
| Ticket Médio | Receita média por transação | Cartão com evolução temporal |
| Análise Temporal | Tendência mês a mês e acumulada | Gráfico de linha |

---

## 🗂️ Estrutura do Repositório

```
dashboardGerencial/
├── models/
│   └── dashboard_gerencial_final.pbix    # Arquivo Power BI com modelo e dashboard
├── data/
│   ├── financeiro.xlsx                   # Fonte de dados financeiros
│   └── operacional.csv                   # Fonte de dados operacionais
├── docs/
│   ├── dax_measures.md                   # Medidas DAX documentadas
│   └── powerquery_steps.md               # Etapas de transformação no Power Query
├── img/
│   ├── Estrutura_Repositorio.png         # Estrutura do repositório
│   ├── Requisitos_Hardware_Software.png  # Requisitos do ambiente
│   └── dashboard_preview.png             # Preview do dashboard final
└── README.md
```

---

## ▶️ Como Executar o Projeto

**Pré-requisitos:** Power BI Desktop 2023 ou superior, Windows 10/11, Git

```bash
# Clone o repositório
git clone https://github.com/Santosdevbjj/dashboardGerencial
```

1. Abra o arquivo `models/dashboard_gerencial_final.pbix` no Power BI Desktop
2. Verifique as conexões com os arquivos da pasta `/data` — atualize os caminhos se necessário
3. Clique em **Atualizar** para recarregar os dados
4. Navegue pelas páginas usando os botões do menu visual do dashboard

**Sem Power BI Desktop?** Consulte a documentação em `/docs` e as imagens em `/img` para compreender o modelo, as medidas DAX e o layout do dashboard sem precisar abrir o `.pbix`.

---

## 📄 Licença

Este projeto está licenciado sob a **MIT License** — consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## Autor

**Sergio Santos**

[![Portfólio](https://img.shields.io/badge/Portfólio-Sérgio_Santos-111827?style=for-the-badge&logo=githubpages&logoColor=00eaff)](https://portfoliosantossergio.vercel.app)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Sérgio_Santos-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/santossergioluiz)
