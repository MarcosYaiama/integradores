-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Ago-2018 às 22:52
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
  `id_carga_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('OCR');

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
  `estado_fk` varchar(30) DEFAULT 'OCR'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(74, 'Eduardo', 0, '17:40:17', '2018-08-19', 'GUARDA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `milho`
--

CREATE TABLE `milho` (
  `id_carga_fk` int(11) DEFAULT NULL,
  `avariados_ardidos` int(11) DEFAULT NULL,
  `quebrados` int(11) DEFAULT NULL,
  `impurezas` int(11) DEFAULT NULL,
  `carunchado` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `Analista` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `estado_analise_manual` varchar(30) DEFAULT 'Aguardando'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `soja`
--

CREATE TABLE `soja` (
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
  `id` int(11) NOT NULL,
  `estado_analise_manual` varchar(30) DEFAULT 'Aguardando'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('Caruara', 'mestra', 'ANALISTA DE GRAOS', 'Anderton Aleluia', 'Offline'),
('Eduardo', 'mestra', 'GUARDA', 'Eduardo Portos', 'Offline'),
('Jessica', 'mestra', 'ANALISTA DE GRAOS', 'Jessica Portos', 'Offline'),
('Lara', 'mestra', 'GUARDA', 'Lara Croft', 'Offline'),
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
-- Indexes for table `milho`
--
ALTER TABLE `milho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carga_fk` (`id_carga_fk`);

--
-- Indexes for table `soja`
--
ALTER TABLE `soja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carga_fk` (`id_carga_fk`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `analise_manual`
--
ALTER TABLE `analise_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carac_graos`
--
ALTER TABLE `carac_graos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `info_cargas`
--
ALTER TABLE `info_cargas`
  MODIFY `id_carga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `logs_func`
--
ALTER TABLE `logs_func`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `milho`
--
ALTER TABLE `milho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soja`
--
ALTER TABLE `soja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
