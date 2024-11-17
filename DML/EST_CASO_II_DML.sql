CREATE DATABASE IF NOT EXISTS casodois;
USE casodois;

CREATE TABLE IF NOT EXISTS Passageiros (
    PassageiroID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(14),
    Endereco VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Voos (
    VooID INT AUTO_INCREMENT PRIMARY KEY,
    CodigoVoo VARCHAR(10) NOT NULL UNIQUE,
    Origem VARCHAR(100) NOT NULL,
    Destino VARCHAR(100) NOT NULL,
    HorarioPartida DATETIME NOT NULL,
    HorarioChegada DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS Aeroportos (
    AeroportoID INT AUTO_INCREMENT PRIMARY KEY,
    CodigoAeroporto VARCHAR(10) NOT NULL UNIQUE,
    Nome VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(100) NOT NULL,
    Pais VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Aeronaves (
    AeronaveID INT AUTO_INCREMENT PRIMARY KEY,
    Identificador VARCHAR(50) NOT NULL UNIQUE,
    Modelo VARCHAR(100) NOT NULL,
    Capacidade INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Funcionarios (
    FuncionarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Identificador VARCHAR(50) NOT NULL UNIQUE,
    Funcao VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Reservas (
    ReservaID INT AUTO_INCREMENT PRIMARY KEY,
    PassageiroID INT,
    VooID INT,
    DataReserva DATETIME NOT NULL,
    FOREIGN KEY (PassageiroID) REFERENCES Passageiros(PassageiroID),
    FOREIGN KEY (VooID) REFERENCES Voos(VooID)
);

CREATE TABLE IF NOT EXISTS OperacoesVoo (
    OperacaoID INT AUTO_INCREMENT PRIMARY KEY,
    VooID INT,
    FuncionarioID INT,
    FOREIGN KEY (VooID) REFERENCES Voos(VooID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
);

-- Inserção de dados para a tabela Passageiros
INSERT INTO Passageiros (Nome, CPF, Telefone, Endereco) VALUES
('João Silva', '12345678901', '11987654321', 'Rua A, 123'),
('Maria Oliveira', '23456789012', '11876543210', 'Av. B, 456'),
('Carlos Pereira', '34567890123', '11765432109', 'Praça C, 789'),
('Ana Santos', '45678901234', '11654321098', 'Rua D, 101'),
('Fernanda Costa', '56789012345', '11543210987', 'Av. E, 202');

-- Inserção de dados para a tabela Voos
INSERT INTO Voos (CodigoVoo, Origem, Destino, HorarioPartida, HorarioChegada) VALUES
('V001', 'São Paulo', 'Rio de Janeiro', '2024-11-20 08:00:00', '2024-11-20 10:00:00'),
('V002', 'São Paulo', 'Salvador', '2024-11-20 12:00:00', '2024-11-20 14:00:00'),
('V003', 'Rio de Janeiro', 'São Paulo', '2024-11-21 09:00:00', '2024-11-21 11:00:00'),
('V004', 'Salvador', 'São Paulo', '2024-11-21 15:00:00', '2024-11-21 17:00:00'),
('V005', 'São Paulo', 'Fortaleza', '2024-11-22 07:00:00', '2024-11-22 09:00:00');

-- Inserção de dados para a tabela Aeroportos
INSERT INTO Aeroportos (CodigoAeroporto, Nome, Cidade, Estado, Pais) VALUES
('GRU', 'Aeroporto Internacional de São Paulo', 'São Paulo', 'SP', 'Brasil'),
('SDU', 'Aeroporto Santos Dumont', 'Rio de Janeiro', 'RJ', 'Brasil'),
('SSA', 'Aeroporto Internacional de Salvador', 'Salvador', 'BA', 'Brasil'),
('FOR', 'Aeroporto Internacional de Fortaleza', 'Fortaleza', 'CE', 'Brasil'),
('GIG', 'Aeroporto Internacional do Galeão', 'Rio de Janeiro', 'RJ', 'Brasil');

-- Inserção de dados para a tabela Aeronaves
INSERT INTO Aeronaves (Identificador, Modelo, Capacidade) VALUES
('A320-001', 'Airbus A320', 180),
('B737-800', 'Boeing 737-800', 190),
('A321-200', 'Airbus A321', 210),
('B787-9', 'Boeing 787-9', 250),
('A350-900', 'Airbus A350-900', 300);

-- Inserção de dados para a tabela Funcionarios
INSERT INTO Funcionarios (Nome, Identificador, Funcao) VALUES
('Roberto Souza', 'F001', 'Piloto'),
('Fernanda Lima', 'F002', 'Comissária de bordo'),
('Carlos Martins', 'F003', 'Piloto'),
('Juliana Costa', 'F004', 'Comissária de bordo'),
('Eduardo Pereira', 'F005', 'Piloto');

-- Inserção de dados para a tabela Reservas
INSERT INTO Reservas (PassageiroID, VooID, DataReserva) VALUES
(1, 1, '2024-11-19 10:00:00'),
(2, 2, '2024-11-19 12:30:00'),
(3, 3, '2024-11-20 09:15:00'),
(4, 4, '2024-11-20 15:30:00'),
(5, 5, '2024-11-21 06:45:00');

-- Inserção de dados para a tabela OperacoesVoo
INSERT INTO OperacoesVoo (VooID, FuncionarioID) VALUES
(1, 1),
(2, 3),
(3, 1),
(4, 2),
(5, 5);

-- Atualização de dados para a tabela Passageiros
UPDATE Passageiros
SET Telefone = '11999999999', Endereco = 'Rua A, 321'
WHERE PassageiroID = 1;

UPDATE Passageiros
SET Nome = 'Maria Oliveira Atualizada', Telefone = '11888888888'
WHERE PassageiroID = 2;

-- Atualização de dados para a tabela Voos
UPDATE Voos
SET HorarioPartida = '2024-11-20 08:30:00', HorarioChegada = '2024-11-20 10:30:00'
WHERE VooID = 1;

UPDATE Voos
SET Destino = 'Florianópolis', HorarioPartida = '2024-11-21 14:00:00'
WHERE CodigoVoo = 'V003';

-- Atualização de dados para a tabela Aeroportos
UPDATE Aeroportos
SET Cidade = 'São Paulo', Estado = 'SP', Pais = 'Brasil'
WHERE CodigoAeroporto = 'GRU';

UPDATE Aeroportos
SET Nome = 'Aeroporto Internacional de Salvador', Cidade = 'Salvador', Estado = 'BA'
WHERE CodigoAeroporto = 'SSA';

-- Atualização de dados para a tabela Aeronaves
UPDATE Aeronaves
SET Capacidade = 200
WHERE Identificador = 'A320-001';

UPDATE Aeronaves
SET Modelo = 'Boeing 787-8', Capacidade = 220
WHERE Identificador = 'B737-800';

-- Atualização de dados para a tabela Funcionarios
UPDATE Funcionarios
SET Funcao = 'Co-piloto'
WHERE FuncionarioID = 1;

UPDATE Funcionarios
SET Funcao = 'Chefe de cabine'
WHERE FuncionarioID = 2;

-- Atualização de dados para a tabela Reservas
UPDATE Reservas
SET DataReserva = '2024-11-19 14:00:00'
WHERE ReservaID = 1;

UPDATE Reservas
SET DataReserva = '2024-11-20 16:00:00'
WHERE ReservaID = 3;

-- Atualização de dados para a tabela OperacoesVoo
UPDATE OperacoesVoo
SET FuncionarioID = 2
WHERE VooID = 1 AND FuncionarioID = 1;

UPDATE OperacoesVoo
SET FuncionarioID = 4
WHERE VooID = 3 AND FuncionarioID = 1;

-- Exclusão de dados para a tabela Passageiros
DELETE FROM Passageiros WHERE PassageiroID = 5;

-- Exclusão de dados para a tabela Voos
DELETE FROM Voos WHERE VooID = 5;

-- Exclusão de dados para a tabela Aeroportos
DELETE FROM Aeroportos WHERE CodigoAeroporto = 'GIG';

-- Exclusão de dados para a tabela Aeronaves
DELETE FROM Aeronaves WHERE Identificador = 'B737-800';

-- Exclusão de dados para a tabela Funcionarios
DELETE FROM Funcionarios WHERE FuncionarioID = 5;

-- Exclusão de dados para a tabela Reservas
DELETE FROM Reservas WHERE ReservaID = 5;

-- Exclusão de dados para a tabela OperacoesVoo
DELETE FROM OperacoesVoo WHERE OperacaoID = 5;
