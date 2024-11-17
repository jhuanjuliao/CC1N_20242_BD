CREATE DATABASE Casotres;

USE Casotres;

CREATE TABLE Clientes (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL UNIQUE,
    RazaoSocial VARCHAR(100) NOT NULL,
    RamoAtividade VARCHAR(100),
    DataCadastramento DATE,
    Telefones VARCHAR(255),
    Enderecos VARCHAR(255),
    PessoaContato VARCHAR(100)
);

CREATE TABLE Empregados (
    Matricula INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefones VARCHAR(255),
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
    DataAdmissao DATE,
    Qualificacoes VARCHAR(255),
    Endereco VARCHAR(255)
);

CREATE TABLE Empresas (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Telefones VARCHAR(255),
    PessoaContato VARCHAR(100),
    Endereco VARCHAR(255)
);

CREATE TABLE Fornecedores (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefones VARCHAR(255),
    PessoaContato VARCHAR(100)
);

CREATE TABLE TipoEndereco (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Enderecos (
    Numero INT,
    Logradouro VARCHAR(100),
    Complemento VARCHAR(100),
    CEP VARCHAR(8),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(50),
    TipoEnderecoID INT,
    FOREIGN KEY (TipoEnderecoID) REFERENCES TipoEndereco(Codigo)
);

CREATE TABLE Encomendas (
    Numero INT AUTO_INCREMENT PRIMARY KEY,
    DataInclusao DATE,
    ValorTotal DECIMAL(10, 2),
    ValorDesconto DECIMAL(10, 2),
    ValorLiquido DECIMAL(10, 2),
    IDFormaPagamento INT,
    QuantidadeParcelas INT,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(Codigo)
);

CREATE TABLE Produtos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cor VARCHAR(50),
    Dimensoes VARCHAR(50),
    Peso DECIMAL(10, 2),
    Preco DECIMAL(10, 2),
    TempoFabricacao INT,
    DesenhoProduto VARCHAR(255),
    HorasMaoDeObra INT
);

CREATE TABLE TiposComponente (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Componentes (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    QuantidadeEstoque INT,
    PrecoUnitario DECIMAL(10, 2),
    Unidade VARCHAR(50),
    FornecedorID VARCHAR(14),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(CNPJ)
);

CREATE TABLE Maquinas (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    TempoVida INT,
    DataCompra DATE,
    DataFimGarantia DATE
);

CREATE TABLE RecursosEspecificos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    QuantidadeNecessaria INT,
    Unidade VARCHAR(50),
    TempoUso INT,
    HorasMaoDeObra INT
);

CREATE TABLE RegistroManutencao (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE,
    Descricao VARCHAR(255),
    MaquinaID INT,
    FOREIGN KEY (MaquinaID) REFERENCES Maquinas(Codigo)
);

CREATE TABLE RegistroSuprimentos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Quantidade INT,
    DataNecessidade DATE,
    ComponenteID INT,
    FOREIGN KEY (ComponenteID) REFERENCES Componentes(Codigo)
);

-- Inserção de dados para a tabela TipoEndereco (não depende de outras)
INSERT INTO TipoEndereco (Nome) VALUES
('Residencial'),
('Comercial'),
('Industrial'),
('Rural'),
('Logístico');

-- Inserção de dados para a tabela Clientes
INSERT INTO Clientes (CNPJ, RazaoSocial, RamoAtividade, DataCadastramento, Telefones, Enderecos, PessoaContato) VALUES
('12345678000190', 'Cliente A Ltda.', 'Tecnologia', '2024-01-15', '11987654321, 11345678901', 'Rua A, 100, Centro', 'Carlos Pereira'),
('23456789000198', 'Cliente B Ltda.', 'Consultoria', '2024-02-20', '11876543210', 'Av. B, 200, Sala 303', 'Maria Oliveira'),
('34567890123456', 'Cliente C S.A.', 'Indústria', '2024-03-10', '11765432109', 'Rua C, 300, Bairro Industrial', 'José Santos'),
('45678901234567', 'Cliente D S.A.', 'Comércio', '2024-04-05', '11654321098', 'Rua D, 400, Galpão 2', 'Ana Souza'),
('56789012345678', 'Cliente E Ltda.', 'Logística', '2024-05-12', '11543210987', 'Av. E, 500, Galpão 3', 'Lucas Costa');

-- Inserção de dados para a tabela Empregados
INSERT INTO Empregados (Nome, Telefones, Cargo, Salario, DataAdmissao, Qualificacoes, Endereco) VALUES
('Roberto Souza', '11999999999', 'Gerente de Vendas', 5000.00, '2020-01-01', 'MBA em Vendas', 'Rua A, 123, São Paulo'),
('Fernanda Lima', '11888888888', 'Assistente Administrativo', 3000.00, '2021-02-15', 'Gestão de Empresas', 'Av. B, 456, São Paulo'),
('Carlos Martins', '11777777777', 'Coordenador de Marketing', 6000.00, '2019-03-10', 'Marketing Digital', 'Rua C, 789, Rio de Janeiro'),
('Juliana Costa', '11666666666', 'Analista Financeiro', 4000.00, '2022-04-18', 'Economia e Finanças', 'Av. D, 1010, Belo Horizonte'),
('Eduardo Pereira', '11555555555', 'Diretor de TI', 12000.00, '2018-05-22', 'TI e Sistemas', 'Rua E, 2020, Curitiba');

-- Inserção de dados para a tabela Empresas
INSERT INTO Empresas (CNPJ, RazaoSocial, Telefones, PessoaContato, Endereco) VALUES
('67890123456789', 'Empresa A Ltda.', '11988887766', 'Fernanda Lima', 'Rua X, 50, São Paulo'),
('78901234567890', 'Empresa B S.A.', '11877776655', 'Carlos Martins', 'Av. Y, 100, Rio de Janeiro'),
('89012345678901', 'Empresa C Ltda.', '11766665544', 'Juliana Costa', 'Rua Z, 150, Belo Horizonte'),
('90123456789012', 'Empresa D S.A.', '11655554433', 'Eduardo Pereira', 'Av. W, 200, Curitiba'),
('01234567890123', 'Empresa E Ltda.', '11544443322', 'Roberto Souza', 'Rua V, 250, Porto Alegre');

-- Inserção de dados para a tabela Fornecedores
INSERT INTO Fornecedores (CNPJ, RazaoSocial, Endereco, Telefones, PessoaContato) VALUES
('11223344556677', 'Fornecedor A Ltda.', 'Rua A, 123, São Paulo', '1133445566', 'Carlos Pereira'),
('22334455667788', 'Fornecedor B S.A.', 'Av. B, 456, Rio de Janeiro', '1144556677', 'Maria Oliveira'),
('33445566778899', 'Fornecedor C Ltda.', 'Rua C, 789, Belo Horizonte', '1155667788', 'José Santos'),
('44556677889900', 'Fornecedor D S.A.', 'Rua D, 101, Curitiba', '1166778899', 'Ana Souza'),
('55667788990011', 'Fornecedor E Ltda.', 'Av. E, 202, Porto Alegre', '1177889900', 'Lucas Costa');

-- Inserção de dados para a tabela Enderecos
INSERT INTO Enderecos (Numero, Logradouro, Complemento, CEP, Bairro, Cidade, Estado, TipoEnderecoID) VALUES
(100, 'Rua A', 'Centro', '01010000', 'Centro', 'São Paulo', 'SP', 1),
(200, 'Av. B', 'Sala 303', '02020000', 'Bairro B', 'Rio de Janeiro', 'RJ', 2),
(300, 'Rua C', 'Bairro Industrial', '03030000', 'Bairro C', 'Belo Horizonte', 'MG', 3),
(400, 'Rua D', 'Galpão 2', '04040000', 'Bairro D', 'Curitiba', 'PR', 4),
(500, 'Av. E', 'Galpão 3', '05050000', 'Bairro E', 'Porto Alegre', 'RS', 5);

-- Inserção de dados para a tabela Encomendas
INSERT INTO Encomendas (DataInclusao, ValorTotal, ValorDesconto, ValorLiquido, IDFormaPagamento, QuantidadeParcelas, ClienteID) VALUES
('2024-05-01', 1000.00, 100.00, 900.00, 1, 10, 1),
('2024-05-10', 1500.00, 150.00, 1350.00, 2, 5, 2),
('2024-05-15', 2000.00, 200.00, 1800.00, 3, 12, 3),
('2024-05-20', 5000.00, 500.00, 4500.00, 1, 6, 4),
('2024-05-25', 3000.00, 300.00, 2700.00, 2, 8, 5);

-- Inserção de dados para a tabela Produtos
INSERT INTO Produtos (Nome, Cor, Dimensoes, Peso, Preco, TempoFabricacao, DesenhoProduto, HorasMaoDeObra) VALUES
('Produto A', 'Vermelho', '20x10x5', 0.5, 100.00, 5, 'Desenho A', 2),
('Produto B', 'Azul', '25x15x7', 1.0, 200.00, 7, 'Desenho B', 3),
('Produto C', 'Verde', '30x20x10', 1.5, 300.00, 10, 'Desenho C', 4),
('Produto D', 'Amarelo', '35x25x15', 2.0, 400.00, 12, 'Desenho D', 5),
('Produto E', 'Preto', '40x30x20', 2.5, 500.00, 15, 'Desenho E', 6);

-- Inserção de dados para a tabela TiposComponente
INSERT INTO TiposComponente (Nome) VALUES
('Eletrônico'),
('Mecânico'),
('Hidráulico'),
('Pneumático'),
('Estrutural');

-- Inserção de dados para a tabela Componentes
INSERT INTO Componentes (Nome, QuantidadeEstoque, PrecoUnitario, Unidade, FornecedorID) VALUES
('Componente A', 100, 10.00, 'Unidade', '11223344556677'),
('Componente B', 200, 15.00, 'Unidade', '22334455667788'),
('Componente C', 150, 20.00, 'Unidade', '33445566778899'),
('Componente D', 50, 25.00, 'Unidade', '44556677889900'),
('Componente E', 30, 30.00, 'Unidade', '55667788990011');

-- Inserção de dados para a tabela Maquinas
INSERT INTO Maquinas (TempoVida, DataCompra, DataFimGarantia) VALUES
(10, '2020-01-01', '2025-01-01'),
(12, '2021-06-15', '2026-06-15'),
(8, '2019-03-10', '2024-03-10'),
(15, '2018-07-20', '2023-07-20'),
(5, '2022-11-10', '2027-11-10');

-- Inserção de dados para a tabela RecursosEspecificos
INSERT INTO RecursosEspecificos (QuantidadeNecessaria, Unidade, TempoUso, HorasMaoDeObra) VALUES
(100, 'Unidade', 5, 2),
(200, 'Unidade', 7, 3),
(300, 'Unidade', 10, 4),
(400, 'Unidade', 12, 5),
(500, 'Unidade', 15, 6);

-- Inserção de dados para a tabela RegistroManutencao
INSERT INTO RegistroManutencao (Data, Descricao, MaquinaID) VALUES
('2024-01-01', 'Troca de peças', 1),
('2024-02-15', 'Calibração do sistema', 2),
('2024-03-10', 'Substituição de peças', 3),
('2024-04-18', 'Ajuste de pressão', 4),
('2024-05-22', 'Revisão geral', 5);

-- Inserção de dados para a tabela RegistroSuprimentos
INSERT INTO RegistroSuprimentos (Quantidade, DataNecessidade, ComponenteID) VALUES
(50, '2024-06-01', 1),
(30, '2024-07-15', 2),
(20, '2024-08-10', 3),
(10, '2024-09-05', 4),
(5, '2024-10-22', 5);

-- Atualização de dados para a tabela Clientes
UPDATE Clientes
SET Telefones = '11999999999, 1133445566', PessoaContato = 'Roberto Souza'
WHERE Codigo = 1;

UPDATE Clientes
SET RamoAtividade = 'Varejo', Enderecos = 'Av. Central, 50, Loja 10'
WHERE Codigo = 2;

-- Atualização de dados para a tabela Empregados
UPDATE Empregados
SET Cargo = 'Gerente de TI', Salario = 7000.00
WHERE Matricula = 1;

UPDATE Empregados
SET Nome = 'Fernanda Lima Alves', Endereco = 'Rua B, 600, São Paulo'
WHERE Matricula = 2;

-- Atualização de dados para a tabela Empresas
UPDATE Empresas
SET PessoaContato = 'Carlos Eduardo', Endereco = 'Rua M, 123, São Paulo'
WHERE CNPJ = '67890123456789';

UPDATE Empresas
SET Telefones = '11933334444', RazaoSocial = 'Empresa A S.A.'
WHERE CNPJ = '78901234567890';

-- Atualização de dados para a tabela Fornecedores
UPDATE Fornecedores
SET PessoaContato = 'Maria Clara', Endereco = 'Av. D, 500, São Paulo'
WHERE CNPJ = '11223344556677';

UPDATE Fornecedores
SET RazaoSocial = 'Fornecedor Z S.A.', Telefones = '1133994455'
WHERE CNPJ = '22334455667788';

-- Atualização de dados para a tabela Enderecos
UPDATE Enderecos
SET Bairro = 'Jardim Paulista', Cidade = 'São Paulo'
WHERE Numero = 100;

UPDATE Enderecos
SET Complemento = 'Sala 404', Estado = 'RJ'
WHERE Numero = 200;

-- Atualização de dados para a tabela Encomendas
UPDATE Encomendas
SET QuantidadeParcelas = 12, ValorLiquido = 950.00
WHERE Numero = 1;

UPDATE Encomendas
SET ValorDesconto = 250.00, ValorLiquido = 1750.00
WHERE Numero = 3;

-- Atualização de dados para a tabela Produtos
UPDATE Produtos
SET Preco = 120.00, TempoFabricacao = 6
WHERE Codigo = 1;

UPDATE Produtos
SET Cor = 'Branco', DesenhoProduto = 'Desenho F'
WHERE Codigo = 2;

-- Atualização de dados para a tabela TiposComponente
UPDATE TiposComponente
SET Nome = 'Eletrônico Avançado'
WHERE Codigo = 1;

UPDATE TiposComponente
SET Nome = 'Mecânico Industrial'
WHERE Codigo = 2;

-- Atualização de dados para a tabela Componentes
UPDATE Componentes
SET QuantidadeEstoque = 120, PrecoUnitario = 12.00
WHERE Codigo = 1;

UPDATE Componentes
SET FornecedorID = '33445566778899', PrecoUnitario = 18.00
WHERE Codigo = 2;

-- Atualização de dados para a tabela Maquinas
UPDATE Maquinas
SET TempoVida = 12, DataCompra = '2020-05-01'
WHERE Codigo = 1;

UPDATE Maquinas
SET DataFimGarantia = '2027-06-15'
WHERE Codigo = 2;

-- Atualização de dados para a tabela RecursosEspecificos
UPDATE RecursosEspecificos
SET QuantidadeNecessaria = 150, TempoUso = 8
WHERE Codigo = 1;

UPDATE RecursosEspecificos
SET HorasMaoDeObra = 7, TempoUso = 13
WHERE Codigo = 2;

-- Atualização de dados para a tabela RegistroManutencao
UPDATE RegistroManutencao
SET Descricao = 'Troca de óleo', Data = '2024-06-15'
WHERE Codigo = 1;

UPDATE RegistroManutencao
SET Descricao = 'Ajuste de sistema', Data = '2024-07-20'
WHERE Codigo = 2;

-- Atualização de dados para a tabela RegistroSuprimentos
UPDATE RegistroSuprimentos
SET Quantidade = 70
WHERE Codigo = 1;

UPDATE RegistroSuprimentos
SET DataNecessidade = '2024-11-01'
WHERE Codigo = 3;

-- Exclusão de dados para a tabela Clientes
DELETE FROM Clientes WHERE Codigo = 5;

-- Exclusão de dados para a tabela Empregados
DELETE FROM Empregados WHERE Matricula = 4;

-- Exclusão de dados para a tabela Empresas
DELETE FROM Empresas WHERE CNPJ = '89012345678901';

-- Exclusão de dados para a tabela Fornecedores
DELETE FROM Fornecedores WHERE CNPJ = '44556677889900';

-- Exclusão de dados para a tabela Enderecos
DELETE FROM Enderecos WHERE Numero = 400;

-- Exclusão de dados para a tabela Encomendas
DELETE FROM Encomendas WHERE Numero = 5;

-- Exclusão de dados para a tabela Produtos
DELETE FROM Produtos WHERE Codigo = 4;

-- Exclusão de dados para a tabela TiposComponente
DELETE FROM TiposComponente WHERE Codigo = 5;

-- Exclusão de dados para a tabela Componentes
DELETE FROM Componentes WHERE Codigo = 3;

-- Exclusão de dados para a tabela Maquinas
DELETE FROM Maquinas WHERE Codigo = 5;

-- Exclusão de dados para a tabela RecursosEspecificos
DELETE FROM RecursosEspecificos WHERE Codigo = 4;

-- Exclusão de dados para a tabela RegistroManutencao
DELETE FROM RegistroManutencao WHERE Codigo = 3;

-- Exclusão de dados para a tabela RegistroSuprimentos
DELETE FROM RegistroSuprimentos WHERE Codigo = 5;
