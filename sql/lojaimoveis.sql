-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/08/2025 às 17:02
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojaimoveis`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `CPF` char(11) NOT NULL,
  `paisesID` int(11) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  `DataCadastro` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contratos`
--

CREATE TABLE `contratos` (
  `ContratoID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `ImovelID` int(11) DEFAULT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  `ValorMensal` decimal(10,2) DEFAULT NULL,
  `Ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `EnderecoID` int(11) NOT NULL,
  `Logradouro` varchar(150) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` char(2) DEFAULT NULL,
  `CEP` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens_imovel`
--

CREATE TABLE `imagens_imovel` (
  `id` int(11) NOT NULL,
  `imovel_id` int(11) NOT NULL,
  `caminho_arquivo` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imoveis`
--

CREATE TABLE `imoveis` (
  `ImovelID` int(11) NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Descricao` text DEFAULT NULL,
  `ValorAluguel` decimal(10,2) DEFAULT NULL,
  `Status` enum('Disponivel','Alugado') DEFAULT 'Disponivel',
  `ProprietarioID` int(11) DEFAULT NULL,
  `EnderecoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imoveis_usuarios`
--

CREATE TABLE `imoveis_usuarios` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `quartos` int(11) DEFAULT NULL,
  `banheiros` int(11) DEFAULT NULL,
  `sala` int(11) DEFAULT NULL,
  `cozinha` int(11) DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `garagem` tinyint(1) DEFAULT NULL,
  `mobiliado` tinyint(1) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `PagamentoID` int(11) NOT NULL,
  `ContratoID` int(11) DEFAULT NULL,
  `DataPagamento` date DEFAULT NULL,
  `ValorPago` decimal(10,2) DEFAULT NULL,
  `ReferenteMes` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paises`
--

CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL,
  `nome_pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paises`
--

INSERT INTO `paises` (`id_pais`, `nome_pais`) VALUES
(1, 'Brasil'),
(2, 'Argentina'),
(3, 'Estados Unidos'),
(4, 'Canadá'),
(5, 'França'),
(6, 'Alemanha'),
(7, 'Japão'),
(8, 'China'),
(9, 'África do Sul'),
(10, 'Austrália');

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietarios`
--

CREATE TABLE `proprietarios` (
  `ProprietarioID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `DocumentoFoto` varchar(255) DEFAULT NULL,
  `AceitouTermos` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `criado_em`) VALUES
(1, 'gabriel', 'jhonathan@gmail.com', '$2y$10$4pZ2zjFgL1xReHDUFUgRWuGuLCREoFwlTN650x2YknxRxyMAa9vv.', '2025-08-26 14:24:39');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteID`),
  ADD UNIQUE KEY `CPF` (`CPF`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `paisesID` (`paisesID`);

--
-- Índices de tabela `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`ContratoID`),
  ADD KEY `ClienteID` (`ClienteID`),
  ADD KEY `ImovelID` (`ImovelID`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`EnderecoID`);

--
-- Índices de tabela `imagens_imovel`
--
ALTER TABLE `imagens_imovel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imovel_id` (`imovel_id`);

--
-- Índices de tabela `imoveis`
--
ALTER TABLE `imoveis`
  ADD PRIMARY KEY (`ImovelID`),
  ADD KEY `ProprietarioID` (`ProprietarioID`),
  ADD KEY `EnderecoID` (`EnderecoID`);

--
-- Índices de tabela `imoveis_usuarios`
--
ALTER TABLE `imoveis_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`PagamentoID`),
  ADD KEY `ContratoID` (`ContratoID`);

--
-- Índices de tabela `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`);

--
-- Índices de tabela `proprietarios`
--
ALTER TABLE `proprietarios`
  ADD PRIMARY KEY (`ProprietarioID`),
  ADD UNIQUE KEY `ClienteID` (`ClienteID`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contratos`
--
ALTER TABLE `contratos`
  MODIFY `ContratoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `EnderecoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagens_imovel`
--
ALTER TABLE `imagens_imovel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imoveis`
--
ALTER TABLE `imoveis`
  MODIFY `ImovelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imoveis_usuarios`
--
ALTER TABLE `imoveis_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `PagamentoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `proprietarios`
--
ALTER TABLE `proprietarios`
  MODIFY `ProprietarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`paisesID`) REFERENCES `paises` (`id_pais`);

--
-- Restrições para tabelas `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`),
  ADD CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`ImovelID`) REFERENCES `imoveis` (`ImovelID`);

--
-- Restrições para tabelas `imagens_imovel`
--
ALTER TABLE `imagens_imovel`
  ADD CONSTRAINT `imagens_imovel_ibfk_1` FOREIGN KEY (`imovel_id`) REFERENCES `imoveis_usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `imoveis`
--
ALTER TABLE `imoveis`
  ADD CONSTRAINT `imoveis_ibfk_1` FOREIGN KEY (`ProprietarioID`) REFERENCES `proprietarios` (`ProprietarioID`),
  ADD CONSTRAINT `imoveis_ibfk_2` FOREIGN KEY (`EnderecoID`) REFERENCES `enderecos` (`EnderecoID`);

--
-- Restrições para tabelas `imoveis_usuarios`
--
ALTER TABLE `imoveis_usuarios`
  ADD CONSTRAINT `imoveis_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`ContratoID`) REFERENCES `contratos` (`ContratoID`);

--
-- Restrições para tabelas `proprietarios`
--
ALTER TABLE `proprietarios`
  ADD CONSTRAINT `proprietarios_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
