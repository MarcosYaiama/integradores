-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 09-Ago-2018 às 16:25
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `integradores`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `analise`
--

DROP TABLE IF EXISTS `analise`;
CREATE TABLE IF NOT EXISTS `analise` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `umidade` int(11) DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `grao_fk` varchar(30) DEFAULT NULL,
  `hora_inicio_analise` time DEFAULT NULL,
  `data_inicio_analise` date DEFAULT NULL,
  `estado_fk` varchar(30) DEFAULT NULL,
  `resultado` varchar(35) DEFAULT NULL,
  `tempo_analise` time DEFAULT NULL,
  KEY `id_carga_fk` (`id_carga_fk`),
  KEY `grao_fk` (`grao_fk`),
  KEY `estado_fk` (`estado_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `analise`
--

INSERT INTO `analise` (`id_carga_fk`, `umidade`, `temperatura`, `grao_fk`, `hora_inicio_analise`, `data_inicio_analise`, `estado_fk`, `resultado`, `tempo_analise`) VALUES
(1, 9, 21, 'Soja', '16:14:05', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(2, 9, 17, 'Milho', '16:14:06', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(3, 1, 14, 'Milho', '16:14:07', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(4, 0, 16, 'Soja', '16:14:08', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(5, 7, 19, 'Soja', '16:14:09', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(6, 5, 11, 'Soja', '16:14:10', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(7, 8, 18, 'Soja', '16:14:11', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(8, 7, 15, 'Milho', '16:14:12', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(9, 9, 10, 'Milho', '16:14:13', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(10, 0, 20, 'Soja', '16:14:14', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(11, 4, 20, 'Soja', '16:14:15', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(12, 1, 18, 'Soja', '16:14:17', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(13, 0, 20, 'Milho', '16:14:18', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(14, 7, 12, 'Soja', '16:14:19', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(15, 1, 15, 'Soja', '16:14:20', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(16, 9, 10, 'Soja', '16:14:21', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(17, 10, 20, 'Milho', '16:14:22', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(18, 5, 11, 'Soja', '16:41:34', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01'),
(19, 9, 15, 'Milho', '21:33:20', '2018-08-08', 'Analista', 'Indisponivel', '00:00:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`nome`) VALUES
('ANALISTA DE GRAOS'),
('CCO'),
('GUARDA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `escala_gravidade`
--

DROP TABLE IF EXISTS `escala_gravidade`;
CREATE TABLE IF NOT EXISTS `escala_gravidade` (
  `nome` varchar(35) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `escala_gravidade`
--

INSERT INTO `escala_gravidade` (`nome`) VALUES
('Ardido'),
('Chocho'),
('Danificado'),
('Fermentado'),
('Germinado'),
('Imaturo'),
('Mofado'),
('Queimado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado_analise`
--

DROP TABLE IF EXISTS `estado_analise`;
CREATE TABLE IF NOT EXISTS `estado_analise` (
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado_analise`
--

INSERT INTO `estado_analise` (`nome`) VALUES
('Analista'),
('CCO'),
('Finalizado'),
('Guarda'),
('Maquina'),
('OCR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `graos`
--

DROP TABLE IF EXISTS `graos`;
CREATE TABLE IF NOT EXISTS `graos` (
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `graos`
--

INSERT INTO `graos` (`nome`) VALUES
('Milho'),
('Soja');

-- --------------------------------------------------------

--
-- Estrutura da tabela `info_cargas`
--

DROP TABLE IF EXISTS `info_cargas`;
CREATE TABLE IF NOT EXISTS `info_cargas` (
  `id_carga` int(11) NOT NULL AUTO_INCREMENT,
  `grao` varchar(30) DEFAULT NULL,
  `fornecedor` varchar(50) DEFAULT NULL,
  `destino` varchar(50) DEFAULT NULL,
  `data_chegada` date DEFAULT NULL,
  `hora_chegada` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  PRIMARY KEY (`id_carga`),
  KEY `grao` (`grao`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `info_cargas`
--

INSERT INTO `info_cargas` (`id_carga`, `grao`, `fornecedor`, `destino`, `data_chegada`, `hora_chegada`, `hora_termino`) VALUES
(1, 'Milho', 'Fazendeiros Tabajara', 'Guaruja', '2018-08-08', '03:18:06', '03:18:06'),
(2, 'Milho', 'Granolandia', 'Guaruja', '2018-08-08', '03:19:29', '03:19:29'),
(3, 'Soja', 'MM Grãos', 'Santos', '2018-08-08', '03:22:50', '03:22:50'),
(4, 'Milho', 'Granolandia', 'Guaruja', '2018-08-08', '03:23:34', '03:23:34'),
(5, 'Soja', 'Granolandia', 'São Paulo', '2018-08-08', '03:24:32', '03:24:32'),
(6, 'Soja', 'Moinho Paulista', 'São Vicente', '2018-08-08', '03:29:26', '03:29:26'),
(7, 'Soja', 'Fazendeiros Tabajara', 'Taiwan', '2018-08-08', '15:01:44', '15:01:44'),
(8, 'Soja', 'Fazendeiros Tabajara', 'Guaruja', '2018-08-08', '15:01:57', '15:01:57'),
(9, 'Milho', 'Moinho Paulista', 'Guaruja', '2018-08-08', '15:02:12', '15:02:12'),
(10, 'Soja', 'Granolandia', 'Santos', '2018-08-08', '15:03:42', '15:03:42'),
(11, 'Soja', 'Fazendeiros Tabajara', 'Taiwan', '2018-08-08', '15:04:48', '15:04:48'),
(12, 'Milho', 'MM Grãos', 'São Paulo', '2018-08-08', '15:05:13', '15:05:13'),
(13, 'Soja', 'Moinho Paulista', 'Santos', '2018-08-08', '15:05:59', '15:05:59'),
(14, 'Soja', 'Fazendeiros Tabajara', 'Japão', '2018-08-08', '15:06:46', '15:06:46'),
(15, 'Milho', 'MM Grãos', 'São Vicente', '2018-08-08', '15:07:14', '15:07:14'),
(16, 'Milho', 'MM Grãos', 'Guaruja', '2018-08-08', '15:07:21', '15:07:21'),
(17, 'Milho', 'Moinho Paulista', 'Taiwan', '2018-08-08', '15:45:21', '15:45:21'),
(18, 'Soja', 'Fazendeiros Tabajara', 'Taiwan', '2018-08-08', '16:41:34', '16:41:34'),
(19, 'Milho', 'Granolandia', 'Guaruja', '2018-08-08', '21:33:20', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs_func`
--

DROP TABLE IF EXISTS `logs_func`;
CREATE TABLE IF NOT EXISTS `logs_func` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(100) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `data` date DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `cargo` (`cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `logs_func`
--

INSERT INTO `logs_func` (`id`, `id_usuario`, `Status`, `hora`, `data`, `cargo`) VALUES
(2, 'Nicholas', 1, '08:54:07', '2018-08-07', 'CCO'),
(3, 'Caruara', 1, '08:54:07', '2018-08-07', 'ANALISTA DE GRAOS'),
(4, 'Caruara', 0, '08:57:07', '2018-08-07', 'ANALISTA DE GRAOS'),
(5, 'Nicholas', 1, '09:06:28', '2018-08-07', 'CCO'),
(6, 'Nicholas', 0, '10:46:26', '2018-08-07', 'CCO'),
(7, 'Nicholas', 1, '10:46:26', '2018-08-07', 'CCO'),
(8, 'Nicholas', 0, '10:46:26', '2018-08-07', 'CCO'),
(9, 'Nicholas', 1, '10:46:26', '2018-08-07', 'CCO'),
(10, 'Nicholas', 0, '10:46:26', '2018-08-07', 'CCO'),
(11, 'Nicholas', 1, '10:51:59', '2018-08-07', 'CCO'),
(12, 'Nicholas', 0, '10:52:09', '2018-08-07', 'CCO'),
(13, 'Jessica', 1, '10:52:35', '2018-08-07', 'ANALISTA DE GRAOS'),
(14, 'Jessica', 0, '10:52:45', '2018-08-07', 'ANALISTA DE GRAOS'),
(15, 'Eduardo', 1, '10:52:54', '2018-08-07', 'GUARDA'),
(16, 'Eduardo', 0, '10:53:03', '2018-08-07', 'GUARDA'),
(17, 'Nicholas', 1, '10:53:44', '2018-08-07', 'CCO'),
(18, 'Nicholas', 0, '02:18:58', '2018-08-08', 'CCO'),
(19, 'Marcos', 1, '02:26:55', '2018-08-08', 'CCO'),
(20, 'Marcos', 0, '21:42:35', '2018-08-08', 'CCO'),
(21, 'Mauro', 1, '21:43:14', '2018-08-08', 'ANALISTA DE GRAOS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `milho`
--

DROP TABLE IF EXISTS `milho`;
CREATE TABLE IF NOT EXISTS `milho` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `avariados_ardidos` int(11) DEFAULT NULL,
  `quebrados` int(11) DEFAULT NULL,
  `impurezas` int(11) DEFAULT NULL,
  `carunchado` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `Analista` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `id_carga_fk` (`id_carga_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `milho`
--

INSERT INTO `milho` (`id_carga_fk`, `avariados_ardidos`, `quebrados`, `impurezas`, `carunchado`, `data`, `hora_inicio`, `hora_termino`, `Analista`, `id`) VALUES
(2, NULL, NULL, NULL, NULL, '2018-08-09', '03:08:09', NULL, 'Mauro O Analista', 4),
(9, NULL, NULL, NULL, NULL, '2018-08-09', '03:10:13', NULL, 'Mauro O Analista', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `soja`
--

DROP TABLE IF EXISTS `soja`;
CREATE TABLE IF NOT EXISTS `soja` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `ardidos` int(11) DEFAULT NULL,
  `queimados` int(11) DEFAULT NULL,
  `mofados` int(11) DEFAULT NULL,
  `esverdeados` int(11) DEFAULT NULL,
  `PQA` int(11) DEFAULT NULL,
  `impurezas` int(11) DEFAULT NULL,
  `Analista` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `id_carga_fk` (`id_carga_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `soja`
--

INSERT INTO `soja` (`id_carga_fk`, `ardidos`, `queimados`, `mofados`, `esverdeados`, `PQA`, `impurezas`, `Analista`, `data`, `hora_inicio`, `hora_termino`, `id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, 'Mauro O Analista', '2018-08-09', '02:08:21', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`nome`) VALUES
('Offline'),
('Online');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ultimas_analises`
--

DROP TABLE IF EXISTS `ultimas_analises`;
CREATE TABLE IF NOT EXISTS `ultimas_analises` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `grao_fk` varchar(30) DEFAULT NULL,
  `resultado_fk` varchar(35) DEFAULT NULL,
  `tempo_de_espera` time DEFAULT NULL,
  KEY `id_carga_fk` (`id_carga_fk`),
  KEY `grao_fk` (`grao_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` varchar(100) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `nome_completo` varchar(200) DEFAULT NULL,
  `status_atual` varchar(30) DEFAULT 'Offline',
  PRIMARY KEY (`id`),
  KEY `status_atual` (`status_atual`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `senha`, `cargo`, `nome_completo`, `status_atual`) VALUES
('Caruara', 'mestra', 'ANALISTA DE GRAOS', 'Anderton Aleluia', 'Offline'),
('Eduardo', 'mestra', 'GUARDA', 'Eduardo Portos', 'Offline'),
('Jessica', 'mestra', 'ANALISTA DE GRAOS', 'Jessica Portos', 'Offline'),
('Lara', 'mestra', 'GUARDA', 'Lara Croft', 'Offline'),
('Marcos', 'mestra', 'CCO', 'Marcos o CCO', 'Offline'),
('Mauricio', 'mestra', 'GUARDA', 'Mauricio Mendonça', 'Offline'),
('Mauro', 'mestra', 'ANALISTA DE GRAOS', 'Mauro O Analista', 'Online'),
('Mazzei', 'mestra', 'CCO', 'Mazzei Testando', 'Offline'),
('Nicholas', 'mestra', 'CCO', 'Nicholas Wesley Mazzei', 'Offline');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `analise`
--
ALTER TABLE `analise`
  ADD CONSTRAINT `analise_ibfk_1` FOREIGN KEY (`id_carga_fk`) REFERENCES `info_cargas` (`id_carga`),
  ADD CONSTRAINT `analise_ibfk_2` FOREIGN KEY (`grao_fk`) REFERENCES `info_cargas` (`grao`),
  ADD CONSTRAINT `analise_ibfk_3` FOREIGN KEY (`estado_fk`) REFERENCES `estado_analise` (`nome`);

--
-- Limitadores para a tabela `info_cargas`
--
ALTER TABLE `info_cargas`
  ADD CONSTRAINT `info_cargas_ibfk_1` FOREIGN KEY (`grao`) REFERENCES `graos` (`nome`);

--
-- Limitadores para a tabela `logs_func`
--
ALTER TABLE `logs_func`
  ADD CONSTRAINT `logs_func_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `logs_func_ibfk_2` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`nome`);

--
-- Limitadores para a tabela `milho`
--
ALTER TABLE `milho`
  ADD CONSTRAINT `milho_ibfk_1` FOREIGN KEY (`id_carga_fk`) REFERENCES `info_cargas` (`id_carga`);

--
-- Limitadores para a tabela `soja`
--
ALTER TABLE `soja`
  ADD CONSTRAINT `soja_ibfk_1` FOREIGN KEY (`id_carga_fk`) REFERENCES `info_cargas` (`id_carga`);

--
-- Limitadores para a tabela `ultimas_analises`
--
ALTER TABLE `ultimas_analises`
  ADD CONSTRAINT `ultimas_analises_ibfk_1` FOREIGN KEY (`id_carga_fk`) REFERENCES `info_cargas` (`id_carga`),
  ADD CONSTRAINT `ultimas_analises_ibfk_2` FOREIGN KEY (`grao_fk`) REFERENCES `info_cargas` (`grao`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`status_atual`) REFERENCES `status` (`nome`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
