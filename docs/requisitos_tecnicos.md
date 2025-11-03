# ⚙️ Requisitos Técnicos

## 💻 Hardware Recomendado

| Recurso | Requisito Mínimo | Recomendado |
|----------|------------------|-------------|
| CPU | Intel i5 | Intel i7 ou AMD Ryzen 5+ |
| RAM | 8 GB | 16 GB |
| Armazenamento | 2 GB livres | SSD com 10 GB livres |
| Tela | 1366x768 | 1920x1080 ou superior |

---

## 🧰 Software Necessário

| Componente | Versão Recomendada | Finalidade |
|-------------|--------------------|-------------|
| Power BI Desktop | 2.129+ | Construção e edição dos relatórios |
| Power BI Service | Última versão | Visualização online |
| Microsoft Excel | 2019+ | Simulação de dashboards |
| Power Query / DAX | Integrado | Transformações e medidas |
| SQL Server (opcional) | 2019+ | Fonte de dados alternativa |

---

## ☁️ Alternativas Gratuitas (sem Power BI instalado)

- **Power BI Report Builder**
- **Google Sheets + Data Studio**
- **LibreOffice Calc + Charts**
- **Power BI Service (online gratuito)**

---

## 🔗 Integrações e Extensões

- **GitHub** – Controle de versão e histórico de alterações  
- **Visual Studio Code** – Edição de scripts e documentação  
- **Excel Power Query Add-in** – Modelagem local

---

## 🔐 Requisitos de Acesso

- Conta Microsoft gratuita para usar o Power BI Service  
- Permissões de leitura no repositório GitHub `Santosdevbjj/dashboardGerencial`

---

## 🧩 Estrutura Recomendada de Desenvolvimento

1. Criar diretório local para os dados (`/data`)
2. Baixar o modelo base (`/models/Exemplo.pbix`)
3. Reproduzir as medidas e visuais
4. Validar consistência das métricas com a pasta `/tests`
