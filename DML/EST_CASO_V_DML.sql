CREATE DATABASE Casocinco;

USE Casocinco;

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    DataNascimento DATE,
    Endereco VARCHAR(255),
    StatusFidelidade VARCHAR(50)
);

CREATE TABLE Fornecedores (
    FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Contato VARCHAR(100),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    Preco DECIMAL(10, 2),
    QuantidadeEstoque INT,
    FornecedorID INT,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);

CREATE TABLE Vendas (
    VendaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataVenda DATE,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    VendaID INT,
    DataPagamento DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (VendaID) REFERENCES Vendas(VendaID)
);

CREATE TABLE ProdutosVendas (
    ProdutoVendaID INT AUTO_INCREMENT PRIMARY KEY,
    VendaID INT,
    ProdutoID INT,
    Quantidade INT,
    FOREIGN KEY (VendaID) REFERENCES Vendas(VendaID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserção de dados para a tabela Fornecedores (não depende de outras tabelas)
INSERT INTO Fornecedores (Nome, Contato, Telefone, Email) VALUES
('Fornecedor A', 'João Silva', '1112345678', 'joao@fornecedora.com'),
('Fornecedor B', 'Maria Oliveira', '1123456789', 'maria@fornecedora.com'),
('Fornecedor C', 'Carlos Santos', '1134567890', 'carlos@fornecedora.com'),
('Fornecedor D', 'Fernanda Costa', '1145678901', 'fernanda@fornecedora.com'),
('Fornecedor E', 'Lucas Pereira', '1156789012', 'lucas@fornecedora.com');

-- Inserção de dados para a tabela Clientes
INSERT INTO Clientes (Nome, CPF, DataNascimento, Endereco, StatusFidelidade) VALUES
('João Souza', '12345678901', '1985-07-22', 'Rua das Palmeiras, 200', 'Bronze'),
('Maria Lima', '23456789012', '1990-02-15', 'Av. Central, 1050', 'Ouro'),
('Carlos Alves', '34567890123', '1982-11-03', 'Rua A, 50', 'Prata'),
('Fernanda Costa', '45678901234', '1995-06-30', 'Rua B, 35', 'Prata'),
('Lucas Pereira', '56789012345', '1998-09-10', 'Av. Rio, 403', 'Ouro');

-- Inserção de dados para a tabela Produtos
INSERT INTO Produtos (Nome, Categoria, Preco, QuantidadeEstoque, FornecedorID) VALUES
('Produto X', 'Categoria 1', 100.00, 50, 1),
('Produto Y', 'Categoria 2', 150.00, 30, 2),
('Produto Z', 'Categoria 1', 120.00, 20, 3),
('Produto W', 'Categoria 3', 80.00, 40, 4),
('Produto V', 'Categoria 2', 200.00, 10, 5);

-- Inserção de dados para a tabela Vendas
INSERT INTO Vendas (ClienteID, DataVenda, ValorTotal) VALUES
(1, '2024-01-10', 450.00),
(2, '2024-01-12', 600.00),
(3, '2024-01-15', 350.00),
(4, '2024-01-18', 250.00),
(5, '2024-01-20', 400.00);

-- Inserção de dados para a tabela Pagamentos
INSERT INTO Pagamentos (VendaID, DataPagamento, Valor, Status) VALUES
(1, '2024-01-11', 450.00, 'Pago'),
(2, '2024-01-13', 600.00, 'Pendente'),
(3, '2024-01-16', 350.00, 'Pago'),
(4, '2024-01-19', 250.00, 'Pago'),
(5, '2024-01-21', 400.00, 'Pendente');

-- Inserção de dados para a tabela ProdutosVendas
INSERT INTO ProdutosVendas (VendaID, ProdutoID, Quantidade) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 3, 4),
(3, 4, 5),
(4, 5, 2);

-- Atualização de dados para a tabela Clientes
UPDATE Clientes
SET StatusFidelidade = 'Diamante'
WHERE ClienteID = 2;

UPDATE Clientes
SET Endereco = 'Rua das Flores, 123'
WHERE ClienteID = 5;

-- Atualização de dados para a tabela Fornecedores
UPDATE Fornecedores
SET Email = 'contato@fornecedoraA.com'
WHERE FornecedorID = 1;

UPDATE Fornecedores
SET Telefone = '11987654321'
WHERE FornecedorID = 4;

-- Atualização de dados para a tabela Produtos
UPDATE Produtos
SET Preco = 110.00
WHERE ProdutoID = 1;

UPDATE Produtos
SET QuantidadeEstoque = 15
WHERE ProdutoID = 2;

-- Atualização de dados para a tabela Vendas
UPDATE Vendas
SET ValorTotal = 500.00
WHERE VendaID = 3;

UPDATE Vendas
SET DataVenda = '2024-01-17'
WHERE VendaID = 4;

-- Atualização de dados para a tabela Pagamentos
UPDATE Pagamentos
SET Status = 'Pago'
WHERE PagamentoID = 2;

UPDATE Pagamentos
SET Valor = 350.00
WHERE PagamentoID = 5;

-- Atualização de dados para a tabela ProdutosVendas
UPDATE ProdutosVendas
SET Quantidade = 4
WHERE ProdutoVendaID = 1;

UPDATE ProdutosVendas
SET Quantidade = 6
WHERE ProdutoVendaID = 4;

-- Exclusão de dados para a tabela Clientes
DELETE FROM Clientes WHERE ClienteID = 3;

-- Exclusão de dados para a tabela Fornecedores
DELETE FROM Fornecedores WHERE FornecedorID = 5;

-- Exclusão de dados para a tabela Produtos
DELETE FROM Produtos WHERE ProdutoID = 4;

-- Exclusão de dados para a tabela Vendas
DELETE FROM Vendas WHERE VendaID = 2;

-- Exclusão de dados para a tabela Pagamentos
DELETE FROM Pagamentos WHERE PagamentoID = 3;

-- Exclusão de dados para a tabela ProdutosVendas
DELETE FROM ProdutosVendas WHERE ProdutoVendaID = 2;

