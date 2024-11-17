CREATE DATABASE Casoquatro;

USE Casoquatro;

CREATE TABLE Alunos (
    AlunoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    DataNascimento DATE,
    Endereco VARCHAR(255),
    Modalidades VARCHAR(255)
);

CREATE TABLE Instrutores (
    InstrutorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Modalidades VARCHAR(255),
    Alunos VARCHAR(255)
);

CREATE TABLE Modalidades (
    ModalidadeID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255)
);

CREATE TABLE PlanosTreinamento (
    PlanoID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT,
    InstrutorID INT,
    Descricao VARCHAR(255),
    DataInicio DATE,
    DataFim DATE,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID),
    FOREIGN KEY (InstrutorID) REFERENCES Instrutores(InstrutorID)
);

CREATE TABLE Aulas (
    AulaID INT AUTO_INCREMENT PRIMARY KEY,
    ModalidadeID INT,
    InstrutorID INT,
    Horario TIME,
    Capacidade INT,
    FOREIGN KEY (ModalidadeID) REFERENCES Modalidades(ModalidadeID),
    FOREIGN KEY (InstrutorID) REFERENCES Instrutores(InstrutorID)
);

CREATE TABLE Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT,
    DataPagamento DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID)
);

-- Inserção de dados para a tabela Modalidades
INSERT INTO Modalidades (Nome, Descricao) VALUES
('Musculação', 'Treinamento físico para aumentar a massa muscular'),
('Yoga', 'Exercícios físicos e mentais para flexibilidade e equilíbrio'),
('Pilates', 'Método de exercícios para fortalecimento e alongamento'),
('Cardio', 'Exercícios aeróbicos para aumentar resistência física'),
('Crossfit', 'Treinamento intenso que combina força e resistência');

-- Inserção de dados para a tabela Alunos
INSERT INTO Alunos (Nome, CPF, DataNascimento, Endereco, Modalidades) VALUES
('João Silva', '12345678901', '1990-05-15', 'Rua das Flores, 123', 'Musculação, Cardio'),
('Maria Oliveira', '23456789012', '1985-08-22', 'Av. Brasil, 456', 'Yoga, Pilates'),
('Carlos Santos', '34567890123', '2000-03-30', 'Rua A, 789', 'Crossfit, Cardio'),
('Fernanda Costa', '45678901234', '1998-12-11', 'Rua B, 101', 'Pilates, Musculação'),
('Lucas Pereira', '56789012345', '1995-07-19', 'Av. Central, 202', 'Yoga, Crossfit');

-- Inserção de dados para a tabela Instrutores
INSERT INTO Instrutores (Nome, Modalidades, Alunos) VALUES
('Ricardo Almeida', 'Musculação, Cardio', 'João Silva, Carlos Santos'),
('Mariana Souza', 'Yoga, Pilates', 'Maria Oliveira, Fernanda Costa'),
('Eduardo Martins', 'Crossfit', 'Carlos Santos, Lucas Pereira'),
('Luciana Silva', 'Musculação', 'Fernanda Costa'),
('Fábio Pereira', 'Cardio', 'João Silva, Carlos Santos');

-- Inserção de dados para a tabela PlanosTreinamento
INSERT INTO PlanosTreinamento (AlunoID, InstrutorID, Descricao, DataInicio, DataFim) VALUES
(1, 1, 'Plano de musculação e cardio para emagrecimento', '2024-01-10', '2024-03-10'),
(2, 2, 'Plano de yoga e pilates para flexibilidade', '2024-02-05', '2024-04-05'),
(3, 3, 'Plano de crossfit para ganho de resistência', '2024-01-15', '2024-03-15'),
(4, 1, 'Plano de musculação para fortalecimento', '2024-01-20', '2024-03-20'),
(5, 4, 'Plano de cardio para resistência', '2024-02-01', '2024-04-01');

-- Inserção de dados para a tabela Aulas
INSERT INTO Aulas (ModalidadeID, InstrutorID, Horario, Capacidade) VALUES
(1, 1, '08:00', 20),
(2, 2, '09:00', 15),
(3, 3, '10:00', 25),
(4, 4, '11:00', 20),
(5, 5, '12:00', 30);

-- Inserção de dados para a tabela Pagamentos
INSERT INTO Pagamentos (AlunoID, DataPagamento, Valor, Status) VALUES
(1, '2024-01-15', 250.00, 'Pago'),
(2, '2024-02-10', 200.00, 'Pago'),
(3, '2024-01-20', 300.00, 'Pendente'),
(4, '2024-02-05', 220.00, 'Pago'),
(5, '2024-02-01', 180.00, 'Pendente');

-- Atualização de dados para a tabela Alunos
UPDATE Alunos
SET Modalidades = 'Musculação, Yoga'
WHERE AlunoID = 1;

UPDATE Alunos
SET Endereco = 'Rua das Palmeiras, 456', Modalidades = 'Pilates, Crossfit'
WHERE AlunoID = 2;

-- Atualização de dados para a tabela Instrutores
UPDATE Instrutores
SET Modalidades = 'Musculação, Cardio, Crossfit'
WHERE InstrutorID = 1;

UPDATE Instrutores
SET Alunos = 'Carlos Santos, Fernanda Costa'
WHERE InstrutorID = 2;

-- Atualização de dados para a tabela Modalidades
UPDATE Modalidades
SET Descricao = 'Treinamento intenso para resistência muscular'
WHERE ModalidadeID = 1;

UPDATE Modalidades
SET Nome = 'Pilates Avançado', Descricao = 'Pilates para níveis avançados'
WHERE ModalidadeID = 2;

-- Atualização de dados para a tabela PlanosTreinamento
UPDATE PlanosTreinamento
SET Descricao = 'Plano de treino para emagrecimento e resistência'
WHERE PlanoID = 1;

UPDATE PlanosTreinamento
SET DataFim = '2024-04-10'
WHERE PlanoID = 3;

-- Atualização de dados para a tabela Aulas
UPDATE Aulas
SET Horario = '07:00'
WHERE AulaID = 1;

UPDATE Aulas
SET Capacidade = 18
WHERE AulaID = 4;

-- Atualização de dados para a tabela Pagamentos
UPDATE Pagamentos
SET Status = 'Pago'
WHERE PagamentoID = 3;

UPDATE Pagamentos
SET Valor = 210.00
WHERE PagamentoID = 5;

-- Exclusão de dados para a tabela Alunos
DELETE FROM Alunos WHERE AlunoID = 3;

-- Exclusão de dados para a tabela Instrutores
DELETE FROM Instrutores WHERE InstrutorID = 5;

-- Exclusão de dados para a tabela Modalidades
DELETE FROM Modalidades WHERE ModalidadeID = 5;

-- Exclusão de dados para a tabela PlanosTreinamento
DELETE FROM PlanosTreinamento WHERE PlanoID = 2;

-- Exclusão de dados para a tabela Aulas
DELETE FROM Aulas WHERE AulaID = 2;

-- Exclusão de dados para a tabela Pagamentos
DELETE FROM Pagamentos WHERE PagamentoID = 4;

