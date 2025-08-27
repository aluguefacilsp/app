CREATE DATABASE IF NOT EXISTS LojaImoveis;
USE LojaImoveis;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT NOT NULL, 
    CPF CHAR(11) NOT NULL,
    Telefone VARCHAR(15),
    DataCadastro DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (UsuarioID) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS Proprietarios (
    ProprietarioID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT UNIQUE,
    DocumentoFoto VARCHAR(255),
    AceitouTermos BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE IF NOT EXISTS Enderecos (
    EnderecoID INT AUTO_INCREMENT PRIMARY KEY,
    Logradouro VARCHAR(150),
    Numero VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado CHAR(2),
    CEP CHAR(8)
);

CREATE TABLE IF NOT EXISTS Imoveis (
    ImovelID INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(50), 
    Descricao TEXT,
    ValorAluguel DECIMAL(10, 2),
    Status ENUM('Disponivel', 'Alugado') DEFAULT 'Disponivel',
    ProprietarioID INT,
    EnderecoID INT,
    FOREIGN KEY (ProprietarioID) REFERENCES Proprietarios(ProprietarioID),
    FOREIGN KEY (EnderecoID) REFERENCES Enderecos(EnderecoID)
);

CREATE TABLE IF NOT EXISTS Contratos (
    ContratoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ImovelID INT,
    DataInicio DATE,
    DataFim DATE,
    ValorMensal DECIMAL(10,2),
    Ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ImovelID) REFERENCES Imoveis(ImovelID)
);

-- Tabela de pagamentos de aluguel
CREATE TABLE IF NOT EXISTS Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    ContratoID INT,
    DataPagamento DATE,
    ValorPago DECIMAL(10,2),
    ReferenteMes DATE,
    FOREIGN KEY (ContratoID) REFERENCES Contratos(ContratoID)
);

CREATE TABLE IF NOT EXISTS imoveis_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    cep VARCHAR(20),
    endereco VARCHAR(255),
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
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS imagens_imovel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imovel_id INT NOT NULL,
    caminho_arquivo VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (imovel_id) REFERENCES imoveis_usuarios(id) ON DELETE CASCADE
);
