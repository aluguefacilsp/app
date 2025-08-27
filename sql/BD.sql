CREATE DATABASE IF NOT EXISTS LojaImoveis;
USE LojaImoveis;

-- Usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL, 
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Proprietários
CREATE TABLE IF NOT EXISTS proprietarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED UNIQUE,
    documento_foto VARCHAR(255),
    aceitou_termos BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Endereços
CREATE TABLE IF NOT EXISTS enderecos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(150),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    cep CHAR(8)
);

-- Imóveis
CREATE TABLE IF NOT EXISTS imoveis (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50), 
    descricao TEXT,
    valor_aluguel DECIMAL(10, 2),
    status ENUM('Disponivel', 'Alugado') DEFAULT 'Disponivel',
    proprietario_id INT UNSIGNED,
    endereco_id INT UNSIGNED,
    FOREIGN KEY (proprietario_id) REFERENCES proprietarios(id),
    FOREIGN KEY (endereco_id) REFERENCES enderecos(id)
);

-- Contratos
CREATE TABLE IF NOT EXISTS contratos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED,
    imovel_id INT UNSIGNED,
    data_inicio DATE,
    data_fim DATE,
    valor_mensal DECIMAL(10,2),
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (imovel_id) REFERENCES imoveis(id)
);

-- Imóveis vinculados a usuários
CREATE TABLE IF NOT EXISTS imoveis_usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    cep VARCHAR(20),
    endereco_id INT UNSIGNED NOT NULL,
    tipo VARCHAR(50),
    valor DECIMAL(10,2),
    quartos INT,
    banheiros INT,
    sala INT,
    cozinha INT,
    area DECIMAL(10,2),
    garagem BOOLEAN,
    mobiliado BOOLEAN,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (endereco_id) REFERENCES enderecos(id)
);

-- Imagens
CREATE TABLE IF NOT EXISTS imagens_imovel (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    imovel_id INT UNSIGNED NOT NULL,
    caminho_arquivo VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (imovel_id) REFERENCES imoveis_usuarios(id) ON DELETE CASCADE
);
