-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Out-2019 às 17:54
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mercador`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id_prod` int(11) DEFAULT NULL,
  `valor_compra` float DEFAULT NULL,
  `valor_venda` float DEFAULT NULL,
  `qnt_venda` int(11) DEFAULT NULL,
  `data_caixa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_prod` int(11) UNSIGNED NOT NULL,
  `nome_prod` varchar(100) NOT NULL,
  `valor_venda` float NOT NULL,
  `valor_compra` float NOT NULL,
  `qnt_estoque` int(11) NOT NULL,
  `data_valid` date NOT NULL,
  `id_forcedor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id_prod`, `nome_prod`, `valor_venda`, `valor_compra`, `qnt_estoque`, `data_valid`, `id_forcedor`) VALUES
(6, 'arroz', 10, 8, 500, '2019-10-03', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro`
--

CREATE TABLE `financeiro` (
  `data_caixa` date NOT NULL,
  `caixa_dia` float DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `valor_caixa_mes` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome_funcionario` varchar(100) DEFAULT NULL,
  `cpf_funcionario` varchar(14) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `nasc_funcionario` date DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `cargo_funcionario` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_caixa`
--

CREATE TABLE `login_caixa` (
  `id_funcionario` int(11) NOT NULL,
  `id_prod` int(10) UNSIGNED DEFAULT NULL,
  `nome_prod` varchar(100) DEFAULT NULL,
  `valor_venda` float DEFAULT NULL,
  `qnt_vendas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_estoque`
--

CREATE TABLE `venda_estoque` (
  `id_prod` int(11) NOT NULL,
  `nome_prod` varchar(100) DEFAULT NULL,
  `valor_prod` float DEFAULT NULL,
  `qnt_prod` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_prod`,`nome_prod`,`valor_venda`,`valor_compra`,`qnt_estoque`,`data_valid`);

--
-- Índices para tabela `financeiro`
--
ALTER TABLE `financeiro`
  ADD PRIMARY KEY (`data_caixa`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices para tabela `login_caixa`
--
ALTER TABLE `login_caixa`
  ADD KEY `login_caixa_ibfk_1` (`id_prod`,`nome_prod`,`valor_venda`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id_prod` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `login_caixa`
--
ALTER TABLE `login_caixa`
  ADD CONSTRAINT `login_caixa_ibfk_1` FOREIGN KEY (`id_prod`,`nome_prod`,`valor_venda`) REFERENCES `estoque` (`id_prod`, `nome_prod`, `valor_venda`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
