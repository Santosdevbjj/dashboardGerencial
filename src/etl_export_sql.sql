-- ============================================
-- ETL: Extração, Transformação e Carga de Dados
-- Projeto: Dashboard Gerencial para Tomada de Decisões
-- Autor: Sérgio Santos
-- ============================================

-- 1️⃣ Criação das Tabelas Base
CREATE TABLE Produtos (
    ID_Produto VARCHAR(10) PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Categoria VARCHAR(50),
    PrecoCusto DECIMAL(10,2),
    PrecoVenda DECIMAL(10,2),
    Fornecedor VARCHAR(100)
);

CREATE TABLE Clientes (
    ID_Cliente VARCHAR(10) PRIMARY KEY,
    NomeCliente VARCHAR(100),
    Sexo CHAR(1),
    Idade INT,
    Cidade VARCHAR(100),
    Estado CHAR(2),
    Segmento VARCHAR(50)
);

CREATE TABLE Regioes (
    ID_Regiao VARCHAR(10) PRIMARY KEY,
    NomeRegiao VARCHAR(50),
    Estado CHAR(2),
    GerenteRegional VARCHAR(100)
);

CREATE TABLE FatoVendas (
    ID_Venda INT PRIMARY KEY,
    DataVenda DATE,
    ID_Produto VARCHAR(10) REFERENCES Produtos(ID_Produto),
    ID_Cliente VARCHAR(10) REFERENCES Clientes(ID_Cliente),
    ID_Regiao VARCHAR(10) REFERENCES Regioes(ID_Regiao),
    Quantidade INT,
    ValorUnitario DECIMAL(10,2),
    Desconto DECIMAL(4,2),
    ValorTotal DECIMAL(10,2),
    Lucro DECIMAL(10,2)
);

-- 2️⃣ Importação dos Dados (simulada via CSV)
-- Exemplo de importação usando BULK INSERT
BULK INSERT Produtos
FROM 'C:\\data\\products.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Clientes
FROM 'C:\\data\\customers.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT Regioes
FROM 'C:\\data\\regions.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

BULK INSERT FatoVendas
FROM 'C:\\data\\sales_data_sample.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');

-- 3️⃣ Criação de Visões de Apoio (Views)
CREATE VIEW vwResumoVendas AS
SELECT 
    r.NomeRegiao,
    p.Categoria,
    SUM(f.ValorTotal) AS TotalVendas,
    SUM(f.Lucro) AS TotalLucro,
    COUNT(DISTINCT f.ID_Cliente) AS TotalClientes
FROM FatoVendas f
JOIN Produtos p ON f.ID_Produto = p.ID_Produto
JOIN Regioes r ON f.ID_Regiao = r.ID_Regiao
GROUP BY r.NomeRegiao, p.Categoria;

-- 4️⃣ Exportação de Dados para Power BI
SELECT * FROM vwResumoVendas;
