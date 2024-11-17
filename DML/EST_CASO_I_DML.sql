CREATE DATABASE CASOUM;
USE CASOUM;

CREATE TABLE IF NOT EXISTS FORNECEDORES(
    cod_forn INT PRIMARY KEY AUTO_INCREMENT,
    nome_forn VARCHAR (50) NOT NULL,
    end_forn TEXT NOT NULL,
    pais_forn VARCHAR (2) NOT NULL,
    tel_forn VARCHAR(15) NOT NULL,
    contato_forn VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PRODUTOS(
    cod_prod INT PRIMARY KEY AUTO_INCREMENT,
    nome_prod VARCHAR (50) NOT NULL,
    desc_prod VARCHAR (50) NOT NULL,
    esp_tec_prod VARCHAR (50) NOT NULL,
    uni_med_prod VARCHAR (10) NOT NULL,
    preco_u_prod NUMERIC(12,2) NOT NULL,
    quant_prod INT NOT NULL,
    estoque_min_prod INT NOT NULL,
    local_prod VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PEDIDOS(
    cod_ped INT PRIMARY KEY AUTO_INCREMENT,
    data_ped DATE NOT NULL,
    hora_ped TIME NOT NULL,
    prev_ped DATETIME NOT NULL,
    status_pedido ENUM ("AGUARDANDO PAGAMENTO", "ENVIADO", "SAINDO PARA ENTREGA", "ENTREGUE")
);

CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
    cod_pedido_r INT NOT NULL, -- Nome corrigido
    data_receb DATE NOT NULL,
    hora_receb TIME NOT NULL,
    quant_prod_receb INT NOT NULL,
    condic_mat_receb VARCHAR (50) NOT NULL,
    CONSTRAINT fk_cod_pedido_r FOREIGN KEY (cod_pedido_r) REFERENCES PEDIDOS(cod_ped), -- Referência corrigida
    PRIMARY KEY (cod_pedido_r, data_receb, hora_receb) -- Ajuste na chave primária
);

CREATE TABLE IF NOT EXISTS FILIAIS (
    cod_filial INT PRIMARY KEY AUTO_INCREMENT,
    nome_filial VARCHAR (50) NOT NULL,
    end_filial VARCHAR (50) NOT NULL,
    capac_arm_filial INT NOT NULL
); 

-- Entidades associativas --

CREATE TABLE IF NOT EXISTS FORNEC_PROD(
    cod_fornec_fp INT NOT NULL,
    cod_prod_fp INT NOT NULL,
    CONSTRAINT fk_cod_fornec FOREIGN KEY (cod_fornec_fp) REFERENCES FORNECEDORES(cod_forn),
    CONSTRAINT fk_cod_prod FOREIGN KEY (cod_prod_fp) REFERENCES PRODUTOS(cod_prod),
    PRIMARY KEY (cod_fornec_fp, cod_prod_fp) 
);

CREATE TABLE IF NOT EXISTS PEDIDO_PROD(
    cod_prod_pp INT NOT NULL,
    cod_pedido_pp INT NOT NULL,
    CONSTRAINT fk_cod_pedido_pp FOREIGN KEY (cod_pedido_pp) REFERENCES PEDIDOS(cod_ped), -- Referência corrigida
    CONSTRAINT fk_cod_prod_pp FOREIGN KEY (cod_prod_pp) REFERENCES PRODUTOS(cod_prod),
    PRIMARY KEY (cod_pedido_pp, cod_prod_pp) 
);

CREATE TABLE IF NOT EXISTS PROD_FILIAL(
    cod_filial_pf INT NOT NULL,
    cod_prod_pf INT NOT NULL,
    CONSTRAINT fk_cod_filial_pf FOREIGN KEY (cod_filial_pf) REFERENCES FILIAIS(cod_filial), -- Referência corrigida
    CONSTRAINT fk_cod_prod_pf FOREIGN KEY (cod_prod_pf) REFERENCES PRODUTOS(cod_prod),
    PRIMARY KEY (cod_filial_pf, cod_prod_pf) 
);

-- Inserção de dados para a tabela FORNECEDORES
INSERT INTO FORNECEDORES (nome_forn, end_forn, pais_forn, tel_forn, contato_forn) VALUES
('Fornecedor A', 'Rua X, 123', 'BR', '11123456789', 'João Silva'),
('Fornecedor B', 'Av. Y, 456', 'BR', '11987654321', 'Maria Oliveira'),
('Fornecedor C', 'Praça Z, 789', 'BR', '11343456565', 'Carlos Pereira'),
('Fornecedor D', 'Rua W, 1011', 'US', '12123456543', 'Anna Johnson'),
('Fornecedor E', 'Av. V, 1213', 'US', '13243546576', 'James Smith');

-- Inserção de dados para a tabela PRODUTOS
INSERT INTO PRODUTOS (nome_prod, desc_prod, esp_tec_prod, uni_med_prod, preco_u_prod, quant_prod, estoque_min_prod, local_prod) VALUES
('Produto A', 'Descrição A', 'Especificação A', 'UN', 100.00, 50, 10, 'Armazém 1'),
('Produto B', 'Descrição B', 'Especificação B', 'KG', 200.00, 30, 5, 'Armazém 2'),
('Produto C', 'Descrição C', 'Especificação C', 'M', 150.00, 40, 15, 'Armazém 3'),
('Produto D', 'Descrição D', 'Especificação D', 'UN', 50.00, 100, 20, 'Armazém 4'),
('Produto E', 'Descrição E', 'Especificação E', 'KG', 120.00, 20, 10, 'Armazém 5');

-- Inserção de dados para a tabela PEDIDOS
INSERT INTO PEDIDOS (data_ped, hora_ped, prev_ped, status_pedido) VALUES
('2024-10-01', '14:30:00', '2024-10-02 09:00:00', 'AGUARDANDO PAGAMENTO'),
('2024-10-02', '16:00:00', '2024-10-03 10:00:00', 'ENVIADO'),
('2024-10-03', '11:00:00', '2024-10-04 12:00:00', 'SAINDO PARA ENTREGA'),
('2024-10-04', '10:00:00', '2024-10-05 11:00:00', 'ENTREGUE'),
('2024-10-05', '09:00:00', '2024-10-06 13:00:00', 'AGUARDANDO PAGAMENTO');

-- Inserção de dados para a tabela RECEBIMENTOS
INSERT INTO RECEBIMENTOS (cod_pedido_r, data_receb, hora_receb, quant_prod_receb, condic_mat_receb) VALUES
(1, '2024-10-01', '15:00:00', 50, 'Bom'),
(2, '2024-10-02', '17:30:00', 30, 'Bom'),
(3, '2024-10-03', '12:00:00', 40, 'Bom'),
(4, '2024-10-04', '11:30:00', 100, 'Bom'),
(5, '2024-10-05', '10:00:00', 20, 'Bom');

-- Inserção de dados para a tabela FILIAIS
INSERT INTO FILIAIS (nome_filial, end_filial, capac_arm_filial) VALUES
('Filial 1', 'Rua A, 123', 500),
('Filial 2', 'Av. B, 456', 1000),
('Filial 3', 'Praça C, 789', 750),
('Filial 4', 'Rua D, 1011', 400),
('Filial 5', 'Av. E, 1213', 600);

-- Inserção de dados para a tabela FORNEC_PROD
INSERT INTO FORNEC_PROD (cod_fornec_fp, cod_prod_fp) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- Inserção de dados para a tabela PEDIDO_PROD
INSERT INTO PEDIDO_PROD (cod_prod_pp, cod_pedido_pp) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserção de dados para a tabela PROD_FILIAL
INSERT INTO PROD_FILIAL (cod_filial_pf, cod_prod_pf) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Atualização de dados para a tabela FORNECEDORES
UPDATE FORNECEDORES
SET nome_forn = 'Fornecedor A Atualizado', tel_forn = '1122334455'
WHERE cod_forn = 1;

UPDATE FORNECEDORES
SET nome_forn = 'Fornecedor B Atualizado', pais_forn = 'US'
WHERE cod_forn = 2;

-- Atualização de dados para a tabela PRODUTOS
UPDATE PRODUTOS
SET preco_u_prod = 120.00, quant_prod = 60
WHERE cod_prod = 1;

UPDATE PRODUTOS
SET estoque_min_prod = 30, local_prod = 'Armazém 6'
WHERE cod_prod = 2;

-- Atualização de dados para a tabela PEDIDOS
UPDATE PEDIDOS
SET status_pedido = 'ENTREGUE'
WHERE cod_ped = 4 AND status_pedido = 'SAINDO PARA ENTREGA';

UPDATE PEDIDOS
SET status_pedido = 'ENVIADO'
WHERE cod_ped = 3 AND status_pedido = 'AGUARDANDO PAGAMENTO';

-- Atualização de dados para a tabela RECEBIMENTOS
UPDATE RECEBIMENTOS
SET quant_prod_receb = 60, condic_mat_receb = 'Excelente'
WHERE cod_pedido_r = 1 AND data_receb = '2024-10-01';

UPDATE RECEBIMENTOS
SET quant_prod_receb = 50, condic_mat_receb = 'Bom'
WHERE cod_pedido_r = 2 AND data_receb = '2024-10-02';

-- Atualização de dados para a tabela FILIAIS
UPDATE FILIAIS
SET capac_arm_filial = 550
WHERE cod_filial = 1;

UPDATE FILIAIS
SET nome_filial = 'Filial 2 Atualizada', capac_arm_filial = 1100
WHERE cod_filial = 2;

-- Atualização de dados para a tabela FORNEC_PROD
UPDATE FORNEC_PROD
SET cod_fornec_fp = 1
WHERE cod_prod_fp = 2;

UPDATE FORNEC_PROD
SET cod_fornec_fp = 2
WHERE cod_prod_fp = 3;

-- Atualização de dados para a tabela PEDIDO_PROD
UPDATE PEDIDO_PROD
SET cod_prod_pp = 4
WHERE cod_pedido_pp = 1;

UPDATE PEDIDO_PROD
SET cod_prod_pp = 5
WHERE cod_pedido_pp = 2;

-- Atualização de dados para a tabela PROD_FILIAL
UPDATE PROD_FILIAL
SET cod_filial_pf = 3
WHERE cod_prod_pf = 1;

UPDATE PROD_FILIAL
SET cod_filial_pf = 4
WHERE cod_prod_pf = 2;

-- Exclusão de dados para a tabela FORNECEDORES
DELETE FROM FORNECEDORES WHERE cod_forn = 5;

-- Exclusão de dados para a tabela PRODUTOS
DELETE FROM PRODUTOS WHERE cod_prod = 5;

-- Exclusão de dados para a tabela PEDIDOS
DELETE FROM PEDIDOS WHERE cod_ped = 5;

-- Exclusão de dados para a tabela RECEBIMENTOS
DELETE FROM RECEBIMENTOS WHERE cod_pedido = 5;

-- Exclusão de dados para a tabela FILIAIS
DELETE FROM FILIAIS WHERE cod_filial = 5;

-- Exclusão de dados para a tabela FORNEC_PROD
DELETE FROM FORNEC_PROD WHERE cod_fornec = 1 AND cod_prod = 2;

-- Exclusão de dados para a tabela PEDIDO_PROD
DELETE FROM PEDIDO_PROD WHERE cod_prod = 5 AND cod_pedido = 5;

-- Exclusão de dados para a tabela PROD_FILIAL
DELETE FROM PROD_FILIAL WHERE cod_filial = 3 AND cod_prod = 1;
