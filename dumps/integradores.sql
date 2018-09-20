-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20-Set-2018 às 11:20
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.2

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

CREATE TABLE `analise` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `umidade` int(11) DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `grao_fk` varchar(30) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `hora_fim_analise_m` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `analise`
--

INSERT INTO `analise` (`id_carga_fk`, `umidade`, `temperatura`, `grao_fk`, `data`, `id`, `hora_fim_analise_m`) VALUES
(17, 2, 22, 'Soja', '2018-08-19', 16, '14:15:11'),
(18, 5, 12, 'Soja', '2018-08-19', 17, '14:15:26'),
(19, 10, 10, 'Milho', '2018-08-19', 18, '14:15:43'),
(20, 7, 20, 'Milho', '2018-08-23', 19, '03:56:59'),
(23, 0, 12, 'Milho', '2018-08-23', 22, '18:50:07'),
(24, 10, 13, 'Soja', '2018-09-01', 23, '07:41:11'),
(25, 10, 17, 'Milho', '2018-09-02', 24, '17:26:13'),
(26, 1, 15, 'Milho', '2018-09-02', 25, '17:37:00'),
(27, 0, 10, 'Soja', '2018-09-02', 26, '17:39:50'),
(28, 0, 12, 'Milho', '2018-09-02', 27, '17:42:15'),
(29, 10, 11, 'Soja', '2018-09-02', 28, '17:47:40'),
(30, 8, 21, 'Soja', '2018-09-11', 29, '10:36:02'),
(31, 8, 18, 'Milho', '2018-09-17', 30, '14:02:10'),
(32, 1, 10, 'Soja', '2018-09-17', 31, '14:02:13'),
(33, 9, 17, 'Milho', '2018-09-17', 32, '14:02:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `analise_manual`
--

CREATE TABLE `analise_manual` (
  `id` int(11) NOT NULL,
  `analista` varchar(126) DEFAULT NULL,
  `dado_analisado` varchar(50) DEFAULT NULL,
  `irregular` tinyint(1) DEFAULT NULL,
  `hora_inicio_a` time DEFAULT NULL,
  `hora_termino_a` time DEFAULT NULL,
  `data` date DEFAULT NULL,
  `n_analise` int(11) DEFAULT NULL,
  `redirecionamento` varchar(40) DEFAULT NULL,
  `id_carga_fk` int(11) DEFAULT NULL,
  `analise` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `analise_manual`
--

INSERT INTO `analise_manual` (`id`, `analista`, `dado_analisado`, `irregular`, `hora_inicio_a`, `hora_termino_a`, `data`, `n_analise`, `redirecionamento`, `id_carga_fk`, `analise`) VALUES
(11, 'Mauro', 'Ardidos e Queimados', 0, '23:51:15', '03:34:48', '2018-08-21', 1, 'Gate 2', 17, 1),
(12, 'Mauro', 'Queimados', 1, '23:51:15', '03:34:48', '2018-08-21', 1, 'Gate 2', 17, 1),
(13, 'Mauro', 'Mofados', 0, '23:51:15', '03:34:48', '2018-08-21', 1, 'Gate 2', 17, 1),
(14, 'Mauro', 'Esverdeados', 0, '23:51:15', '03:34:48', '2018-08-21', 1, 'Gate 2', 17, 1),
(15, 'Mauro', 'Partidos, Queimados e Amassados', 0, '23:51:15', '03:34:48', '2018-08-21', 1, 'Gate 2', 17, 1),
(16, 'Mauro', 'Materias Estranhas e Impurezas', 1, '23:51:15', '03:34:48', '2018-08-21', 1, 'Gate 2', 17, 1),
(17, 'Mauro', 'Avariados e Ardidos', 0, '03:39:37', '03:39:48', '2018-08-23', 1, 'Gate 3', 19, 1),
(18, 'Mauro', 'Graos Quebrados', 0, '03:39:37', '03:39:48', '2018-08-23', 1, 'Gate 3', 19, 1),
(19, 'Mauro', 'Impurezas', 0, '03:39:37', '03:39:48', '2018-08-23', 1, 'Gate 3', 19, 1),
(20, 'Mauro', 'Carunchado', 0, '03:39:37', '03:39:48', '2018-08-23', 1, 'Gate 3', 19, 1),
(21, 'Mauro', 'Ardidos e Queimados', 0, '03:40:04', '03:40:14', '2018-08-23', 2, 'Gate 2', 18, 1),
(22, 'Mauro', 'Queimados', 1, '03:40:04', '03:40:14', '2018-08-23', 2, 'Gate 2', 18, 1),
(23, 'Mauro', 'Mofados', 0, '03:40:04', '03:40:14', '2018-08-23', 2, 'Gate 2', 18, 1),
(24, 'Mauro', 'Esverdeados', 0, '03:40:04', '03:40:14', '2018-08-23', 2, 'Gate 2', 18, 1),
(25, 'Mauro', 'Partidos, Queimados e Amassados', 0, '03:40:04', '03:40:14', '2018-08-23', 2, 'Gate 2', 18, 1),
(26, 'Mauro', 'Materias Estranhas e Impurezas', 1, '03:40:04', '03:40:14', '2018-08-23', 2, 'Gate 2', 18, 1),
(43, 'Caruara', 'Avariados e Ardidos', 1, '18:50:10', '18:50:19', '2018-08-23', 1, 'Gate 2', 23, 30),
(44, 'Caruara', 'Graos Quebrados', 1, '18:50:10', '18:50:19', '2018-08-23', 1, 'Gate 2', 23, 30),
(45, 'Caruara', 'Impurezas', 1, '18:50:10', '18:50:19', '2018-08-23', 1, 'Gate 2', 23, 30),
(46, 'Caruara', 'Carunchado', 1, '18:50:10', '18:50:19', '2018-08-23', 1, 'Gate 2', 23, 30),
(47, 'Caruara', 'Ardidos e Queimados', 0, '07:41:23', '07:41:41', '2018-09-01', 1, 'Armazem 2', 24, 1),
(48, 'Caruara', 'Queimados', 1, '07:41:23', '07:41:41', '2018-09-01', 1, 'Armazem 2', 24, 1),
(49, 'Caruara', 'Mofados', 0, '07:41:23', '07:41:41', '2018-09-01', 1, 'Armazem 2', 24, 1),
(50, 'Caruara', 'Esverdeados', 0, '07:41:23', '07:41:41', '2018-09-01', 1, 'Armazem 2', 24, 1),
(51, 'Caruara', 'Partidos, Queimados e Amassados', 0, '07:41:23', '07:41:41', '2018-09-01', 1, 'Armazem 2', 24, 1),
(52, 'Caruara', 'Materias Estranhas e Impurezas', 1, '07:41:23', '07:41:41', '2018-09-01', 1, 'Armazem 2', 24, 1),
(53, 'Caruara', 'Avariados e Ardidos', 1, '17:26:17', '17:33:49', '2018-09-02', 1, 'Armazem 1', 25, 10),
(54, 'Caruara', 'Graos Quebrados', 1, '17:26:17', '17:33:49', '2018-09-02', 1, 'Armazem 1', 25, 10),
(55, 'Caruara', 'Impurezas', 1, '17:26:17', '17:33:49', '2018-09-02', 1, 'Armazem 1', 25, 10),
(56, 'Caruara', 'Carunchado', 1, '17:26:17', '17:33:49', '2018-09-02', 1, 'Armazem 1', 25, 10),
(57, 'Caruara', 'Avariados e Ardidos', 1, '17:37:05', '17:37:18', '2018-09-02', 1, 'Armazem 2', 26, 30),
(58, 'Caruara', 'Graos Quebrados', 1, '17:37:05', '17:37:18', '2018-09-02', 1, 'Armazem 2', 26, 30),
(59, 'Caruara', 'Impurezas', 1, '17:37:05', '17:37:19', '2018-09-02', 1, 'Armazem 2', 26, 30),
(60, 'Caruara', 'Carunchado', 1, '17:37:05', '17:37:18', '2018-09-02', 1, 'Armazem 2', 26, 30),
(61, 'Caruara', 'Ardidos e Queimados', 1, '17:40:15', '17:40:38', '2018-09-02', 0, 'Armazem 2', 27, 20),
(62, 'Caruara', 'Queimados', 1, '17:40:15', '17:40:38', '2018-09-02', 0, 'Armazem 2', 27, 20),
(63, 'Caruara', 'Mofados', 1, '17:40:15', '17:40:38', '2018-09-02', 0, 'Armazem 2', 27, 20),
(64, 'Caruara', 'Esverdeados', 1, '17:40:15', '17:40:38', '2018-09-02', 0, 'Armazem 2', 27, 20),
(65, 'Caruara', 'Partidos, Queimados e Amassados', 0, '17:40:15', '17:40:38', '2018-09-02', 0, 'Armazem 2', 27, 20),
(66, 'Caruara', 'Materias Estranhas e Impurezas', 1, '17:40:15', '17:40:38', '2018-09-02', 0, 'Armazem 2', 27, 20),
(67, 'Caruara', 'Avariados e Ardidos', 1, '17:42:19', '20:45:30', '2018-09-02', 0, 'Armazem 2', 28, 12),
(68, 'Caruara', 'Graos Quebrados', 1, '17:42:19', '20:45:30', '2018-09-02', 0, 'Armazem 2', 28, 15),
(69, 'Caruara', 'Impurezas', 1, '17:42:19', '20:45:30', '2018-09-02', 0, 'Armazem 2', 28, 16),
(70, 'Caruara', 'Carunchado', 1, '17:42:19', '20:45:30', '2018-09-02', 0, 'Armazem 2', 28, 14),
(71, 'Caruara', 'Ardidos e Queimados', 1, '17:47:45', '20:46:04', '2018-09-02', 0, 'Armazem 2', 29, 10),
(72, 'Caruara', 'Queimados', 1, '17:47:45', '20:46:04', '2018-09-02', 0, 'Armazem 2', 29, 50),
(73, 'Caruara', 'Mofados', 1, '17:47:45', '20:46:04', '2018-09-02', 0, 'Armazem 2', 29, 21),
(74, 'Caruara', 'Esverdeados', 1, '17:47:45', '20:46:04', '2018-09-02', 0, 'Armazem 2', 29, 30),
(75, 'Caruara', 'Partidos, Queimados e Amassados', 1, '17:47:45', '20:46:04', '2018-09-02', 0, 'Armazem 2', 29, 49),
(76, 'Caruara', 'Materias Estranhas e Impurezas', 1, '17:47:45', '20:46:04', '2018-09-02', 0, 'Armazem 2', 29, 23),
(77, 'Caruara', 'Ardidos e Queimados', 1, '10:36:10', '10:36:38', '2018-09-11', 0, 'Armazem 2', 30, 87),
(78, 'Caruara', 'Queimados', 1, '10:36:10', '10:36:39', '2018-09-11', 0, 'Armazem 2', 30, 23),
(79, 'Caruara', 'Mofados', 1, '10:36:10', '10:36:39', '2018-09-11', 0, 'Armazem 2', 30, 32),
(80, 'Caruara', 'Esverdeados', 1, '10:36:10', '10:36:38', '2018-09-11', 0, 'Armazem 2', 30, 12),
(81, 'Caruara', 'Partidos, Queimados e Amassados', 0, '10:36:10', '10:36:39', '2018-09-11', 0, 'Armazem 2', 30, 23),
(82, 'Caruara', 'Materias Estranhas e Impurezas', 1, '10:36:10', '10:36:39', '2018-09-11', 0, 'Armazem 2', 30, 32),
(83, 'Caruara', 'Avariados e Ardidos', NULL, '21:04:26', NULL, '2018-09-19', 0, NULL, 31, NULL),
(84, 'Caruara', 'Graos Quebrados', NULL, '21:04:26', NULL, '2018-09-19', 0, NULL, 31, NULL),
(85, 'Caruara', 'Impurezas', NULL, '21:04:26', NULL, '2018-09-19', 0, NULL, 31, NULL),
(86, 'Caruara', 'Carunchado', NULL, '21:04:26', NULL, '2018-09-19', 0, NULL, 31, NULL),
(87, 'Caruara', 'Ardidos e Queimados', NULL, '21:41:48', NULL, '2018-09-19', 0, NULL, 32, NULL),
(88, 'Caruara', 'Queimados', NULL, '21:41:48', NULL, '2018-09-19', 0, NULL, 32, NULL),
(89, 'Caruara', 'Mofados', NULL, '21:41:48', NULL, '2018-09-19', 0, NULL, 32, NULL),
(90, 'Caruara', 'Esverdeados', NULL, '21:41:48', NULL, '2018-09-19', 0, NULL, 32, NULL),
(91, 'Caruara', 'Partidos, Queimados e Amassados', NULL, '21:41:48', NULL, '2018-09-19', 0, NULL, 32, NULL),
(92, 'Caruara', 'Materias Estranhas e Impurezas', NULL, '21:41:48', NULL, '2018-09-19', 0, NULL, 32, NULL),
(93, 'Caruara', 'Avariados e Ardidos', NULL, '21:43:33', NULL, '2018-09-19', 0, NULL, 33, NULL),
(94, 'Caruara', 'Graos Quebrados', NULL, '21:43:33', NULL, '2018-09-19', 0, NULL, 33, NULL),
(95, 'Caruara', 'Impurezas', NULL, '21:43:33', NULL, '2018-09-19', 0, NULL, 33, NULL),
(96, 'Caruara', 'Carunchado', NULL, '21:43:33', NULL, '2018-09-19', 0, NULL, 33, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carac_graos`
--

CREATE TABLE `carac_graos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `grao_fk` varchar(30) DEFAULT NULL,
  `taxa_minima` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `carac_graos`
--

INSERT INTO `carac_graos` (`id`, `nome`, `grao_fk`, `taxa_minima`, `total`) VALUES
(1, 'Avariados e Ardidos', 'milho', 2, 10),
(2, 'Graos Quebrados', 'milho', 4, 10),
(3, 'Impurezas', 'milho', 2, 10),
(4, 'Carunchado', 'milho', 3, 10),
(5, 'Ardidos e Queimados', 'soja', 4, 8),
(6, 'Queimados', 'soja', 1, 8),
(7, 'Mofados', 'soja', 6, 8),
(8, 'Esverdeados', 'soja', 8, 8),
(9, 'Partidos, Queimados e Amassados', 'soja', 30, 8),
(10, 'Materias Estranhas e Impurezas', 'soja', 1, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `nome` varchar(20) NOT NULL
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

CREATE TABLE `escala_gravidade` (
  `nome` varchar(35) NOT NULL
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

CREATE TABLE `estado_analise` (
  `nome` varchar(30) NOT NULL
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
('Nova analise'),
('OCR'),
('Pedido CCO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `graos`
--

CREATE TABLE `graos` (
  `nome` varchar(30) NOT NULL
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

CREATE TABLE `info_cargas` (
  `id_carga` int(11) NOT NULL,
  `grao` varchar(30) DEFAULT NULL,
  `fornecedor` varchar(50) DEFAULT NULL,
  `destino` varchar(50) DEFAULT NULL,
  `data_chegada` date DEFAULT NULL,
  `hora_chegada` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `placa` varchar(20) NOT NULL,
  `estado_fk` varchar(30) DEFAULT 'OCR',
  `resultado_analise` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `info_cargas`
--

INSERT INTO `info_cargas` (`id_carga`, `grao`, `fornecedor`, `destino`, `data_chegada`, `hora_chegada`, `hora_termino`, `placa`, `estado_fk`, `resultado_analise`) VALUES
(17, 'Soja', 'Fazenda dos Grãos', 'Taiwan', '2018-08-19', '14:15:11', '03:34:48', 'FYM-6482', 'Finalizado', 'Aprovado'),
(18, 'Soja', 'Fazendeiros Tabajara', 'Santos', '2018-08-19', '14:15:26', '03:40:14', 'AOS-2385', 'Finalizado', 'Aprovado'),
(19, 'Milho', 'Granolandia', 'Guaruja', '2018-08-19', '14:15:43', '03:39:48', 'SQI-9187', 'Finalizado', 'Aprovado'),
(20, 'Milho', 'Fazenda dos Grãos', 'Taiwan', '2018-08-23', '03:56:58', '03:57:15', 'OIJ-7793', 'Finalizado', 'Aprovado'),
(23, 'Milho', 'Fazendeiros Tabajara', 'Taiwan', '2018-08-23', '18:50:07', '17:23:36', 'SKL-7070', 'Finalizado', 'Reprovado'),
(24, 'Soja', 'Granolandia', 'São Vicente', '2018-09-01', '07:41:11', '07:41:41', 'SKL-1408', 'Finalizado', 'Aprovado'),
(25, 'Milho', 'MM Grãos', 'Guaruja', '2018-09-02', '17:26:13', '13:39:59', 'FYM-9077', 'Finalizado', 'Aprovado'),
(26, 'Milho', 'Fazendeiros Tabajara', 'São Vicente', '2018-09-02', '17:37:00', NULL, 'JUI-4042', 'CCO', NULL),
(27, 'Soja', 'Fazenda dos Grãos', 'Japão', '2018-09-02', '17:39:50', '10:35:24', 'SQI-6231', 'Guarda', 'Reprovado'),
(28, 'Milho', 'Moinho Paulista', 'São Paulo', '2018-09-02', '17:42:15', '20:55:05', 'SQI-2303', 'Guarda', 'Reprovado'),
(29, 'Soja', 'Fazendeiros Tabajara', 'Japão', '2018-09-02', '17:47:40', '20:54:15', 'FWH-3791', 'Finalizado', 'Reprovado'),
(30, 'Soja', 'Granolandia', 'Santos', '2018-09-11', '10:36:02', '10:38:02', '0WA-6222', 'Guarda', 'Reprovado'),
(31, 'Milho', 'Fazendeiros Tabajara', 'Taiwan', '2018-09-17', '14:02:10', NULL, 'OSJ-7053', 'Analista', NULL),
(32, 'Soja', 'Fazendeiros Tabajara', 'São Vicente', '2018-09-17', '14:02:13', NULL, 'YQ8-2455', 'Analista', NULL),
(33, 'Milho', 'Fazenda dos Grãos', 'Japão', '2018-09-17', '14:02:28', NULL, 'JUI-3604', 'Analista', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs_func`
--

CREATE TABLE `logs_func` (
  `id` int(11) NOT NULL,
  `id_usuario` varchar(100) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `data` date DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(21, 'Mauro', 1, '21:43:14', '2018-08-08', 'ANALISTA DE GRAOS'),
(22, 'Mauro', 0, '17:00:26', '2018-08-09', 'ANALISTA DE GRAOS'),
(23, 'Mauro', 1, '17:00:35', '2018-08-09', 'ANALISTA DE GRAOS'),
(24, 'Mauro', 1, '01:07:41', '2018-08-10', 'ANALISTA DE GRAOS'),
(25, 'Mauro', 0, '01:17:29', '2018-08-10', 'ANALISTA DE GRAOS'),
(26, 'Nicholas', 1, '01:17:52', '2018-08-10', 'CCO'),
(27, 'Nicholas', 0, '01:18:04', '2018-08-10', 'CCO'),
(28, 'Mauro', 0, '01:18:20', '2018-08-10', 'ANALISTA DE GRAOS'),
(29, 'Mauro', 1, '01:18:28', '2018-08-10', 'ANALISTA DE GRAOS'),
(30, 'Marcos', 1, '22:40:53', '2018-08-16', 'CCO'),
(31, 'Marcos', 0, '22:40:55', '2018-08-16', 'CCO'),
(32, 'Caruara', 1, '22:41:01', '2018-08-16', 'ANALISTA DE GRAOS'),
(33, 'Caruara', 0, '22:41:06', '2018-08-16', 'ANALISTA DE GRAOS'),
(34, 'Eduardo', 1, '22:41:10', '2018-08-16', 'GUARDA'),
(35, 'Eduardo', 0, '22:41:13', '2018-08-16', 'GUARDA'),
(36, 'Mauro', 1, '22:58:24', '2018-08-16', 'ANALISTA DE GRAOS'),
(37, 'Mauro', 0, '23:02:03', '2018-08-16', 'ANALISTA DE GRAOS'),
(38, 'Mauro', 1, '23:02:18', '2018-08-16', 'ANALISTA DE GRAOS'),
(39, 'Mauro', 0, '23:03:08', '2018-08-16', 'ANALISTA DE GRAOS'),
(40, 'Mauro', 1, '23:03:16', '2018-08-16', 'ANALISTA DE GRAOS'),
(41, 'Mauro', 0, '23:03:31', '2018-08-16', 'ANALISTA DE GRAOS'),
(42, 'Mauro', 1, '23:13:05', '2018-08-16', 'ANALISTA DE GRAOS'),
(43, 'Mauro', 0, '23:24:40', '2018-08-16', 'ANALISTA DE GRAOS'),
(44, 'Eduardo', 1, '23:24:49', '2018-08-16', 'GUARDA'),
(45, 'Eduardo', 0, '23:24:51', '2018-08-16', 'GUARDA'),
(46, 'Nicholas', 1, '23:38:39', '2018-08-16', 'CCO'),
(47, 'Nicholas', 0, '00:14:07', '2018-08-17', 'CCO'),
(48, 'Mauro', 1, '00:14:12', '2018-08-17', 'ANALISTA DE GRAOS'),
(49, 'Mauro', 0, '00:46:20', '2018-08-17', 'ANALISTA DE GRAOS'),
(50, 'Nicholas', 1, '00:46:27', '2018-08-17', 'CCO'),
(51, 'Nicholas', 0, '00:53:01', '2018-08-17', 'CCO'),
(52, 'Caruara', 1, '00:53:24', '2018-08-17', 'ANALISTA DE GRAOS'),
(53, 'Caruara', 0, '01:56:10', '2018-08-17', 'ANALISTA DE GRAOS'),
(54, 'Nicholas', 1, '01:56:15', '2018-08-17', 'CCO'),
(55, 'Nicholas', 0, '01:56:28', '2018-08-17', 'CCO'),
(56, 'Jessica', 1, '01:56:52', '2018-08-17', 'ANALISTA DE GRAOS'),
(57, 'Jessica', 0, '01:57:17', '2018-08-17', 'ANALISTA DE GRAOS'),
(58, 'Nicholas', 1, '18:46:51', '2018-08-18', 'CCO'),
(59, 'Nicholas', 0, '18:49:02', '2018-08-18', 'CCO'),
(60, 'Nicholas', 1, '18:49:09', '2018-08-18', 'CCO'),
(61, 'Nicholas', 0, '19:39:31', '2018-08-18', 'CCO'),
(62, 'Nicholas', 1, '19:40:09', '2018-08-18', 'CCO'),
(63, 'Nicholas', 0, '19:40:42', '2018-08-18', 'CCO'),
(64, 'Caruara', 1, '19:40:53', '2018-08-18', 'ANALISTA DE GRAOS'),
(65, 'Caruara', 1, '07:27:48', '2018-08-19', 'ANALISTA DE GRAOS'),
(66, 'Caruara', 1, '07:58:50', '2018-08-19', 'ANALISTA DE GRAOS'),
(67, 'Caruara', 1, '08:09:25', '2018-08-19', 'ANALISTA DE GRAOS'),
(68, 'Caruara', 1, '08:10:34', '2018-08-19', 'ANALISTA DE GRAOS'),
(69, 'Caruara', 1, '08:14:22', '2018-08-19', 'ANALISTA DE GRAOS'),
(70, 'Caruara', 0, '17:38:52', '2018-08-19', 'ANALISTA DE GRAOS'),
(71, 'Nicholas', 1, '17:38:58', '2018-08-19', 'CCO'),
(72, 'Nicholas', 0, '17:39:52', '2018-08-19', 'CCO'),
(73, 'Eduardo', 1, '17:39:58', '2018-08-19', 'GUARDA'),
(74, 'Eduardo', 0, '17:40:17', '2018-08-19', 'GUARDA'),
(75, 'Caruara', 0, '09:49:53', '2018-08-21', 'ANALISTA DE GRAOS'),
(76, 'Nicholas', 1, '10:02:47', '2018-08-21', 'CCO'),
(77, 'Nicholas', 1, '10:07:51', '2018-08-21', 'CCO'),
(78, 'Caruara', 1, '22:20:50', '2018-08-21', 'ANALISTA DE GRAOS'),
(79, 'Caruara', 0, '23:39:22', '2018-08-21', 'ANALISTA DE GRAOS'),
(80, 'Mauro', 1, '23:39:29', '2018-08-21', 'ANALISTA DE GRAOS'),
(81, 'Mauro', 1, '00:19:21', '2018-08-23', 'ANALISTA DE GRAOS'),
(82, 'Mauro', 0, '03:47:04', '2018-08-23', 'ANALISTA DE GRAOS'),
(83, 'Nicholas', 1, '03:47:10', '2018-08-23', 'CCO'),
(84, 'Caruara', 1, '03:56:52', '2018-08-23', 'ANALISTA DE GRAOS'),
(85, 'Mauro', 1, '05:15:08', '2018-08-23', 'ANALISTA DE GRAOS'),
(86, 'Mauro', 0, '05:15:33', '2018-08-23', 'ANALISTA DE GRAOS'),
(87, 'Nicholas', 1, '05:15:40', '2018-08-23', 'CCO'),
(88, 'Nicholas', 0, '05:22:42', '2018-08-23', 'CCO'),
(89, 'Caruara', 1, '05:22:49', '2018-08-23', 'ANALISTA DE GRAOS'),
(90, 'Caruara', 0, '05:23:06', '2018-08-23', 'ANALISTA DE GRAOS'),
(91, 'Nicholas', 1, '05:50:36', '2018-08-23', 'CCO'),
(92, 'Nicholas', 1, '08:05:39', '2018-08-23', 'CCO'),
(93, 'Nicholas', 0, '08:10:34', '2018-08-23', 'CCO'),
(94, 'Mauro', 1, '08:10:46', '2018-08-23', 'ANALISTA DE GRAOS'),
(95, 'Mauro', 0, '08:11:00', '2018-08-23', 'ANALISTA DE GRAOS'),
(96, 'Caruara', 1, '08:11:22', '2018-08-23', 'ANALISTA DE GRAOS'),
(97, 'Caruara', 0, '08:12:07', '2018-08-23', 'ANALISTA DE GRAOS'),
(98, 'Eduardo', 1, '08:12:18', '2018-08-23', 'GUARDA'),
(99, 'Eduardo', 0, '08:12:36', '2018-08-23', 'GUARDA'),
(100, 'Mauro', 1, '08:12:52', '2018-08-23', 'ANALISTA DE GRAOS'),
(101, 'Mauro', 0, '08:13:15', '2018-08-23', 'ANALISTA DE GRAOS'),
(102, 'Jessica', 1, '08:13:27', '2018-08-23', 'ANALISTA DE GRAOS'),
(103, 'Jessica', 0, '08:13:35', '2018-08-23', 'ANALISTA DE GRAOS'),
(104, 'Nicholas', 1, '08:13:44', '2018-08-23', 'CCO'),
(105, 'Nicholas', 0, '08:16:53', '2018-08-23', 'CCO'),
(106, 'Caruara', 1, '08:17:00', '2018-08-23', 'ANALISTA DE GRAOS'),
(107, 'Caruara', 0, '08:17:09', '2018-08-23', 'ANALISTA DE GRAOS'),
(108, 'Jessica', 1, '08:17:19', '2018-08-23', 'ANALISTA DE GRAOS'),
(109, 'Jessica', 0, '08:17:36', '2018-08-23', 'ANALISTA DE GRAOS'),
(110, 'Jessica', 0, '08:17:37', '2018-08-23', 'ANALISTA DE GRAOS'),
(111, 'Caruara', 1, '08:18:21', '2018-08-23', 'ANALISTA DE GRAOS'),
(112, 'Caruara', 0, '08:18:25', '2018-08-23', 'ANALISTA DE GRAOS'),
(113, 'Eduardo', 1, '08:18:32', '2018-08-23', 'GUARDA'),
(114, 'Eduardo', 0, '08:19:19', '2018-08-23', 'GUARDA'),
(115, 'Jessica', 1, '08:19:28', '2018-08-23', 'ANALISTA DE GRAOS'),
(116, 'Jessica', 0, '08:21:55', '2018-08-23', 'ANALISTA DE GRAOS'),
(117, 'Caruara', 1, '08:22:33', '2018-08-23', 'ANALISTA DE GRAOS'),
(118, 'Caruara', 0, '08:22:38', '2018-08-23', 'ANALISTA DE GRAOS'),
(119, 'Mauro', 1, '08:22:53', '2018-08-23', 'ANALISTA DE GRAOS'),
(120, 'Mauro', 0, '08:22:58', '2018-08-23', 'ANALISTA DE GRAOS'),
(121, 'Nicholas', 1, '08:25:36', '2018-08-23', 'CCO'),
(122, 'Nicholas', 0, '09:20:45', '2018-08-23', 'CCO'),
(123, 'Caruara', 1, '18:42:36', '2018-08-23', 'ANALISTA DE GRAOS'),
(124, 'Caruara', 1, '18:42:58', '2018-08-23', 'ANALISTA DE GRAOS'),
(125, 'Caruara', 1, '18:43:19', '2018-08-23', 'ANALISTA DE GRAOS'),
(126, 'Caruara', 1, '18:43:57', '2018-08-23', 'ANALISTA DE GRAOS'),
(127, 'Caruara', 0, '18:54:59', '2018-08-23', 'ANALISTA DE GRAOS'),
(128, 'Nicholas', 1, '18:55:04', '2018-08-23', 'CCO'),
(129, 'Nicholas', 0, '19:31:22', '2018-08-23', 'CCO'),
(130, 'Nicholas', 1, '19:31:28', '2018-08-23', 'CCO'),
(131, 'Nicholas', 1, '21:42:44', '2018-08-28', 'CCO'),
(132, 'Nicholas', 0, '07:40:54', '2018-09-01', 'CCO'),
(133, 'Caruara', 1, '07:41:03', '2018-09-01', 'ANALISTA DE GRAOS'),
(134, 'Caruara', 0, '07:49:37', '2018-09-01', 'ANALISTA DE GRAOS'),
(135, 'Nicholas', 1, '07:49:43', '2018-09-01', 'CCO'),
(136, 'Nicholas', 1, '19:51:18', '2018-09-01', 'CCO'),
(137, 'Eduardo', 1, '20:16:46', '2018-09-01', 'GUARDA'),
(138, 'Eduardo', 0, '07:54:01', '2018-09-02', 'GUARDA'),
(139, 'Eduardo', 1, '07:57:51', '2018-09-02', 'GUARDA'),
(140, 'Eduardo', 0, '07:58:02', '2018-09-02', 'GUARDA'),
(141, 'Eduardo', 1, '07:58:09', '2018-09-02', 'GUARDA'),
(142, 'Eduardo', 0, '07:58:16', '2018-09-02', 'GUARDA'),
(143, 'Lara', 1, '07:58:29', '2018-09-02', 'GUARDA'),
(144, 'Lara', 0, '07:59:53', '2018-09-02', 'GUARDA'),
(145, 'Eduardo', 1, '08:03:23', '2018-09-02', 'GUARDA'),
(146, 'Eduardo', 0, '08:03:58', '2018-09-02', 'GUARDA'),
(147, 'Eduardo', 1, '08:04:38', '2018-09-02', 'GUARDA'),
(148, 'Eduardo', 0, '08:10:39', '2018-09-02', 'GUARDA'),
(149, 'Lara', 1, '08:10:53', '2018-09-02', 'GUARDA'),
(150, 'Lara', 0, '08:10:58', '2018-09-02', 'GUARDA'),
(151, 'Mauricio', 1, '08:11:05', '2018-09-02', 'GUARDA'),
(152, 'Mauricio', 0, '08:11:09', '2018-09-02', 'GUARDA'),
(153, 'Eduardo', 1, '08:31:53', '2018-09-02', 'GUARDA'),
(154, 'Eduardo', 0, '09:08:31', '2018-09-02', 'GUARDA'),
(155, 'Nicholas', 1, '15:59:20', '2018-09-02', 'CCO'),
(156, 'Nicholas', 0, '16:00:27', '2018-09-02', 'CCO'),
(157, 'Nicholas', 0, '16:00:28', '2018-09-02', 'CCO'),
(158, 'Nicholas', 1, '16:00:33', '2018-09-02', 'CCO'),
(159, 'Eduardo', 1, '16:00:38', '2018-09-02', 'GUARDA'),
(160, 'Eduardo', 0, '17:26:00', '2018-09-02', 'GUARDA'),
(161, 'Caruara', 1, '17:26:04', '2018-09-02', 'ANALISTA DE GRAOS'),
(162, 'Caruara', 0, '22:23:03', '2018-09-02', 'ANALISTA DE GRAOS'),
(163, 'Eduardo', 1, '22:23:15', '2018-09-02', 'GUARDA'),
(164, 'Eduardo', 1, '16:47:21', '2018-09-07', 'GUARDA'),
(165, 'Eduardo', 0, '19:17:28', '2018-09-07', 'GUARDA'),
(166, 'Caruara', 1, '19:17:38', '2018-09-07', 'ANALISTA DE GRAOS'),
(167, 'Caruara', 0, '19:17:54', '2018-09-07', 'ANALISTA DE GRAOS'),
(168, 'Jessica', 1, '19:17:59', '2018-09-07', 'ANALISTA DE GRAOS'),
(169, 'Jessica', 0, '19:18:03', '2018-09-07', 'ANALISTA DE GRAOS'),
(170, 'Nicholas', 1, '19:18:10', '2018-09-07', 'CCO'),
(171, 'Nicholas', 0, '19:18:56', '2018-09-07', 'CCO'),
(172, 'Mauricio', 1, '19:19:22', '2018-09-07', 'GUARDA'),
(173, 'Mauricio', 0, '19:30:24', '2018-09-07', 'GUARDA'),
(174, 'Eduardo', 1, '19:30:29', '2018-09-07', 'GUARDA'),
(175, 'Nicholas', 0, '23:09:12', '2018-09-07', 'CCO'),
(176, 'Caruara', 1, '23:09:17', '2018-09-07', 'ANALISTA DE GRAOS'),
(177, 'Caruara', 0, '23:09:20', '2018-09-07', 'ANALISTA DE GRAOS'),
(178, 'Eduardo', 1, '23:09:25', '2018-09-07', 'GUARDA'),
(179, 'Eduardo', 0, '23:09:37', '2018-09-07', 'GUARDA'),
(180, 'Lara', 1, '23:09:41', '2018-09-07', 'GUARDA'),
(181, 'Nicholas', 1, '23:10:16', '2018-09-07', 'CCO'),
(182, 'Eduardo', 0, '23:12:29', '2018-09-07', 'GUARDA'),
(183, 'Eduardo', 1, '23:12:34', '2018-09-07', 'GUARDA'),
(184, 'Lara', 0, '23:41:43', '2018-09-07', 'GUARDA'),
(185, 'Eduardo', 0, '09:56:59', '2018-09-08', 'GUARDA'),
(186, 'Nicholas', 1, '10:29:48', '2018-09-08', 'CCO'),
(187, 'Nicholas', 0, '10:29:56', '2018-09-08', 'CCO'),
(188, 'Nicholas', 1, '10:30:04', '2018-09-08', 'CCO'),
(189, 'Lara', 1, '10:39:05', '2018-09-08', 'GUARDA'),
(190, 'Lara', 0, '10:48:13', '2018-09-08', 'GUARDA'),
(191, 'Eduardo', 1, '16:54:54', '2018-09-08', 'GUARDA'),
(192, 'Eduardo', 0, '16:55:43', '2018-09-08', 'GUARDA'),
(193, 'Lara', 1, '16:55:57', '2018-09-08', 'GUARDA'),
(194, 'Lara', 0, '18:02:13', '2018-09-08', 'GUARDA'),
(195, 'Eduardo', 1, '18:03:40', '2018-09-08', 'GUARDA'),
(196, 'Eduardo', 0, '18:03:53', '2018-09-08', 'GUARDA'),
(197, 'Eduardo', 1, '18:09:48', '2018-09-08', 'GUARDA'),
(198, 'Eduardo', 0, '18:11:04', '2018-09-08', 'GUARDA'),
(199, 'Eduardo', 1, '18:28:56', '2018-09-08', 'GUARDA'),
(200, 'Eduardo', 0, '18:29:03', '2018-09-08', 'GUARDA'),
(201, 'Eduardo', 1, '18:30:27', '2018-09-08', 'GUARDA'),
(202, 'Eduardo', 0, '18:30:58', '2018-09-08', 'GUARDA'),
(203, 'Eduardo', 1, '18:31:33', '2018-09-08', 'GUARDA'),
(204, 'Eduardo', 0, '18:31:42', '2018-09-08', 'GUARDA'),
(205, 'Eduardo', 1, '18:32:13', '2018-09-08', 'GUARDA'),
(206, 'Eduardo', 0, '18:32:49', '2018-09-08', 'GUARDA'),
(207, 'Eduardo', 1, '06:01:27', '2018-09-09', 'GUARDA'),
(208, 'Eduardo', 0, '06:15:11', '2018-09-09', 'GUARDA'),
(209, 'Eduardo', 1, '06:32:37', '2018-09-09', 'GUARDA'),
(210, 'Eduardo', 0, '06:32:44', '2018-09-09', 'GUARDA'),
(211, 'Lara', 1, '06:33:09', '2018-09-09', 'GUARDA'),
(212, 'Lara', 0, '06:34:28', '2018-09-09', 'GUARDA'),
(213, 'Lara', 1, '06:35:54', '2018-09-09', 'GUARDA'),
(214, 'Lara', 0, '06:36:20', '2018-09-09', 'GUARDA'),
(215, 'Mauricio', 1, '06:45:04', '2018-09-09', 'GUARDA'),
(216, 'Mauricio', 0, '06:45:19', '2018-09-09', 'GUARDA'),
(217, 'Mauricio', 1, '06:45:59', '2018-09-09', 'GUARDA'),
(218, 'Mauricio', 0, '06:46:06', '2018-09-09', 'GUARDA'),
(219, 'Mauricio', 1, '06:46:56', '2018-09-09', 'GUARDA'),
(220, 'Mauricio', 0, '06:47:02', '2018-09-09', 'GUARDA'),
(221, 'Lara', 1, '06:47:47', '2018-09-09', 'GUARDA'),
(222, 'Lara', 0, '06:47:51', '2018-09-09', 'GUARDA'),
(223, 'Lara', 1, '06:51:48', '2018-09-09', 'GUARDA'),
(224, 'Lara', 0, '06:51:58', '2018-09-09', 'GUARDA'),
(225, 'Eduardo', 1, '06:56:29', '2018-09-09', 'GUARDA'),
(226, 'Eduardo', 0, '06:56:41', '2018-09-09', 'GUARDA'),
(227, 'Lara', 1, '07:25:15', '2018-09-09', 'GUARDA'),
(228, 'Lara', 0, '07:25:30', '2018-09-09', 'GUARDA'),
(229, 'Lara', 1, '07:25:56', '2018-09-09', 'GUARDA'),
(230, 'Eduardo', 1, '07:25:57', '2018-09-09', 'GUARDA'),
(231, 'Eduardo', 0, '07:30:16', '2018-09-09', 'GUARDA'),
(232, 'Eduardo', 1, '07:31:54', '2018-09-09', 'GUARDA'),
(233, 'Eduardo', 0, '07:32:18', '2018-09-09', 'GUARDA'),
(234, 'Eduardo', 1, '07:32:39', '2018-09-09', 'GUARDA'),
(235, 'Eduardo', 0, '07:32:45', '2018-09-09', 'GUARDA'),
(236, 'Eduardo', 1, '07:33:29', '2018-09-09', 'GUARDA'),
(237, 'Eduardo', 0, '07:33:42', '2018-09-09', 'GUARDA'),
(238, 'Eduardo', 1, '07:35:02', '2018-09-09', 'GUARDA'),
(239, 'Eduardo', 0, '07:35:29', '2018-09-09', 'GUARDA'),
(240, 'Eduardo', 1, '07:44:27', '2018-09-09', 'GUARDA'),
(241, 'Lara', 0, '07:44:45', '2018-09-09', 'GUARDA'),
(242, 'Lara', 1, '07:48:15', '2018-09-09', 'GUARDA'),
(243, 'Lara', 0, '07:49:15', '2018-09-09', 'GUARDA'),
(244, 'Eduardo', 0, '07:51:15', '2018-09-09', 'GUARDA'),
(245, 'Lara', 1, '07:51:31', '2018-09-09', 'GUARDA'),
(246, 'Eduardo', 1, '12:35:38', '2018-09-09', 'GUARDA'),
(247, 'Eduardo', 0, '12:36:58', '2018-09-09', 'GUARDA'),
(248, 'Eduardo', 1, '12:42:03', '2018-09-09', 'GUARDA'),
(249, 'Eduardo', 0, '12:42:23', '2018-09-09', 'GUARDA'),
(250, 'Eduardo', 1, '12:44:07', '2018-09-09', 'GUARDA'),
(251, 'Eduardo', 0, '12:45:52', '2018-09-09', 'GUARDA'),
(252, 'Lara', 0, '12:46:42', '2018-09-09', 'GUARDA'),
(253, 'Eduardo', 1, '12:46:55', '2018-09-09', 'GUARDA'),
(254, 'Lara', 1, '12:47:02', '2018-09-09', 'GUARDA'),
(255, 'Eduardo', 0, '13:07:30', '2018-09-09', 'GUARDA'),
(256, 'Lara', 0, '13:07:43', '2018-09-09', 'GUARDA'),
(257, 'Eduardo', 1, '13:07:55', '2018-09-09', 'GUARDA'),
(258, 'Eduardo', 0, '13:08:46', '2018-09-09', 'GUARDA'),
(259, 'Lara', 1, '13:08:58', '2018-09-09', 'GUARDA'),
(260, 'Eduardo', 1, '13:10:38', '2018-09-09', 'GUARDA'),
(261, 'Eduardo', 0, '13:10:44', '2018-09-09', 'GUARDA'),
(262, 'Lara', 0, '13:10:47', '2018-09-09', 'GUARDA'),
(263, 'Lara', 1, '13:10:56', '2018-09-09', 'GUARDA'),
(264, 'Mauricio', 1, '13:17:30', '2018-09-09', 'GUARDA'),
(265, 'Lara', 0, '13:17:36', '2018-09-09', 'GUARDA'),
(266, 'Mauricio', 0, '13:17:50', '2018-09-09', 'GUARDA'),
(267, 'Eduardo', 1, '13:20:02', '2018-09-09', 'GUARDA'),
(268, 'Lara', 1, '13:20:09', '2018-09-09', 'GUARDA'),
(269, 'Eduardo', 0, '13:20:11', '2018-09-09', 'GUARDA'),
(270, 'Lara', 0, '13:20:20', '2018-09-09', 'GUARDA'),
(271, 'Eduardo', 1, '13:20:29', '2018-09-09', 'GUARDA'),
(272, 'Mauricio', 1, '13:25:49', '2018-09-09', 'GUARDA'),
(273, 'Mauricio', 0, '13:25:52', '2018-09-09', 'GUARDA'),
(274, 'Eduardo', 0, '13:25:55', '2018-09-09', 'GUARDA'),
(275, 'Eduardo', 1, '13:26:25', '2018-09-09', 'GUARDA'),
(276, 'Eduardo', 0, '13:30:37', '2018-09-09', 'GUARDA'),
(277, 'Mauricio', 1, '13:30:46', '2018-09-09', 'GUARDA'),
(278, 'Lara', 1, '13:31:33', '2018-09-09', 'GUARDA'),
(279, 'Lara', 0, '13:39:58', '2018-09-09', 'GUARDA'),
(280, 'Mauricio', 0, '13:40:04', '2018-09-09', 'GUARDA'),
(281, 'Lara', 1, '13:40:21', '2018-09-09', 'GUARDA'),
(282, 'Lara', 0, '13:43:34', '2018-09-09', 'GUARDA'),
(283, 'Eduardo', 1, '15:46:42', '2018-09-09', 'GUARDA'),
(284, 'Mauricio', 1, '16:04:39', '2018-09-09', 'GUARDA'),
(285, 'Eduardo', 0, '16:04:51', '2018-09-09', 'GUARDA'),
(286, 'Mauricio', 0, '16:05:16', '2018-09-09', 'GUARDA'),
(287, 'Eduardo', 1, '16:07:24', '2018-09-09', 'GUARDA'),
(288, 'Lara', 1, '16:07:32', '2018-09-09', 'GUARDA'),
(289, 'Eduardo', 0, '16:51:00', '2018-09-09', 'GUARDA'),
(290, 'Eduardo', 1, '08:17:02', '2018-09-10', 'GUARDA'),
(291, 'Eduardo', 0, '08:17:46', '2018-09-10', 'GUARDA'),
(292, 'Mauricio', 1, '08:19:12', '2018-09-10', 'GUARDA'),
(293, 'Mauricio', 0, '08:22:48', '2018-09-10', 'GUARDA'),
(294, 'Mauricio', 1, '08:27:24', '2018-09-10', 'GUARDA'),
(295, 'Mauricio', 0, '08:27:53', '2018-09-10', 'GUARDA'),
(296, 'Eduardo', 1, '08:35:16', '2018-09-10', 'GUARDA'),
(297, 'Caruara', 1, '10:00:54', '2018-09-11', 'ANALISTA DE GRAOS'),
(298, 'Caruara', 0, '10:27:00', '2018-09-11', 'ANALISTA DE GRAOS'),
(299, 'Caruara', 1, '10:27:06', '2018-09-11', 'ANALISTA DE GRAOS'),
(300, 'Eduardo', 0, '10:37:26', '2018-09-11', 'GUARDA'),
(301, 'Mauricio', 1, '10:37:33', '2018-09-11', 'GUARDA'),
(302, 'Lara', 0, '16:24:25', '2018-09-15', 'GUARDA'),
(303, 'Eduardo', 1, '16:24:34', '2018-09-15', 'GUARDA'),
(304, 'Eduardo', 0, '16:24:37', '2018-09-15', 'GUARDA'),
(305, 'Nicholas', 1, '16:24:43', '2018-09-15', 'CCO'),
(306, 'Nicholas', 0, '16:25:02', '2018-09-15', 'CCO'),
(307, 'Nicholas', 1, '16:25:08', '2018-09-15', 'CCO'),
(308, 'Mauricio', 1, '16:25:47', '2018-09-15', 'GUARDA'),
(309, 'Mauricio', 0, '16:25:56', '2018-09-15', 'GUARDA'),
(310, 'Eduardo', 1, '16:26:08', '2018-09-15', 'GUARDA'),
(311, 'Eduardo', 0, '16:26:13', '2018-09-15', 'GUARDA'),
(312, 'Eduardo', 1, '16:26:35', '2018-09-15', 'GUARDA'),
(313, 'Eduardo', 0, '16:26:41', '2018-09-15', 'GUARDA'),
(314, 'Lara', 1, '16:26:48', '2018-09-15', 'GUARDA'),
(315, 'Nicholas', 0, '22:50:22', '2018-09-16', 'CCO'),
(316, 'Eduardo', 1, '22:50:27', '2018-09-16', 'GUARDA'),
(317, 'Eduardo', 0, '12:56:27', '2018-09-17', 'GUARDA'),
(318, 'Nicholas', 1, '12:56:32', '2018-09-17', 'CCO'),
(319, 'Nicholas', 0, '14:02:18', '2018-09-17', 'CCO'),
(320, 'Caruara', 1, '14:02:24', '2018-09-17', 'ANALISTA DE GRAOS'),
(321, 'Caruara', 1, '01:49:51', '2018-09-19', 'ANALISTA DE GRAOS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_analise`
--

CREATE TABLE `log_analise` (
  `id` int(11) NOT NULL,
  `n_analises` int(11) DEFAULT NULL,
  `decisao_final` varchar(30) DEFAULT NULL,
  `guarda` varchar(50) DEFAULT NULL,
  `resultado` varchar(30) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  `id_carga_fk` int(11) DEFAULT NULL,
  `grao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `log_analise`
--

INSERT INTO `log_analise` (`id`, `n_analises`, `decisao_final`, `guarda`, `resultado`, `estado`, `id_carga_fk`, `grao`) VALUES
(5, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 17, 'Soja'),
(6, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 19, 'Milho'),
(7, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 18, 'Soja'),
(8, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 20, 'Milho'),
(9, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 24, 'Soja'),
(10, 1, 'CCO', 'Eduardo', 'Reprovado', 'Finalizado', 23, 'Milho'),
(13, 1, 'CCO', 'Eduardo', 'Reprovado', 'Finalizado', 29, 'Soja'),
(14, 1, 'CCO', 'Caruara', 'Reprovado', 'Finalizado', 28, 'Milho'),
(15, 1, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 27, 'Soja'),
(16, 1, 'CCO', 'Mauricio', 'Reprovado', 'Finalizado', 30, 'Soja'),
(17, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 25, 'Milho');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_guarda`
--

CREATE TABLE `pedido_guarda` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_carga_fk` int(11) DEFAULT NULL,
  `cco_responsavel` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_guarda`
--

INSERT INTO `pedido_guarda` (`id`, `nome`, `id_carga_fk`, `cco_responsavel`, `status`) VALUES
(1, 'Eduardo', 23, 'Nicholas', 'Finalizado'),
(2, 'Eduardo', 29, 'Nicholas', 'Finalizado'),
(3, 'Caruara', 28, 'Nicholas', 'Aguardando'),
(4, 'Lara', 27, 'Nicholas', 'Aguardando'),
(5, 'Mauricio', 30, 'Nicholas', 'Aguardando');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `nome` varchar(30) NOT NULL
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

CREATE TABLE `ultimas_analises` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `grao_fk` varchar(30) DEFAULT NULL,
  `resultado_fk` varchar(35) DEFAULT NULL,
  `tempo_de_espera` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` varchar(100) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `nome_completo` varchar(200) DEFAULT NULL,
  `status_atual` varchar(30) DEFAULT 'Offline'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `senha`, `cargo`, `nome_completo`, `status_atual`) VALUES
('Caruara', 'mestra', 'ANALISTA DE GRAOS', 'Anderton Aleluia', 'Online'),
('Eduardo', 'mestra', 'GUARDA', 'Eduardo Portos', 'Offline'),
('Jessica', 'mestra', 'ANALISTA DE GRAOS', 'Jessica Portos', 'Offline'),
('Lara', 'mestra', 'GUARDA', 'Lara Croft', 'Online'),
('Marcos', 'mestra', 'CCO', 'Marcos o CCO', 'Offline'),
('Mauricio', 'mestra', 'GUARDA', 'Mauricio Mendonça', 'Offline'),
('Mauro', 'mestra', 'ANALISTA DE GRAOS', 'Mauro O Analista', 'Offline'),
('Mazzei', 'mestra', 'CCO', 'Mazzei Testando', 'Offline'),
('Nicholas', 'mestra', 'CCO', 'Nicholas Wesley Mazzei', 'Offline');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analise`
--
ALTER TABLE `analise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carga_fk` (`id_carga_fk`);

--
-- Indexes for table `analise_manual`
--
ALTER TABLE `analise_manual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carga_fk` (`id_carga_fk`),
  ADD KEY `analista` (`analista`);

--
-- Indexes for table `carac_graos`
--
ALTER TABLE `carac_graos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grao_fk` (`grao_fk`);

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`nome`);

--
-- Indexes for table `escala_gravidade`
--
ALTER TABLE `escala_gravidade`
  ADD PRIMARY KEY (`nome`);

--
-- Indexes for table `estado_analise`
--
ALTER TABLE `estado_analise`
  ADD PRIMARY KEY (`nome`);

--
-- Indexes for table `graos`
--
ALTER TABLE `graos`
  ADD PRIMARY KEY (`nome`);

--
-- Indexes for table `info_cargas`
--
ALTER TABLE `info_cargas`
  ADD PRIMARY KEY (`id_carga`),
  ADD KEY `grao` (`grao`),
  ADD KEY `estado_fk` (`estado_fk`);

--
-- Indexes for table `logs_func`
--
ALTER TABLE `logs_func`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `cargo` (`cargo`);

--
-- Indexes for table `log_analise`
--
ALTER TABLE `log_analise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedido_guarda`
--
ALTER TABLE `pedido_guarda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`nome`);

--
-- Indexes for table `ultimas_analises`
--
ALTER TABLE `ultimas_analises`
  ADD KEY `id_carga_fk` (`id_carga_fk`),
  ADD KEY `grao_fk` (`grao_fk`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_atual` (`status_atual`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analise`
--
ALTER TABLE `analise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `analise_manual`
--
ALTER TABLE `analise_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `carac_graos`
--
ALTER TABLE `carac_graos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `info_cargas`
--
ALTER TABLE `info_cargas`
  MODIFY `id_carga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `logs_func`
--
ALTER TABLE `logs_func`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `log_analise`
--
ALTER TABLE `log_analise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pedido_guarda`
--
ALTER TABLE `pedido_guarda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `analise_manual`
--
ALTER TABLE `analise_manual`
  ADD CONSTRAINT `analise_manual_ibfk_1` FOREIGN KEY (`id_carga_fk`) REFERENCES `info_cargas` (`id_carga`),
  ADD CONSTRAINT `analise_manual_ibfk_2` FOREIGN KEY (`analista`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `carac_graos`
--
ALTER TABLE `carac_graos`
  ADD CONSTRAINT `carac_graos_ibfk_1` FOREIGN KEY (`grao_fk`) REFERENCES `graos` (`nome`);

--
-- Limitadores para a tabela `info_cargas`
--
ALTER TABLE `info_cargas`
  ADD CONSTRAINT `info_cargas_ibfk_1` FOREIGN KEY (`grao`) REFERENCES `graos` (`nome`),
  ADD CONSTRAINT `info_cargas_ibfk_2` FOREIGN KEY (`estado_fk`) REFERENCES `estado_analise` (`nome`);

--
-- Limitadores para a tabela `logs_func`
--
ALTER TABLE `logs_func`
  ADD CONSTRAINT `logs_func_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `logs_func_ibfk_2` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`nome`);

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
