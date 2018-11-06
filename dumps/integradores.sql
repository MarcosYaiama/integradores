-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Nov-2018 às 14:26
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
(33, 9, 17, 'Milho', '2018-09-17', 32, '14:02:28'),
(26, 2, 13, 'Milho', '2018-09-22', 33, '22:18:34'),
(26, 3, 16, 'Milho', '2018-09-22', 34, '23:56:31'),
(26, 2, 16, 'Milho', '2018-09-22', 35, '23:57:51'),
(26, 3, 13, 'Milho', '2018-09-23', 36, '00:00:12'),
(33, 8, 15, 'Milho', '2018-09-23', 37, '00:10:26'),
(34, 7, 11, 'Soja', '2018-09-23', 38, '00:17:43'),
(26, -1, 13, 'Milho', '2018-09-23', 39, '00:31:45'),
(32, 1, 11, 'Soja', '2018-09-23', 40, '00:33:12'),
(32, 0, 12, 'Soja', '2018-09-23', 41, '00:35:27'),
(26, 1, 17, 'Milho', '2018-09-23', 42, '13:30:29'),
(26, -1, 17, 'Milho', '2018-09-23', 43, '19:34:50'),
(35, 3, 10, 'Soja', '2018-09-23', 44, '20:11:02'),
(33, 11, 16, 'Milho', '2018-09-26', 45, '01:19:05'),
(36, 5, 17, 'Soja', '2018-10-10', 46, '00:55:01'),
(37, 1, 14, 'Milho', '2018-10-10', 47, '00:55:11'),
(37, 2, 14, 'Milho', '2018-10-10', 48, '16:42:19'),
(37, 0, 16, 'Milho', '2018-10-10', 49, '16:52:58'),
(37, 1, 15, 'Milho', '2018-10-10', 50, '16:59:28'),
(38, 3, 16, 'Milho', '2018-10-10', 51, '17:22:34'),
(35, 2, 8, 'Soja', '2018-10-10', 52, '17:24:32'),
(39, 9, 22, 'Soja', '2018-10-16', 53, '12:22:12'),
(37, 3, 16, 'Milho', '2018-10-16', 54, '14:29:38'),
(40, 3, 13, 'Soja', '2018-10-16', 55, '14:40:04'),
(41, 1, 10, 'Soja', '2018-10-19', 56, '05:30:37'),
(42, 5, 17, 'Soja', '2018-10-20', 57, '18:59:19'),
(43, 7, 13, 'Milho', '2018-10-21', 58, '06:40:01'),
(44, 0, 11, 'Milho', '2018-10-21', 59, '06:40:06'),
(45, 3, 22, 'Milho', '2018-10-21', 60, '08:03:58'),
(40, 3, 12, 'Soja', '2018-10-21', 61, '08:06:15'),
(41, -1, 10, 'Soja', '2018-10-21', 62, '08:12:40'),
(45, 4, 23, 'Milho', '2018-10-21', 63, '08:14:25'),
(42, 3, 19, 'Soja', '2018-10-21', 64, '08:17:09'),
(42, 4, 19, 'Soja', '2018-10-21', 65, '08:18:40'),
(42, 3, 18, 'Soja', '2018-10-21', 66, '08:29:46'),
(45, 3, 22, 'Milho', '2018-10-21', 67, '08:30:41'),
(45, 4, 23, 'Milho', '2018-10-21', 68, '15:06:50'),
(45, 1, 20, 'Milho', '2018-10-21', 69, '15:08:24'),
(45, 5, 20, 'Milho', '2018-10-21', 70, '15:27:03'),
(45, 4, 20, 'Milho', '2018-10-21', 71, '15:32:55'),
(45, 3, 20, 'Milho', '2018-10-21', 72, '15:33:25'),
(45, 2, 24, 'Milho', '2018-10-21', 73, '15:34:58'),
(45, 2, 23, 'Milho', '2018-10-21', 74, '15:36:59'),
(45, 5, 23, 'Milho', '2018-10-21', 75, '15:38:02'),
(45, 5, 23, 'Milho', '2018-10-21', 76, '15:38:48'),
(46, 2, 20, 'Milho', '2018-10-21', 77, '15:45:46'),
(46, 0, 21, 'Milho', '2018-10-21', 78, '15:46:11'),
(45, 2, 20, 'Milho', '2018-10-21', 79, '16:00:19'),
(45, 5, 21, 'Milho', '2018-10-21', 80, '16:00:56'),
(45, 4, 21, 'Milho', '2018-10-21', 81, '16:10:35'),
(46, 2, 22, 'Milho', '2018-10-27', 82, '22:28:21'),
(46, 1, 19, 'Milho', '2018-10-27', 83, '22:29:29'),
(47, 8, 13, 'Soja', '2018-10-27', 84, '22:46:58'),
(45, 1, 21, 'Milho', '2018-10-27', 85, '22:52:12'),
(48, 9, 17, 'Soja', '2018-10-27', 86, '22:52:34'),
(49, 3, 22, 'Milho', '2018-10-27', 87, '22:54:06'),
(49, 3, 22, 'Milho', '2018-10-27', 88, '22:54:26'),
(50, 7, 14, 'Soja', '2018-10-27', 89, '22:55:21'),
(49, 3, 24, 'Milho', '2018-10-27', 90, '23:02:26'),
(48, 9, 17, 'Soja', '2018-10-27', 91, '23:04:15'),
(45, 3, 24, 'Milho', '2018-10-27', 92, '23:05:18'),
(46, 4, 22, 'Milho', '2018-10-27', 93, '23:06:51'),
(45, 1, 23, 'Milho', '2018-10-27', 94, '23:07:26'),
(45, 5, 22, 'Milho', '2018-10-27', 95, '23:13:05'),
(46, 2, 21, 'Milho', '2018-10-27', 96, '23:13:53'),
(48, 9, 16, 'Soja', '2018-10-27', 97, '23:17:33'),
(51, 5, 14, 'Milho', '2018-11-04', 98, '18:16:29'),
(52, 7, 22, 'Soja', '2018-11-05', 99, '02:50:13'),
(53, 0, 20, 'Soja', '2018-11-05', 100, '03:02:57'),
(54, 1, 14, 'Milho', '2018-11-05', 101, '03:36:16'),
(55, 10, 18, 'Soja', '2018-11-05', 102, '03:44:04'),
(56, 3, 18, 'Soja', '2018-11-05', 103, '03:44:10'),
(57, 6, 21, 'Soja', '2018-11-05', 104, '03:44:14'),
(58, 10, 15, 'Milho', '2018-11-05', 105, '03:44:17'),
(59, 8, 12, 'Soja', '2018-11-05', 106, '03:59:05'),
(60, 10, 22, 'Soja', '2018-11-05', 107, '03:59:28'),
(61, 6, 13, 'Soja', '2018-11-05', 108, '03:59:57'),
(62, 5, 18, 'Milho', '2018-11-05', 109, '04:00:15'),
(63, 6, 19, 'Soja', '2018-11-05', 110, '04:01:50'),
(64, 0, 19, 'Soja', '2018-11-05', 111, '04:02:43'),
(65, 7, 13, 'Soja', '2018-11-05', 112, '04:03:34'),
(66, 2, 16, 'Milho', '2018-11-05', 113, '04:09:25'),
(66, 3, 15, 'Milho', '2018-11-06', 114, '00:17:58'),
(66, 0, 17, 'Milho', '2018-11-06', 115, '00:19:54');

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
(83, 'Caruara', 'Avariados e Ardidos', 1, '21:04:26', '00:32:34', '2018-09-19', 0, 'Armazem 1', 31, 5),
(84, 'Caruara', 'Graos Quebrados', 1, '21:04:26', '00:32:35', '2018-09-19', 0, 'Armazem 1', 31, 5),
(85, 'Caruara', 'Impurezas', 1, '21:04:26', '00:32:35', '2018-09-19', 0, 'Armazem 1', 31, 5),
(86, 'Caruara', 'Carunchado', 1, '21:04:26', '00:32:34', '2018-09-19', 0, 'Armazem 1', 31, 5),
(87, 'Caruara', 'Ardidos e Queimados', 1, '21:41:48', '00:32:55', '2018-09-19', 0, 'Armazem 1', 32, 5),
(88, 'Caruara', 'Queimados', 1, '21:41:48', '00:32:55', '2018-09-19', 0, 'Armazem 1', 32, 5),
(89, 'Caruara', 'Mofados', 0, '21:41:48', '00:32:55', '2018-09-19', 0, 'Armazem 1', 32, 5),
(90, 'Caruara', 'Esverdeados', 0, '21:41:48', '00:32:55', '2018-09-19', 0, 'Armazem 1', 32, 5),
(91, 'Caruara', 'Partidos, Queimados e Amassados', 0, '21:41:48', '00:32:55', '2018-09-19', 0, 'Armazem 1', 32, 5),
(92, 'Caruara', 'Materias Estranhas e Impurezas', 1, '21:41:48', '00:32:55', '2018-09-19', 0, 'Armazem 1', 32, 5),
(93, 'Caruara', 'Avariados e Ardidos', 1, '21:43:33', '22:29:36', '2018-09-19', 0, 'Armazem 1', 33, 23),
(94, 'Caruara', 'Graos Quebrados', 0, '21:43:33', '22:29:36', '2018-09-19', 0, 'Armazem 1', 33, 1),
(95, 'Caruara', 'Impurezas', 1, '21:43:33', '22:29:36', '2018-09-19', 0, 'Armazem 1', 33, 45),
(96, 'Caruara', 'Carunchado', 0, '21:43:33', '22:29:36', '2018-09-19', 0, 'Armazem 1', 33, 2),
(97, 'Mauro', 'Avariados e Ardidos', 1, '22:18:40', '22:18:52', '2018-09-22', 2, 'Armazem 2', 26, 4),
(98, 'Mauro', 'Graos Quebrados', 1, '22:18:40', '22:18:52', '2018-09-22', 2, 'Armazem 2', 26, 16),
(99, 'Mauro', 'Impurezas', 1, '22:18:40', '22:18:52', '2018-09-22', 2, 'Armazem 2', 26, 2),
(100, 'Mauro', 'Carunchado', 0, '22:18:40', '22:18:52', '2018-09-22', 2, 'Armazem 2', 26, 2),
(101, 'Mauro', 'Avariados e Ardidos', 1, '23:56:37', '23:56:44', '2018-09-22', 3, 'Armazem 1', 26, 32),
(102, 'Mauro', 'Graos Quebrados', 1, '23:56:37', '23:56:44', '2018-09-22', 3, 'Armazem 1', 26, 12),
(103, 'Mauro', 'Impurezas', 1, '23:56:37', '23:56:44', '2018-09-22', 3, 'Armazem 1', 26, 12),
(104, 'Mauro', 'Carunchado', 0, '23:56:37', '23:56:44', '2018-09-22', 3, 'Armazem 1', 26, 2),
(105, 'Mauro', 'Avariados e Ardidos', 1, '23:58:15', '23:58:23', '2018-09-22', 4, 'Armazem 1', 26, 21),
(106, 'Mauro', 'Graos Quebrados', 1, '23:58:15', '23:58:23', '2018-09-22', 4, 'Armazem 1', 26, 12),
(107, 'Mauro', 'Impurezas', 0, '23:58:15', '23:58:23', '2018-09-22', 4, 'Armazem 1', 26, 1),
(108, 'Mauro', 'Carunchado', 1, '23:58:15', '23:58:23', '2018-09-22', 4, 'Armazem 1', 26, 23),
(113, 'Mauro', 'Avariados e Ardidos', 0, '00:12:11', '00:12:20', '2018-09-23', 2, 'Armazem 1', 33, 1),
(114, 'Mauro', 'Graos Quebrados', 0, '00:12:11', '00:12:20', '2018-09-23', 2, 'Armazem 1', 33, 1),
(115, 'Mauro', 'Impurezas', 0, '00:12:11', '00:12:20', '2018-09-23', 2, 'Armazem 1', 33, 1),
(116, 'Mauro', 'Carunchado', 0, '00:12:11', '00:12:20', '2018-09-23', 2, 'Armazem 1', 33, 1),
(117, 'Mauro', 'Ardidos e Queimados', 0, '00:17:47', '00:17:53', '2018-09-23', 1, 'Armazem 1', 34, 1),
(118, 'Mauro', 'Queimados', 1, '00:17:47', '00:17:53', '2018-09-23', 1, 'Armazem 1', 34, 1),
(119, 'Mauro', 'Mofados', 0, '00:17:47', '00:17:53', '2018-09-23', 1, 'Armazem 1', 34, 1),
(120, 'Mauro', 'Esverdeados', 0, '00:17:47', '00:17:53', '2018-09-23', 1, 'Armazem 1', 34, 1),
(121, 'Mauro', 'Partidos, Queimados e Amassados', 0, '00:17:47', '00:17:53', '2018-09-23', 1, 'Armazem 1', 34, 1),
(122, 'Mauro', 'Materias Estranhas e Impurezas', 1, '00:17:47', '00:17:53', '2018-09-23', 1, 'Armazem 1', 34, 1),
(123, 'Mauro', 'Avariados e Ardidos', 0, '00:28:56', '00:29:17', '2018-09-23', 5, 'Armazem 1', 26, 1),
(124, 'Mauro', 'Graos Quebrados', 0, '00:28:56', '00:29:17', '2018-09-23', 5, 'Armazem 1', 26, 1),
(125, 'Mauro', 'Impurezas', 0, '00:28:56', '00:29:17', '2018-09-23', 5, 'Armazem 1', 26, 1),
(126, 'Mauro', 'Carunchado', 0, '00:28:56', '00:29:17', '2018-09-23', 5, 'Armazem 1', 26, 1),
(127, 'Mauro', 'Avariados e Ardidos', 0, '00:30:36', '00:30:41', '2018-09-23', 6, 'Armazem 1', 26, 1),
(128, 'Mauro', 'Graos Quebrados', 0, '00:30:36', '00:30:41', '2018-09-23', 6, 'Armazem 1', 26, 1),
(129, 'Mauro', 'Impurezas', 0, '00:30:36', '00:30:41', '2018-09-23', 6, 'Armazem 1', 26, 1),
(130, 'Mauro', 'Carunchado', 0, '00:30:36', '00:30:41', '2018-09-23', 6, 'Armazem 1', 26, 1),
(131, 'Mauro', 'Avariados e Ardidos', 0, '00:30:53', '00:30:57', '2018-09-23', 3, 'Armazem 1', 33, 1),
(132, 'Mauro', 'Graos Quebrados', 0, '00:30:53', '00:30:58', '2018-09-23', 3, 'Armazem 1', 33, 1),
(133, 'Mauro', 'Impurezas', 0, '00:30:53', '00:30:58', '2018-09-23', 3, 'Armazem 1', 33, 1),
(134, 'Mauro', 'Carunchado', 0, '00:30:53', '00:30:58', '2018-09-23', 3, 'Armazem 1', 33, 1),
(135, 'Mauro', 'Avariados e Ardidos', 0, '00:31:49', '00:31:54', '2018-09-23', 7, 'Armazem 1', 26, 1),
(136, 'Mauro', 'Graos Quebrados', 0, '00:31:49', '00:31:54', '2018-09-23', 7, 'Armazem 1', 26, 1),
(137, 'Mauro', 'Impurezas', 0, '00:31:49', '00:31:54', '2018-09-23', 7, 'Armazem 1', 26, 1),
(138, 'Mauro', 'Carunchado', 0, '00:31:49', '00:31:54', '2018-09-23', 7, 'Armazem 1', 26, 1),
(139, 'Mauro', 'Ardidos e Queimados', 0, '00:33:17', '00:33:23', '2018-09-23', 2, 'Armazem 1', 32, 1),
(140, 'Mauro', 'Queimados', 1, '00:33:17', '00:33:24', '2018-09-23', 2, 'Armazem 1', 32, 1),
(141, 'Mauro', 'Mofados', 0, '00:33:17', '00:33:24', '2018-09-23', 2, 'Armazem 1', 32, 1),
(142, 'Mauro', 'Esverdeados', 0, '00:33:17', '00:33:23', '2018-09-23', 2, 'Armazem 1', 32, 1),
(143, 'Mauro', 'Partidos, Queimados e Amassados', 0, '00:33:17', '00:33:24', '2018-09-23', 2, 'Armazem 1', 32, 1),
(144, 'Mauro', 'Materias Estranhas e Impurezas', 1, '00:33:17', '00:33:24', '2018-09-23', 2, 'Armazem 1', 32, 1),
(145, 'Mauro', 'Ardidos e Queimados', 0, '00:35:33', '00:35:44', '2018-09-23', 3, 'Armazem 1', 32, 2),
(146, 'Mauro', 'Queimados', 1, '00:35:33', '00:35:44', '2018-09-23', 3, 'Armazem 1', 32, 2),
(147, 'Mauro', 'Mofados', 0, '00:35:33', '00:35:44', '2018-09-23', 3, 'Armazem 1', 32, 2),
(148, 'Mauro', 'Esverdeados', 0, '00:35:33', '00:35:44', '2018-09-23', 3, 'Armazem 1', 32, 2),
(149, 'Mauro', 'Partidos, Queimados e Amassados', 0, '00:35:33', '00:35:44', '2018-09-23', 3, 'Armazem 1', 32, 2),
(150, 'Mauro', 'Materias Estranhas e Impurezas', 1, '00:35:33', '00:35:44', '2018-09-23', 3, 'Armazem 1', 32, 2),
(151, 'Caruara', 'Avariados e Ardidos', 1, '13:30:48', '13:30:59', '2018-09-23', 8, 'Armazem 1', 26, 5),
(152, 'Caruara', 'Graos Quebrados', 0, '13:30:48', '13:30:59', '2018-09-23', 8, 'Armazem 1', 26, 3),
(153, 'Caruara', 'Impurezas', 1, '13:30:48', '13:30:59', '2018-09-23', 8, 'Armazem 1', 26, 2),
(154, 'Caruara', 'Carunchado', 1, '13:30:48', '13:30:59', '2018-09-23', 8, 'Armazem 1', 26, 4),
(155, 'Caruara', 'Avariados e Ardidos', 0, '01:18:42', '01:18:48', '2018-09-26', 9, 'Armazem 1', 26, 1),
(156, 'Caruara', 'Graos Quebrados', 0, '01:18:42', '01:18:48', '2018-09-26', 9, 'Armazem 1', 26, 1),
(157, 'Caruara', 'Impurezas', 0, '01:18:42', '01:18:48', '2018-09-26', 9, 'Armazem 1', 26, 1),
(158, 'Caruara', 'Carunchado', 0, '01:18:42', '01:18:48', '2018-09-26', 9, 'Armazem 1', 26, 1),
(159, 'Caruara', 'Avariados e Ardidos', 0, '01:19:10', '01:19:15', '2018-09-26', 4, 'Armazem 1', 33, 1),
(160, 'Caruara', 'Graos Quebrados', 0, '01:19:10', '01:19:15', '2018-09-26', 4, 'Armazem 1', 33, 1),
(161, 'Caruara', 'Impurezas', 0, '01:19:10', '01:19:15', '2018-09-26', 4, 'Armazem 1', 33, 1),
(162, 'Caruara', 'Carunchado', 0, '01:19:10', '01:19:15', '2018-09-26', 4, 'Armazem 1', 33, 1),
(163, 'Caruara', 'Ardidos e Queimados', 1, '12:36:56', '12:37:09', '2018-10-10', 1, 'Armazem 1', 35, 10),
(164, 'Caruara', 'Queimados', 1, '12:36:56', '12:37:09', '2018-10-10', 1, 'Armazem 1', 35, 11),
(165, 'Caruara', 'Mofados', 1, '12:36:56', '12:37:09', '2018-10-10', 1, 'Armazem 1', 35, 13),
(166, 'Caruara', 'Esverdeados', 1, '12:36:56', '12:37:09', '2018-10-10', 1, 'Armazem 1', 35, 15),
(167, 'Caruara', 'Partidos, Queimados e Amassados', 0, '12:36:56', '12:37:09', '2018-10-10', 1, 'Armazem 1', 35, 12),
(168, 'Caruara', 'Materias Estranhas e Impurezas', 1, '12:36:56', '12:37:09', '2018-10-10', 1, 'Armazem 1', 35, 12),
(169, 'Caruara', 'Avariados e Ardidos', 1, '15:53:39', '16:32:51', '2018-10-10', 1, 'Armazem 1', 37, 30),
(170, 'Caruara', 'Graos Quebrados', 1, '15:53:39', '16:32:51', '2018-10-10', 1, 'Armazem 1', 37, 23),
(171, 'Caruara', 'Impurezas', 1, '15:53:39', '16:32:51', '2018-10-10', 1, 'Armazem 1', 37, 12),
(172, 'Caruara', 'Carunchado', 1, '15:53:39', '16:32:51', '2018-10-10', 1, 'Armazem 1', 37, 20),
(173, 'Caruara', 'Avariados e Ardidos', 1, '16:47:58', '16:50:00', '2018-10-10', 2, 'Armazem 1', 37, 13),
(174, 'Caruara', 'Graos Quebrados', 1, '16:47:58', '16:50:00', '2018-10-10', 2, 'Armazem 1', 37, 10),
(175, 'Caruara', 'Impurezas', 0, '16:47:58', '16:50:00', '2018-10-10', 2, 'Armazem 1', 37, 1),
(176, 'Caruara', 'Carunchado', 0, '16:47:58', '16:50:00', '2018-10-10', 2, 'Armazem 1', 37, 2),
(177, 'Caruara', 'Avariados e Ardidos', 0, '16:57:50', '16:59:09', '2018-10-10', 3, 'Armazem 1', 37, 1),
(178, 'Caruara', 'Graos Quebrados', 0, '16:57:50', '16:59:09', '2018-10-10', 3, 'Armazem 1', 37, 1),
(179, 'Caruara', 'Impurezas', 0, '16:57:50', '16:59:09', '2018-10-10', 3, 'Armazem 1', 37, 1),
(180, 'Caruara', 'Carunchado', 0, '16:57:50', '16:59:09', '2018-10-10', 3, 'Armazem 1', 37, 1),
(181, 'Caruara', 'Avariados e Ardidos', 1, '17:23:03', '17:23:23', '2018-10-10', 1, 'Armazem 1', 38, 30),
(182, 'Caruara', 'Graos Quebrados', 1, '17:23:03', '17:23:23', '2018-10-10', 1, 'Armazem 1', 38, 24),
(183, 'Caruara', 'Impurezas', 1, '17:23:03', '17:23:23', '2018-10-10', 1, 'Armazem 1', 38, 54),
(184, 'Caruara', 'Carunchado', 1, '17:23:03', '17:23:23', '2018-10-10', 1, 'Armazem 1', 38, 32),
(185, 'Caruara', 'Ardidos e Queimados', 1, '17:24:48', '17:29:48', '2018-10-10', 2, 'Armazem 1', 35, 10),
(186, 'Caruara', 'Queimados', 1, '17:24:48', '17:29:49', '2018-10-10', 2, 'Armazem 1', 35, 11),
(187, 'Caruara', 'Mofados', 1, '17:24:48', '17:29:49', '2018-10-10', 2, 'Armazem 1', 35, 12),
(188, 'Caruara', 'Esverdeados', 1, '17:24:48', '17:29:48', '2018-10-10', 2, 'Armazem 1', 35, 11),
(189, 'Caruara', 'Partidos, Queimados e Amassados', 0, '17:24:48', '17:29:49', '2018-10-10', 2, 'Armazem 1', 35, 1),
(190, 'Caruara', 'Materias Estranhas e Impurezas', 1, '17:24:48', '17:29:49', '2018-10-10', 2, 'Armazem 1', 35, 12),
(191, 'Caruara', 'Ardidos e Queimados', 1, '17:34:27', '12:24:37', '2018-10-10', 1, 'Armazem 1', 36, 5),
(192, 'Caruara', 'Queimados', 1, '17:34:27', '12:24:37', '2018-10-10', 1, 'Armazem 1', 36, 1),
(193, 'Caruara', 'Mofados', 0, '17:34:27', '12:24:37', '2018-10-10', 1, 'Armazem 1', 36, 1),
(194, 'Caruara', 'Esverdeados', 1, '17:34:27', '12:24:37', '2018-10-10', 1, 'Armazem 1', 36, 10),
(195, 'Caruara', 'Partidos, Queimados e Amassados', 0, '17:34:27', '12:24:37', '2018-10-10', 1, 'Armazem 1', 36, 1),
(196, 'Caruara', 'Materias Estranhas e Impurezas', 1, '17:34:27', '12:24:37', '2018-10-10', 1, 'Armazem 1', 36, 1),
(197, 'Caruara', 'Ardidos e Queimados', 0, '12:24:05', '12:24:17', '2018-10-16', 1, 'Armazem 1', 39, 1),
(198, 'Caruara', 'Queimados', 1, '12:24:05', '12:24:17', '2018-10-16', 1, 'Armazem 1', 39, 1),
(199, 'Caruara', 'Mofados', 0, '12:24:05', '12:24:17', '2018-10-16', 1, 'Armazem 1', 39, 1),
(200, 'Caruara', 'Esverdeados', 0, '12:24:05', '12:24:17', '2018-10-16', 1, 'Armazem 1', 39, 1),
(201, 'Caruara', 'Partidos, Queimados e Amassados', 0, '12:24:05', '12:24:17', '2018-10-16', 1, 'Armazem 1', 39, 1),
(202, 'Caruara', 'Materias Estranhas e Impurezas', 1, '12:24:05', '12:24:17', '2018-10-16', 1, 'Armazem 1', 39, 1),
(203, 'Caruara', 'Avariados e Ardidos', 0, '12:24:52', '12:25:00', '2018-10-16', 4, 'Armazem 2', 37, 1),
(204, 'Caruara', 'Graos Quebrados', 0, '12:24:52', '12:25:01', '2018-10-16', 4, 'Armazem 2', 37, 1),
(205, 'Caruara', 'Impurezas', 0, '12:24:52', '12:25:01', '2018-10-16', 4, 'Armazem 2', 37, 1),
(206, 'Caruara', 'Carunchado', 0, '12:24:52', '12:25:00', '2018-10-16', 4, 'Armazem 2', 37, 1),
(207, 'Caruara', 'Avariados e Ardidos', 0, '14:29:52', '14:30:08', '2018-10-16', 5, 'Armazem 1', 37, 1),
(208, 'Caruara', 'Graos Quebrados', 0, '14:29:52', '14:30:09', '2018-10-16', 5, 'Armazem 1', 37, 1),
(209, 'Caruara', 'Impurezas', 0, '14:29:52', '14:30:09', '2018-10-16', 5, 'Armazem 1', 37, 1),
(210, 'Caruara', 'Carunchado', 0, '14:29:52', '14:30:09', '2018-10-16', 5, 'Armazem 1', 37, 1),
(211, 'Caruara', 'Ardidos e Queimados', 1, '14:40:08', '15:13:07', '2018-10-16', 1, 'Armazem 1', 40, 12),
(212, 'Caruara', 'Queimados', 1, '14:40:08', '15:13:07', '2018-10-16', 1, 'Armazem 1', 40, 20),
(213, 'Caruara', 'Mofados', 0, '14:40:08', '15:13:07', '2018-10-16', 1, 'Armazem 1', 40, 1),
(214, 'Caruara', 'Esverdeados', 0, '14:40:08', '15:13:07', '2018-10-16', 1, 'Armazem 1', 40, 1),
(215, 'Caruara', 'Partidos, Queimados e Amassados', 0, '14:40:08', '15:13:07', '2018-10-16', 1, 'Armazem 1', 40, 1),
(216, 'Caruara', 'Materias Estranhas e Impurezas', 1, '14:40:08', '15:13:07', '2018-10-16', 1, 'Armazem 1', 40, 1),
(217, 'Caruara', 'Ardidos e Queimados', 1, '18:57:40', '18:57:51', '2018-10-20', 1, 'Armazem 1', 41, 20),
(218, 'Caruara', 'Queimados', 1, '18:57:40', '18:57:52', '2018-10-20', 1, 'Armazem 1', 41, 1),
(219, 'Caruara', 'Mofados', 0, '18:57:40', '18:57:52', '2018-10-20', 1, 'Armazem 1', 41, 1),
(220, 'Caruara', 'Esverdeados', 0, '18:57:40', '18:57:51', '2018-10-20', 1, 'Armazem 1', 41, 1),
(221, 'Caruara', 'Partidos, Queimados e Amassados', 0, '18:57:40', '18:57:52', '2018-10-20', 1, 'Armazem 1', 41, 1),
(222, 'Caruara', 'Materias Estranhas e Impurezas', 1, '18:57:40', '18:57:51', '2018-10-20', 1, 'Armazem 1', 41, 1),
(223, 'Caruara', 'Ardidos e Queimados', 1, '18:59:22', '18:59:43', '2018-10-20', 1, 'Armazem 1', 42, 10),
(224, 'Caruara', 'Queimados', 1, '18:59:22', '18:59:43', '2018-10-20', 1, 'Armazem 1', 42, 1),
(225, 'Caruara', 'Mofados', 0, '18:59:22', '18:59:43', '2018-10-20', 1, 'Armazem 1', 42, 1),
(226, 'Caruara', 'Esverdeados', 0, '18:59:22', '18:59:43', '2018-10-20', 1, 'Armazem 1', 42, 1),
(227, 'Caruara', 'Partidos, Queimados e Amassados', 0, '18:59:22', '18:59:43', '2018-10-20', 1, 'Armazem 1', 42, 1),
(228, 'Caruara', 'Materias Estranhas e Impurezas', 1, '18:59:22', '18:59:43', '2018-10-20', 1, 'Armazem 1', 42, 20),
(229, 'Caruara', 'Avariados e Ardidos', 0, '06:40:10', '08:12:11', '2018-10-21', 1, 'Armazem 1', 43, 1),
(230, 'Caruara', 'Graos Quebrados', 0, '06:40:10', '08:12:12', '2018-10-21', 1, 'Armazem 1', 43, 1),
(231, 'Caruara', 'Impurezas', 0, '06:40:10', '08:12:12', '2018-10-21', 1, 'Armazem 1', 43, 1),
(232, 'Caruara', 'Carunchado', 0, '06:40:10', '08:12:11', '2018-10-21', 1, 'Armazem 1', 43, 1),
(233, 'Caruara', 'Avariados e Ardidos', 0, '07:43:11', '08:12:22', '2018-10-21', 1, 'Armazem 1', 44, 1),
(234, 'Caruara', 'Graos Quebrados', 0, '07:43:11', '08:12:22', '2018-10-21', 1, 'Armazem 1', 44, 1),
(235, 'Caruara', 'Impurezas', 0, '07:43:11', '08:12:22', '2018-10-21', 1, 'Armazem 1', 44, 1),
(236, 'Caruara', 'Carunchado', 0, '07:43:11', '08:12:22', '2018-10-21', 1, 'Armazem 1', 44, 1),
(237, 'Caruara', 'Ardidos e Queimados', 0, '08:09:16', '08:11:56', '2018-10-21', 2, 'Armazem 1', 40, 1),
(238, 'Caruara', 'Queimados', 1, '08:09:16', '08:11:57', '2018-10-21', 2, 'Armazem 1', 40, 1),
(239, 'Caruara', 'Mofados', 0, '08:09:16', '08:11:56', '2018-10-21', 2, 'Armazem 1', 40, 1),
(240, 'Caruara', 'Esverdeados', 0, '08:09:16', '08:11:56', '2018-10-21', 2, 'Armazem 1', 40, 1),
(241, 'Caruara', 'Partidos, Queimados e Amassados', 0, '08:09:16', '08:11:57', '2018-10-21', 2, 'Armazem 1', 40, 1),
(242, 'Caruara', 'Materias Estranhas e Impurezas', 1, '08:09:16', '08:11:56', '2018-10-21', 2, 'Armazem 1', 40, 1),
(243, 'Caruara', 'Ardidos e Queimados', 0, '08:12:46', '08:13:03', '2018-10-21', 2, 'Armazem 1', 41, 1),
(244, 'Caruara', 'Queimados', 1, '08:12:46', '08:13:03', '2018-10-21', 2, 'Armazem 1', 41, 1),
(245, 'Caruara', 'Mofados', 0, '08:12:46', '08:13:03', '2018-10-21', 2, 'Armazem 1', 41, 1),
(246, 'Caruara', 'Esverdeados', 0, '08:12:46', '08:13:03', '2018-10-21', 2, 'Armazem 1', 41, 1),
(247, 'Caruara', 'Partidos, Queimados e Amassados', 0, '08:12:46', '08:13:03', '2018-10-21', 2, 'Armazem 1', 41, 1),
(248, 'Caruara', 'Materias Estranhas e Impurezas', 1, '08:12:46', '08:13:03', '2018-10-21', 2, 'Armazem 1', 41, 1),
(249, 'Caruara', 'Avariados e Ardidos', 1, '08:14:11', '08:14:16', '2018-10-21', 1, 'Armazem 1', 45, 30),
(250, 'Caruara', 'Graos Quebrados', 0, '08:14:11', '08:14:17', '2018-10-21', 1, 'Armazem 1', 45, 1),
(251, 'Caruara', 'Impurezas', 0, '08:14:11', '08:14:17', '2018-10-21', 1, 'Armazem 1', 45, 1),
(252, 'Caruara', 'Carunchado', 0, '08:14:11', '08:14:17', '2018-10-21', 1, 'Armazem 1', 45, 1),
(253, 'Caruara', 'Avariados e Ardidos', 1, '08:15:24', '08:30:33', '2018-10-21', 2, 'Armazem 1', 45, 30),
(254, 'Caruara', 'Graos Quebrados', 0, '08:15:24', '08:30:33', '2018-10-21', 2, 'Armazem 1', 45, 1),
(255, 'Caruara', 'Impurezas', 0, '08:15:24', '08:30:33', '2018-10-21', 2, 'Armazem 1', 45, 1),
(256, 'Caruara', 'Carunchado', 0, '08:15:24', '08:30:33', '2018-10-21', 2, 'Armazem 1', 45, 1),
(257, 'Caruara', 'Ardidos e Queimados', 0, '08:17:33', '08:18:13', '2018-10-21', 2, 'Armazem 1', 42, 1),
(258, 'Caruara', 'Queimados', 1, '08:17:33', '08:18:13', '2018-10-21', 2, 'Armazem 1', 42, 1),
(259, 'Caruara', 'Mofados', 0, '08:17:33', '08:18:13', '2018-10-21', 2, 'Armazem 1', 42, 1),
(260, 'Caruara', 'Esverdeados', 0, '08:17:33', '08:18:13', '2018-10-21', 2, 'Armazem 1', 42, 1),
(261, 'Caruara', 'Partidos, Queimados e Amassados', 0, '08:17:33', '08:18:13', '2018-10-21', 2, 'Armazem 1', 42, 1),
(262, 'Caruara', 'Materias Estranhas e Impurezas', 1, '08:17:33', '08:18:13', '2018-10-21', 2, 'Armazem 1', 42, 1),
(263, 'Caruara', 'Ardidos e Queimados', 0, '08:18:47', '08:24:53', '2018-10-21', 3, 'Armazem 1', 42, 1),
(264, 'Caruara', 'Queimados', 1, '08:18:47', '08:24:54', '2018-10-21', 3, 'Armazem 1', 42, 1),
(265, 'Caruara', 'Mofados', 0, '08:18:47', '08:24:54', '2018-10-21', 3, 'Armazem 1', 42, 1),
(266, 'Caruara', 'Esverdeados', 0, '08:18:47', '08:24:53', '2018-10-21', 3, 'Armazem 1', 42, 1),
(267, 'Caruara', 'Partidos, Queimados e Amassados', 0, '08:18:47', '08:24:54', '2018-10-21', 3, 'Armazem 1', 42, 1),
(268, 'Caruara', 'Materias Estranhas e Impurezas', 1, '08:18:47', '08:24:53', '2018-10-21', 3, 'Armazem 1', 42, 1),
(269, 'Caruara', 'Ardidos e Queimados', NULL, '08:30:10', NULL, '2018-10-21', 4, NULL, 42, NULL),
(270, 'Caruara', 'Queimados', NULL, '08:30:10', NULL, '2018-10-21', 4, NULL, 42, NULL),
(271, 'Caruara', 'Mofados', NULL, '08:30:10', NULL, '2018-10-21', 4, NULL, 42, NULL),
(272, 'Caruara', 'Esverdeados', NULL, '08:30:10', NULL, '2018-10-21', 4, NULL, 42, NULL),
(273, 'Caruara', 'Partidos, Queimados e Amassados', NULL, '08:30:10', NULL, '2018-10-21', 4, NULL, 42, NULL),
(274, 'Caruara', 'Materias Estranhas e Impurezas', NULL, '08:30:10', NULL, '2018-10-21', 4, NULL, 42, NULL),
(275, 'Caruara', 'Avariados e Ardidos', 1, '15:05:51', '15:06:43', '2018-10-21', 3, 'Armazem 1', 45, 20),
(276, 'Caruara', 'Graos Quebrados', 0, '15:05:51', '15:06:44', '2018-10-21', 3, 'Armazem 1', 45, 1),
(277, 'Caruara', 'Impurezas', 0, '15:05:51', '15:06:44', '2018-10-21', 3, 'Armazem 1', 45, 1),
(278, 'Caruara', 'Carunchado', 1, '15:05:51', '15:06:44', '2018-10-21', 3, 'Armazem 1', 45, 58),
(279, 'Caruara', 'Avariados e Ardidos', 1, '15:07:02', '15:08:16', '2018-10-21', 4, 'Armazem 1', 45, 24),
(280, 'Caruara', 'Graos Quebrados', 0, '15:07:02', '15:08:16', '2018-10-21', 4, 'Armazem 1', 45, 1),
(281, 'Caruara', 'Impurezas', 0, '15:07:02', '15:08:16', '2018-10-21', 4, 'Armazem 1', 45, 1),
(282, 'Caruara', 'Carunchado', 0, '15:07:02', '15:08:16', '2018-10-21', 4, 'Armazem 1', 45, 1),
(283, 'Caruara', 'Avariados e Ardidos', 0, '15:22:12', '15:22:33', '2018-10-21', 5, 'Armazem 1', 45, 1),
(284, 'Caruara', 'Graos Quebrados', 0, '15:22:12', '15:22:33', '2018-10-21', 5, 'Armazem 1', 45, 1),
(285, 'Caruara', 'Impurezas', 0, '15:22:12', '15:22:33', '2018-10-21', 5, 'Armazem 1', 45, 1),
(286, 'Caruara', 'Carunchado', 0, '15:22:12', '15:22:33', '2018-10-21', 5, 'Armazem 1', 45, 1),
(287, 'Caruara', 'Avariados e Ardidos', 0, '15:27:19', '15:27:24', '2018-10-21', 6, 'Armazem 1', 45, 1),
(288, 'Caruara', 'Graos Quebrados', 0, '15:27:19', '15:27:24', '2018-10-21', 6, 'Armazem 1', 45, 1),
(289, 'Caruara', 'Impurezas', 0, '15:27:19', '15:27:24', '2018-10-21', 6, 'Armazem 1', 45, 1),
(290, 'Caruara', 'Carunchado', 0, '15:27:19', '15:27:24', '2018-10-21', 6, 'Armazem 1', 45, 1),
(291, 'Caruara', 'Avariados e Ardidos', 0, '15:33:04', '15:34:33', '2018-10-21', 7, 'Armazem 1', 45, 1),
(292, 'Caruara', 'Graos Quebrados', 0, '15:33:04', '15:35:10', '2018-10-21', 7, 'Armazem 1', 45, 1),
(293, 'Caruara', 'Impurezas', 0, '15:33:04', '15:35:10', '2018-10-21', 7, 'Armazem 1', 45, 1),
(294, 'Caruara', 'Carunchado', 0, '15:33:04', '15:34:33', '2018-10-21', 7, 'Armazem 1', 45, 1),
(295, 'Caruara', 'Avariados e Ardidos', 0, '15:34:06', '15:34:33', '2018-10-21', 8, 'Armazem 1', 45, 1),
(296, 'Caruara', 'Graos Quebrados', 0, '15:34:06', '15:35:10', '2018-10-21', 8, 'Armazem 1', 45, 1),
(297, 'Caruara', 'Impurezas', 0, '15:34:06', '15:35:10', '2018-10-21', 8, 'Armazem 1', 45, 1),
(298, 'Caruara', 'Carunchado', 0, '15:34:06', '15:34:33', '2018-10-21', 8, 'Armazem 1', 45, 1),
(299, 'Caruara', 'Avariados e Ardidos', 0, '15:37:04', '15:37:14', '2018-10-21', 9, 'Armazem 1', 45, 1),
(300, 'Caruara', 'Graos Quebrados', 0, '15:37:04', '15:37:14', '2018-10-21', 9, 'Armazem 1', 45, 1),
(301, 'Caruara', 'Impurezas', 0, '15:37:04', '15:37:14', '2018-10-21', 9, 'Armazem 1', 45, 1),
(302, 'Caruara', 'Carunchado', 0, '15:37:04', '15:37:14', '2018-10-21', 9, 'Armazem 1', 45, 1),
(303, 'Caruara', 'Avariados e Ardidos', 0, '15:38:11', '15:44:32', '2018-10-21', 10, 'Armazem 1', 45, 1),
(304, 'Caruara', 'Graos Quebrados', 0, '15:38:11', '16:00:28', '2018-10-21', 10, 'Armazem 1', 45, 1),
(305, 'Caruara', 'Impurezas', 0, '15:38:11', '22:47:21', '2018-10-21', 10, 'Armazem 1', 45, 1),
(306, 'Caruara', 'Carunchado', 0, '15:38:11', '15:44:32', '2018-10-21', 10, 'Armazem 1', 45, 1),
(307, 'Caruara', 'Avariados e Ardidos', 0, '15:44:26', '15:44:32', '2018-10-21', 11, 'Armazem 1', 45, 1),
(308, 'Caruara', 'Graos Quebrados', 0, '15:44:26', '16:00:29', '2018-10-21', 11, 'Armazem 1', 45, 1),
(309, 'Caruara', 'Impurezas', 0, '15:44:26', '22:52:25', '2018-10-21', 11, 'Armazem 1', 45, 1),
(310, 'Caruara', 'Carunchado', 0, '15:44:26', '15:44:32', '2018-10-21', 11, 'Armazem 1', 45, 1),
(311, 'Caruara', 'Avariados e Ardidos', 1, '15:45:53', '15:46:01', '2018-10-21', 1, 'Armazem 1', 46, 60),
(312, 'Caruara', 'Graos Quebrados', 0, '15:45:53', '15:46:01', '2018-10-21', 1, 'Armazem 1', 46, 1),
(313, 'Caruara', 'Impurezas', 0, '15:45:53', '15:46:01', '2018-10-21', 1, 'Armazem 1', 46, 1),
(314, 'Caruara', 'Carunchado', 0, '15:45:53', '15:46:01', '2018-10-21', 1, 'Armazem 1', 46, 1),
(315, 'Caruara', 'Avariados e Ardidos', 0, '16:00:23', '16:00:28', '2018-10-21', 12, 'Armazem 1', 45, 1),
(316, 'Caruara', 'Graos Quebrados', 0, '16:00:23', '16:01:24', '2018-10-21', 12, 'Armazem 1', 45, 1),
(317, 'Caruara', 'Impurezas', 1, '16:00:23', '23:05:45', '2018-10-21', 12, 'Armazem 1', 45, 5),
(318, 'Caruara', 'Carunchado', 0, '16:00:23', '16:00:28', '2018-10-21', 12, 'Armazem 1', 45, 1),
(319, 'Caruara', 'Avariados e Ardidos', 0, '16:00:31', '16:00:36', '2018-10-21', 2, 'Armazem 1', 46, 1),
(320, 'Caruara', 'Graos Quebrados', 0, '16:00:31', '16:00:36', '2018-10-21', 2, 'Armazem 1', 46, 1),
(321, 'Caruara', 'Impurezas', 0, '16:00:31', '16:00:36', '2018-10-21', 2, 'Armazem 1', 46, 1),
(322, 'Caruara', 'Carunchado', 0, '16:00:31', '16:00:36', '2018-10-21', 2, 'Armazem 1', 46, 1),
(323, 'Caruara', 'Avariados e Ardidos', 0, '16:01:04', '16:01:23', '2018-10-21', 13, 'Armazem 1', 45, 1),
(324, 'Caruara', 'Graos Quebrados', 0, '16:01:04', '16:01:24', '2018-10-21', 13, 'Armazem 1', 45, 1),
(325, 'Caruara', 'Impurezas', 0, '16:01:04', '23:07:58', '2018-10-21', 13, 'Armazem 1', 45, 1),
(326, 'Caruara', 'Carunchado', 0, '16:01:04', '16:01:23', '2018-10-21', 13, 'Armazem 1', 45, 1),
(327, 'Caruara', 'Avariados e Ardidos', 0, '22:28:28', '22:28:36', '2018-10-27', 3, 'Armazem 1', 46, 1),
(328, 'Caruara', 'Graos Quebrados', 0, '22:28:28', '22:28:36', '2018-10-27', 3, 'Armazem 1', 46, 1),
(329, 'Caruara', 'Impurezas', 0, '22:28:28', '22:28:36', '2018-10-27', 3, 'Armazem 1', 46, 1),
(330, 'Caruara', 'Carunchado', 0, '22:28:28', '22:28:36', '2018-10-27', 3, 'Armazem 1', 46, 1),
(331, 'Caruara', 'Avariados e Ardidos', 1, '22:29:33', '22:29:39', '2018-10-27', 4, 'Armazem 1', 46, 32),
(332, 'Caruara', 'Graos Quebrados', 0, '22:29:33', '22:29:39', '2018-10-27', 4, 'Armazem 1', 46, 1),
(333, 'Caruara', 'Impurezas', 0, '22:29:33', '22:29:39', '2018-10-27', 4, 'Armazem 1', 46, 1),
(334, 'Caruara', 'Carunchado', 0, '22:29:33', '22:29:39', '2018-10-27', 4, 'Armazem 1', 46, 1),
(335, 'Caruara', 'Ardidos e Queimados', 0, '22:47:03', '22:47:09', '2018-10-27', 1, 'Armazem 1', 47, 1),
(336, 'Caruara', 'Queimados', 1, '22:47:03', '22:47:09', '2018-10-27', 1, 'Armazem 1', 47, 1),
(337, 'Caruara', 'Mofados', 0, '22:47:03', '22:47:09', '2018-10-27', 1, 'Armazem 1', 47, 1),
(338, 'Caruara', 'Esverdeados', 0, '22:47:03', '22:47:09', '2018-10-27', 1, 'Armazem 1', 47, 1),
(339, 'Caruara', 'Partidos, Queimados e Amassados', 0, '22:47:03', '22:47:09', '2018-10-27', 1, 'Armazem 1', 47, 1),
(340, 'Caruara', 'Materias Estranhas e Impurezas', 1, '22:47:03', '22:47:09', '2018-10-27', 1, 'Armazem 1', 47, 1),
(341, 'Caruara', 'Avariados e Ardidos', 0, '22:47:16', '22:47:21', '2018-10-27', 14, 'Armazem 1', 45, 1),
(342, 'Caruara', 'Graos Quebrados', 0, '22:47:16', '22:47:21', '2018-10-27', 14, 'Armazem 1', 45, 1),
(343, 'Caruara', 'Impurezas', 1, '22:47:16', '18:16:51', '2018-10-27', 14, 'Armazem 1', 45, 40),
(344, 'Caruara', 'Carunchado', 0, '22:47:16', '22:47:21', '2018-10-27', 14, 'Armazem 1', 45, 1),
(345, 'Caruara', 'Avariados e Ardidos', 0, '22:52:15', '22:52:25', '2018-10-27', 15, 'Armazem 1', 45, 1),
(346, 'Caruara', 'Graos Quebrados', 0, '22:52:15', '22:52:25', '2018-10-27', 15, 'Armazem 1', 45, 1),
(347, 'Caruara', 'Impurezas', NULL, '22:52:15', NULL, '2018-10-27', 15, NULL, 45, NULL),
(348, 'Caruara', 'Carunchado', 0, '22:52:15', '22:52:25', '2018-10-27', 15, 'Armazem 1', 45, 1),
(349, 'Caruara', 'Ardidos e Queimados', 1, '22:52:37', '22:52:43', '2018-10-27', 1, 'Armazem 1', 48, 59),
(350, 'Caruara', 'Queimados', 1, '22:52:37', '22:52:43', '2018-10-27', 1, 'Armazem 1', 48, 1),
(351, 'Caruara', 'Mofados', 0, '22:52:37', '22:52:43', '2018-10-27', 1, 'Armazem 1', 48, 1),
(352, 'Caruara', 'Esverdeados', 0, '22:52:37', '22:52:43', '2018-10-27', 1, 'Armazem 1', 48, 1),
(353, 'Caruara', 'Partidos, Queimados e Amassados', 0, '22:52:37', '22:52:43', '2018-10-27', 1, 'Armazem 1', 48, 1),
(354, 'Caruara', 'Materias Estranhas e Impurezas', 1, '22:52:37', '22:52:43', '2018-10-27', 1, 'Armazem 1', 48, 1),
(355, 'Caruara', 'Avariados e Ardidos', 1, '22:54:10', '22:54:17', '2018-10-27', 1, 'Armazem 1', 49, 90),
(356, 'Caruara', 'Graos Quebrados', 0, '22:54:10', '22:54:17', '2018-10-27', 1, 'Armazem 1', 49, 1),
(357, 'Caruara', 'Impurezas', 0, '22:54:10', '22:54:17', '2018-10-27', 1, 'Armazem 1', 49, 1),
(358, 'Caruara', 'Carunchado', 0, '22:54:10', '22:54:17', '2018-10-27', 1, 'Armazem 1', 49, 1),
(359, 'Caruara', 'Avariados e Ardidos', 0, '22:54:30', '22:54:35', '2018-10-27', 2, 'Armazem 1', 49, 1),
(360, 'Caruara', 'Graos Quebrados', 0, '22:54:30', '22:54:35', '2018-10-27', 2, 'Armazem 1', 49, 1),
(361, 'Caruara', 'Impurezas', 0, '22:54:30', '22:54:35', '2018-10-27', 2, 'Armazem 1', 49, 1),
(362, 'Caruara', 'Carunchado', 0, '22:54:30', '22:54:35', '2018-10-27', 2, 'Armazem 1', 49, 1),
(363, 'Caruara', 'Ardidos e Queimados', 0, '22:55:23', '22:55:29', '2018-10-27', 1, 'Armazem 1', 50, 1),
(364, 'Caruara', 'Queimados', 1, '22:55:23', '22:55:30', '2018-10-27', 1, 'Armazem 1', 50, 1),
(365, 'Caruara', 'Mofados', 0, '22:55:23', '22:55:29', '2018-10-27', 1, 'Armazem 1', 50, 1),
(366, 'Caruara', 'Esverdeados', 0, '22:55:23', '22:55:29', '2018-10-27', 1, 'Armazem 1', 50, 1),
(367, 'Caruara', 'Partidos, Queimados e Amassados', 0, '22:55:23', '22:55:29', '2018-10-27', 1, 'Armazem 1', 50, 1),
(368, 'Caruara', 'Materias Estranhas e Impurezas', 1, '22:55:23', '22:55:29', '2018-10-27', 1, 'Armazem 1', 50, 1),
(369, 'Caruara', 'Avariados e Ardidos', 1, '23:05:39', '23:05:45', '2018-10-27', 16, 'Armazem 1', 45, 21),
(370, 'Caruara', 'Graos Quebrados', 1, '23:05:39', '23:05:45', '2018-10-27', 16, 'Armazem 1', 45, 4),
(371, 'Caruara', 'Impurezas', NULL, '23:05:39', NULL, '2018-10-27', 16, NULL, 45, NULL),
(372, 'Caruara', 'Carunchado', 0, '23:05:39', '23:05:45', '2018-10-27', 16, 'Armazem 1', 45, 2),
(373, 'Caruara', 'Avariados e Ardidos', 0, '23:07:53', '23:07:58', '2018-10-27', 17, 'Armazem 1', 45, 1),
(374, 'Caruara', 'Graos Quebrados', 0, '23:07:53', '23:07:58', '2018-10-27', 17, 'Armazem 1', 45, 1),
(375, 'Caruara', 'Impurezas', NULL, '23:07:53', NULL, '2018-10-27', 17, NULL, 45, NULL),
(376, 'Caruara', 'Carunchado', 0, '23:07:53', '23:07:58', '2018-10-27', 17, 'Armazem 1', 45, 1),
(377, 'Caruara', 'Avariados e Ardidos', 1, '23:09:45', '23:09:54', '2018-10-27', 5, 'Armazem 1', 46, 4),
(378, 'Caruara', 'Graos Quebrados', 1, '23:09:45', '23:09:54', '2018-10-27', 5, 'Armazem 1', 46, 17),
(379, 'Caruara', 'Impurezas', 1, '23:09:45', '23:09:54', '2018-10-27', 5, 'Armazem 1', 46, 4),
(380, 'Caruara', 'Carunchado', 1, '23:09:45', '23:09:54', '2018-10-27', 5, 'Armazem 1', 46, 5),
(381, 'Caruara', 'Ardidos e Queimados', 0, '23:10:24', '23:10:30', '2018-10-27', 2, 'Armazem 1', 48, 1),
(382, 'Caruara', 'Queimados', 1, '23:10:24', '23:10:30', '2018-10-27', 2, 'Armazem 1', 48, 1),
(383, 'Caruara', 'Mofados', 0, '23:10:24', '23:10:30', '2018-10-27', 2, 'Armazem 1', 48, 1),
(384, 'Caruara', 'Esverdeados', 0, '23:10:24', '23:10:30', '2018-10-27', 2, 'Armazem 1', 48, 1),
(385, 'Caruara', 'Partidos, Queimados e Amassados', 0, '23:10:24', '23:10:30', '2018-10-27', 2, 'Armazem 1', 48, 1),
(386, 'Caruara', 'Materias Estranhas e Impurezas', 1, '23:10:24', '23:10:30', '2018-10-27', 2, 'Armazem 1', 48, 1),
(387, 'Caruara', 'Avariados e Ardidos', 0, '23:12:04', '23:12:09', '2018-10-27', 3, 'Armazem 1', 49, 1),
(388, 'Caruara', 'Graos Quebrados', 0, '23:12:04', '23:12:09', '2018-10-27', 3, 'Armazem 1', 49, 1),
(389, 'Caruara', 'Impurezas', 0, '23:12:04', '23:12:09', '2018-10-27', 3, 'Armazem 1', 49, 1),
(390, 'Caruara', 'Carunchado', 0, '23:12:04', '23:12:09', '2018-10-27', 3, 'Armazem 1', 49, 1),
(391, 'Caruara', 'Avariados e Ardidos', 0, '18:16:45', '18:16:51', '2018-11-04', 18, 'Armazem 1', 45, 1),
(392, 'Caruara', 'Graos Quebrados', 0, '18:16:45', '18:16:51', '2018-11-04', 18, 'Armazem 1', 45, 1),
(393, 'Caruara', 'Impurezas', NULL, '18:16:45', NULL, '2018-11-04', 18, NULL, 45, NULL),
(394, 'Caruara', 'Carunchado', 0, '18:16:45', '18:16:51', '2018-11-04', 18, 'Armazem 1', 45, 1),
(395, 'Caruara', 'Avariados e Ardidos', 1, '18:16:54', '18:16:59', '2018-11-04', 6, 'Armazem 1', 46, 45),
(396, 'Caruara', 'Graos Quebrados', 0, '18:16:54', '18:16:59', '2018-11-04', 6, 'Armazem 1', 46, 1),
(397, 'Caruara', 'Impurezas', 0, '18:16:54', '18:16:59', '2018-11-04', 6, 'Armazem 1', 46, 1),
(398, 'Caruara', 'Carunchado', 0, '18:16:54', '18:16:59', '2018-11-04', 6, 'Armazem 1', 46, 1),
(399, 'Caruara', 'Ardidos e Queimados', 0, '02:39:24', '02:39:35', '2018-11-05', 3, 'Armazem 1', 48, 1),
(400, 'Caruara', 'Queimados', 1, '02:39:24', '02:39:35', '2018-11-05', 3, 'Armazem 1', 48, 1),
(401, 'Caruara', 'Mofados', 0, '02:39:24', '02:39:35', '2018-11-05', 3, 'Armazem 1', 48, 1),
(402, 'Caruara', 'Esverdeados', 0, '02:39:24', '02:39:35', '2018-11-05', 3, 'Armazem 1', 48, 1),
(403, 'Caruara', 'Partidos, Queimados e Amassados', 1, '02:39:24', '02:39:35', '2018-11-05', 3, 'Armazem 1', 48, 123),
(404, 'Caruara', 'Materias Estranhas e Impurezas', 1, '02:39:24', '02:39:35', '2018-11-05', 3, 'Armazem 1', 48, 1),
(405, 'Caruara', 'Avariados e Ardidos', 0, '02:40:50', '02:40:57', '2018-11-05', 1, 'Armazem 1', 51, 1),
(406, 'Caruara', 'Graos Quebrados', 1, '02:40:50', '02:40:58', '2018-11-05', 1, 'Armazem 1', 51, 23),
(407, 'Caruara', 'Impurezas', 0, '02:40:50', '02:40:58', '2018-11-05', 1, 'Armazem 1', 51, 1),
(408, 'Caruara', 'Carunchado', 0, '02:40:50', '02:40:58', '2018-11-05', 1, 'Armazem 1', 51, 1),
(409, 'Caruara', 'Ardidos e Queimados', 1, '02:50:16', '02:50:23', '2018-11-05', 1, 'Armazem 1', 52, 40),
(410, 'Caruara', 'Queimados', 1, '02:50:16', '02:50:23', '2018-11-05', 1, 'Armazem 1', 52, 1),
(411, 'Caruara', 'Mofados', 0, '02:50:16', '02:50:23', '2018-11-05', 1, 'Armazem 1', 52, 1),
(412, 'Caruara', 'Esverdeados', 0, '02:50:16', '02:50:23', '2018-11-05', 1, 'Armazem 1', 52, 1),
(413, 'Caruara', 'Partidos, Queimados e Amassados', 0, '02:50:16', '02:50:23', '2018-11-05', 1, 'Armazem 1', 52, 1),
(414, 'Caruara', 'Materias Estranhas e Impurezas', 1, '02:50:16', '02:50:23', '2018-11-05', 1, 'Armazem 1', 52, 1),
(415, 'Caruara', 'Ardidos e Queimados', 1, '03:03:08', '03:03:23', '2018-11-05', 1, 'Armazem 1', 53, 23),
(416, 'Caruara', 'Queimados', 1, '03:03:08', '03:03:24', '2018-11-05', 1, 'Armazem 1', 53, 13),
(417, 'Caruara', 'Mofados', 0, '03:03:08', '03:03:24', '2018-11-05', 1, 'Armazem 1', 53, 1),
(418, 'Caruara', 'Esverdeados', 0, '03:03:08', '03:03:24', '2018-11-05', 1, 'Armazem 1', 53, 1),
(419, 'Caruara', 'Partidos, Queimados e Amassados', 0, '03:03:08', '03:03:24', '2018-11-05', 1, 'Armazem 1', 53, 12),
(420, 'Caruara', 'Materias Estranhas e Impurezas', 1, '03:03:08', '03:03:24', '2018-11-05', 1, 'Armazem 1', 53, 1),
(421, 'Caruara', 'Avariados e Ardidos', 1, '03:36:19', '03:36:28', '2018-11-05', 1, 'Armazem 1', 54, 24),
(422, 'Caruara', 'Graos Quebrados', 0, '03:36:19', '03:36:28', '2018-11-05', 1, 'Armazem 1', 54, 1),
(423, 'Caruara', 'Impurezas', 1, '03:36:19', '03:36:28', '2018-11-05', 1, 'Armazem 1', 54, 13),
(424, 'Caruara', 'Carunchado', 0, '03:36:19', '03:36:28', '2018-11-05', 1, 'Armazem 1', 54, 1),
(425, 'Caruara', 'Ardidos e Queimados', 1, '03:44:28', '03:44:36', '2018-11-05', 1, 'Armazem 1', 55, 100),
(426, 'Caruara', 'Queimados', 1, '03:44:28', '03:44:36', '2018-11-05', 1, 'Armazem 1', 55, 1),
(427, 'Caruara', 'Mofados', 0, '03:44:28', '03:44:36', '2018-11-05', 1, 'Armazem 1', 55, 1),
(428, 'Caruara', 'Esverdeados', 0, '03:44:28', '03:44:36', '2018-11-05', 1, 'Armazem 1', 55, 1),
(429, 'Caruara', 'Partidos, Queimados e Amassados', 0, '03:44:28', '03:44:36', '2018-11-05', 1, 'Armazem 1', 55, 1),
(430, 'Caruara', 'Materias Estranhas e Impurezas', 1, '03:44:28', '03:44:36', '2018-11-05', 1, 'Armazem 1', 55, 1),
(431, 'Caruara', 'Ardidos e Queimados', 1, '03:44:38', '03:44:43', '2018-11-05', 1, 'Armazem 1', 56, 100),
(432, 'Caruara', 'Queimados', 1, '03:44:38', '03:44:44', '2018-11-05', 1, 'Armazem 1', 56, 1),
(433, 'Caruara', 'Mofados', 0, '03:44:38', '03:44:44', '2018-11-05', 1, 'Armazem 1', 56, 1),
(434, 'Caruara', 'Esverdeados', 0, '03:44:38', '03:44:43', '2018-11-05', 1, 'Armazem 1', 56, 1),
(435, 'Caruara', 'Partidos, Queimados e Amassados', 0, '03:44:38', '03:44:44', '2018-11-05', 1, 'Armazem 1', 56, 1),
(436, 'Caruara', 'Materias Estranhas e Impurezas', 1, '03:44:38', '03:44:43', '2018-11-05', 1, 'Armazem 1', 56, 1),
(437, 'Caruara', 'Ardidos e Queimados', 1, '03:44:46', '03:44:52', '2018-11-05', 1, 'Armazem 1', 57, 40),
(438, 'Caruara', 'Queimados', 1, '03:44:46', '03:44:53', '2018-11-05', 1, 'Armazem 1', 57, 1),
(439, 'Caruara', 'Mofados', 1, '03:44:46', '03:44:53', '2018-11-05', 1, 'Armazem 1', 57, 22),
(440, 'Caruara', 'Esverdeados', 0, '03:44:46', '03:44:53', '2018-11-05', 1, 'Armazem 1', 57, 1),
(441, 'Caruara', 'Partidos, Queimados e Amassados', 0, '03:44:46', '03:44:53', '2018-11-05', 1, 'Armazem 1', 57, 1),
(442, 'Caruara', 'Materias Estranhas e Impurezas', 1, '03:44:46', '03:44:53', '2018-11-05', 1, 'Armazem 1', 57, 1),
(443, 'Caruara', 'Avariados e Ardidos', 0, '03:44:55', '03:45:01', '2018-11-05', 1, 'Armazem 1', 58, 1),
(444, 'Caruara', 'Graos Quebrados', 0, '03:44:55', '03:45:01', '2018-11-05', 1, 'Armazem 1', 58, 1),
(445, 'Caruara', 'Impurezas', 1, '03:44:55', '03:45:01', '2018-11-05', 1, 'Armazem 1', 58, 890),
(446, 'Caruara', 'Carunchado', 0, '03:44:55', '03:45:01', '2018-11-05', 1, 'Armazem 1', 58, 1),
(447, 'Caruara', 'Ardidos e Queimados', 0, '04:07:30', '04:07:36', '2018-11-05', 1, 'Armazem 1', 59, 1),
(448, 'Caruara', 'Queimados', 1, '04:07:30', '04:07:36', '2018-11-05', 1, 'Armazem 1', 59, 1),
(449, 'Caruara', 'Mofados', 0, '04:07:30', '04:07:36', '2018-11-05', 1, 'Armazem 1', 59, 1),
(450, 'Caruara', 'Esverdeados', 0, '04:07:30', '04:07:36', '2018-11-05', 1, 'Armazem 1', 59, 1),
(451, 'Caruara', 'Partidos, Queimados e Amassados', 0, '04:07:30', '04:07:36', '2018-11-05', 1, 'Armazem 1', 59, 1),
(452, 'Caruara', 'Materias Estranhas e Impurezas', 1, '04:07:30', '04:07:36', '2018-11-05', 1, 'Armazem 1', 59, 1),
(453, 'Caruara', 'Ardidos e Queimados', 0, '04:07:39', '04:07:43', '2018-11-05', 1, 'Armazem 1', 60, 1),
(454, 'Caruara', 'Queimados', 1, '04:07:39', '04:07:43', '2018-11-05', 1, 'Armazem 1', 60, 1),
(455, 'Caruara', 'Mofados', 0, '04:07:39', '04:07:43', '2018-11-05', 1, 'Armazem 1', 60, 1),
(456, 'Caruara', 'Esverdeados', 0, '04:07:39', '04:07:43', '2018-11-05', 1, 'Armazem 1', 60, 1),
(457, 'Caruara', 'Partidos, Queimados e Amassados', 0, '04:07:39', '04:07:43', '2018-11-05', 1, 'Armazem 1', 60, 1),
(458, 'Caruara', 'Materias Estranhas e Impurezas', 1, '04:07:39', '04:07:43', '2018-11-05', 1, 'Armazem 1', 60, 1),
(459, 'Caruara', 'Ardidos e Queimados', 0, '04:07:45', '04:07:50', '2018-11-05', 1, 'Armazem 1', 61, 1),
(460, 'Caruara', 'Queimados', 1, '04:07:45', '04:07:50', '2018-11-05', 1, 'Armazem 1', 61, 1),
(461, 'Caruara', 'Mofados', 0, '04:07:45', '04:07:50', '2018-11-05', 1, 'Armazem 1', 61, 1),
(462, 'Caruara', 'Esverdeados', 0, '04:07:45', '04:07:50', '2018-11-05', 1, 'Armazem 1', 61, 1),
(463, 'Caruara', 'Partidos, Queimados e Amassados', 0, '04:07:45', '04:07:50', '2018-11-05', 1, 'Armazem 1', 61, 1),
(464, 'Caruara', 'Materias Estranhas e Impurezas', 1, '04:07:45', '04:07:50', '2018-11-05', 1, 'Armazem 1', 61, 1),
(465, 'Caruara', 'Avariados e Ardidos', 0, '04:07:52', '04:07:56', '2018-11-05', 1, 'Armazem 1', 62, 1),
(466, 'Caruara', 'Graos Quebrados', 0, '04:07:52', '04:07:56', '2018-11-05', 1, 'Armazem 1', 62, 1),
(467, 'Caruara', 'Impurezas', 0, '04:07:52', '04:07:56', '2018-11-05', 1, 'Armazem 1', 62, 1),
(468, 'Caruara', 'Carunchado', 0, '04:07:52', '04:07:56', '2018-11-05', 1, 'Armazem 1', 62, 1),
(469, 'Caruara', 'Ardidos e Queimados', 1, '04:07:58', '04:08:06', '2018-11-05', 1, 'Armazem 1', 63, 12),
(470, 'Caruara', 'Queimados', 1, '04:07:58', '04:08:06', '2018-11-05', 1, 'Armazem 1', 63, 1),
(471, 'Caruara', 'Mofados', 0, '04:07:58', '04:08:06', '2018-11-05', 1, 'Armazem 1', 63, 1),
(472, 'Caruara', 'Esverdeados', 1, '04:07:58', '04:08:06', '2018-11-05', 1, 'Armazem 1', 63, 122),
(473, 'Caruara', 'Partidos, Queimados e Amassados', 0, '04:07:58', '04:08:06', '2018-11-05', 1, 'Armazem 1', 63, 1),
(474, 'Caruara', 'Materias Estranhas e Impurezas', 1, '04:07:58', '04:08:06', '2018-11-05', 1, 'Armazem 1', 63, 1),
(475, 'Caruara', 'Ardidos e Queimados', 0, '04:08:09', '04:08:15', '2018-11-05', 1, 'Armazem 1', 64, 1),
(476, 'Caruara', 'Queimados', 1, '04:08:09', '04:08:15', '2018-11-05', 1, 'Armazem 1', 64, 1),
(477, 'Caruara', 'Mofados', 0, '04:08:09', '04:08:15', '2018-11-05', 1, 'Armazem 1', 64, 1),
(478, 'Caruara', 'Esverdeados', 0, '04:08:09', '04:08:15', '2018-11-05', 1, 'Armazem 1', 64, 1),
(479, 'Caruara', 'Partidos, Queimados e Amassados', 0, '04:08:09', '04:08:15', '2018-11-05', 1, 'Armazem 1', 64, 1),
(480, 'Caruara', 'Materias Estranhas e Impurezas', 1, '04:08:09', '04:08:15', '2018-11-05', 1, 'Armazem 1', 64, 1),
(481, 'Caruara', 'Ardidos e Queimados', 1, '04:08:17', '04:08:23', '2018-11-05', 1, 'Armazem 1', 65, 34),
(482, 'Caruara', 'Queimados', 1, '04:08:17', '04:08:23', '2018-11-05', 1, 'Armazem 1', 65, 1),
(483, 'Caruara', 'Mofados', 0, '04:08:17', '04:08:23', '2018-11-05', 1, 'Armazem 1', 65, 1),
(484, 'Caruara', 'Esverdeados', 0, '04:08:17', '04:08:23', '2018-11-05', 1, 'Armazem 1', 65, 1),
(485, 'Caruara', 'Partidos, Queimados e Amassados', 0, '04:08:17', '04:08:23', '2018-11-05', 1, 'Armazem 1', 65, 1),
(486, 'Caruara', 'Materias Estranhas e Impurezas', 1, '04:08:17', '04:08:23', '2018-11-05', 1, 'Armazem 1', 65, 1),
(487, 'Caruara', 'Avariados e Ardidos', 0, '00:15:53', '00:17:46', '2018-11-06', 1, 'Armazem 1', 66, 1),
(488, 'Caruara', 'Graos Quebrados', 1, '00:15:53', '00:17:46', '2018-11-06', 1, 'Armazem 1', 66, 11),
(489, 'Caruara', 'Impurezas', 1, '00:15:53', '00:17:46', '2018-11-06', 1, 'Armazem 1', 66, 111),
(490, 'Caruara', 'Carunchado', 1, '00:15:53', '00:17:46', '2018-11-06', 1, 'Armazem 1', 66, 11),
(491, 'Caruara', 'Avariados e Ardidos', 0, '00:18:06', '00:19:31', '2018-11-06', 2, 'Armazem 1', 66, 1),
(492, 'Caruara', 'Graos Quebrados', 0, '00:18:06', '00:19:31', '2018-11-06', 2, 'Armazem 1', 66, 1),
(493, 'Caruara', 'Impurezas', 0, '00:18:06', '00:19:31', '2018-11-06', 2, 'Armazem 1', 66, 1),
(494, 'Caruara', 'Carunchado', 0, '00:18:06', '00:19:31', '2018-11-06', 2, 'Armazem 1', 66, 1),
(495, 'Caruara', 'Avariados e Ardidos', 1, '00:20:06', '00:21:02', '2018-11-06', 3, 'Armazem 1', 66, 32),
(496, 'Caruara', 'Graos Quebrados', 0, '00:20:06', '00:21:02', '2018-11-06', 3, 'Armazem 1', 66, 1),
(497, 'Caruara', 'Impurezas', 0, '00:20:06', '00:21:02', '2018-11-06', 3, 'Armazem 1', 66, 1),
(498, 'Caruara', 'Carunchado', 0, '00:20:06', '00:21:02', '2018-11-06', 3, 'Armazem 1', 66, 1);

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
(17, 'Soja', 'Fazenda dos Grãos', 'Taiwan', '2018-08-19', '14:15:11', '15:29:29', 'FYM-6482', 'Finalizado', 'Aprovado'),
(18, 'Soja', 'Fazendeiros Tabajara', 'Santos', '2018-08-19', '14:15:26', '03:40:14', 'AOS-2385', 'Finalizado', 'Aprovado'),
(19, 'Milho', 'Granolandia', 'Guaruja', '2018-08-19', '14:15:43', '03:39:48', 'SQI-9187', 'Finalizado', 'Aprovado'),
(20, 'Milho', 'Fazenda dos Grãos', 'Taiwan', '2018-08-23', '03:56:58', '03:57:15', 'OIJ-7793', 'Finalizado', 'Aprovado'),
(23, 'Milho', 'Fazendeiros Tabajara', 'Taiwan', '2018-08-23', '18:50:07', '17:23:36', 'SKL-7070', 'Finalizado', 'Aprovado'),
(24, 'Soja', 'Granolandia', 'São Vicente', '2018-09-01', '07:41:11', '07:41:41', 'SKL-1408', 'Finalizado', 'Aprovado'),
(25, 'Milho', 'MM Grãos', 'Guaruja', '2018-09-02', '17:26:13', '13:39:59', 'FYM-9077', 'Finalizado', 'Aprovado'),
(26, 'Milho', 'Fazendeiros Tabajara', 'São Vicente', '2018-09-02', '17:37:00', '23:40:35', 'JUI-4042', 'Finalizado', 'Aprovado'),
(27, 'Soja', 'Fazenda dos Grãos', 'Japão', '2018-09-02', '17:39:50', '10:35:24', 'SQI-6231', 'Finalizado', 'Aprovado'),
(28, 'Milho', 'Moinho Paulista', 'São Paulo', '2018-09-02', '17:42:15', '20:55:05', 'SQI-2303', 'Finalizado', 'Aprovado'),
(29, 'Soja', 'Fazendeiros Tabajara', 'Japão', '2018-09-02', '17:47:40', '20:54:15', 'FWH-3791', 'Finalizado', 'Aprovado'),
(30, 'Soja', 'Granolandia', 'Santos', '2018-09-11', '10:36:02', '10:38:02', '0WA-6222', 'Finalizado', 'Aprovado'),
(31, 'Milho', 'Fazendeiros Tabajara', 'Taiwan', '2018-09-17', '14:02:10', '13:18:41', 'OSJ-7053', 'Finalizado', 'Aprovado'),
(32, 'Soja', 'Fazendeiros Tabajara', 'São Vicente', '2018-09-17', '14:02:13', '23:39:50', 'YQ8-2455', 'Finalizado', 'Aprovado'),
(33, 'Milho', 'Fazenda dos Grãos', 'Japão', '2018-09-17', '14:02:28', '23:39:32', 'JUI-3604', 'Finalizado', 'Aprovado'),
(34, 'Soja', 'MM Grãos', 'Japão', '2018-09-23', '00:17:43', '00:17:53', 'RSA-5282', 'Finalizado', 'Aprovado'),
(35, 'Soja', 'Granolandia', 'Santos', '2018-09-23', '20:11:02', '12:25:43', 'NWE-3798', 'Finalizado', 'Aprovado'),
(36, 'Soja', 'Fazenda dos Grãos', 'São Paulo', '2018-10-10', '00:55:01', '13:44:38', 'EJN-4070', 'Finalizado', 'Aprovado'),
(37, 'Milho', 'MM Grãos', 'Japão', '2018-10-10', '00:55:11', '14:33:54', 'SQI-3966', 'Finalizado', 'Aprovado'),
(38, 'Milho', 'Fazendeiros Tabajara', 'São Paulo', '2018-10-10', '17:22:34', '17:23:46', 'YQ8-7555', 'Finalizado', 'Aprovado'),
(39, 'Soja', 'MM Grãos', 'Japão', '2018-10-16', '12:22:12', '12:24:17', 'ASD-3732', 'Finalizado', 'Aprovado'),
(40, 'Soja', 'MM Grãos', 'Guaruja', '2018-10-16', '14:40:04', '08:11:57', 'RSD-3462', 'Finalizado', 'Aprovado'),
(41, 'Soja', 'Fazendeiros Tabajara', 'São Paulo', '2018-10-19', '05:30:37', '08:13:03', 'NWE-5658', 'Finalizado', 'Aprovado'),
(42, 'Soja', 'Fazenda dos Grãos', 'São Paulo', '2018-10-20', '18:59:19', NULL, 'OIJ-8481', 'Finalizado', 'Aprovado'),
(43, 'Milho', 'MM Grãos', 'Japão', '2018-10-21', '06:40:01', '08:12:12', 'SQI-7456', 'Finalizado', 'Aprovado'),
(44, 'Milho', 'Fazenda dos Grãos', 'Santos', '2018-10-21', '06:40:06', '08:12:22', 'OSJ-8241', 'Finalizado', 'Aprovado'),
(45, 'Milho', 'Fazendeiros Tabajara', 'São Paulo', '2018-10-21', '08:03:58', '18:17:19', 'NWE-9844', 'Finalizado', 'Reprovado'),
(46, 'Milho', 'Fazenda dos Grãos', 'São Vicente', '2018-10-21', '15:45:46', '01:51:50', 'RSA-2141', 'Finalizado', 'Reprovado'),
(47, 'Soja', 'Moinho Paulista', 'Taiwan', '2018-10-27', '22:46:58', '22:47:09', 'FWH-9824', 'Finalizado', 'Aprovado'),
(48, 'Soja', 'Moinho Paulista', 'São Vicente', '2018-10-27', '22:52:34', '02:40:14', 'AOS-3000', 'Finalizado', 'Reprovado'),
(49, 'Milho', 'Fazenda dos Grãos', 'São Paulo', '2018-10-27', '22:54:06', '18:03:58', '0WA-7179', 'Finalizado', 'Reprovado'),
(50, 'Soja', 'Granolandia', 'Japão', '2018-10-27', '22:55:21', '22:55:30', 'FOA-1917', 'Finalizado', 'Aprovado'),
(51, 'Milho', 'Moinho Paulista', 'São Paulo', '2018-11-04', '18:16:29', '02:43:02', 'RSA-1781', 'Finalizado', 'Reprovado'),
(52, 'Soja', 'Fazenda dos Grãos', 'São Vicente', '2018-11-05', '02:50:13', '02:50:51', 'DFI-3633', 'Finalizado', 'Reprovado'),
(53, 'Soja', 'MM Grãos', 'São Vicente', '2018-11-05', '03:02:57', '03:34:50', 'FWH-2150', 'Finalizado', 'Reprovado'),
(54, 'Milho', 'Fazenda dos Grãos', 'São Vicente', '2018-11-05', '03:36:16', '03:37:00', 'FOA-7711', 'Finalizado', 'Reprovado'),
(55, 'Soja', 'Granolandia', 'Santos', '2018-11-05', '03:44:04', '03:45:43', 'IQG-2580', 'Finalizado', 'Reprovado'),
(56, 'Soja', 'Moinho Paulista', 'Japão', '2018-11-05', '03:44:10', '03:46:12', 'RSA-6985', 'Finalizado', 'Reprovado'),
(57, 'Soja', 'Granolandia', 'Taiwan', '2018-11-05', '03:44:14', '03:47:47', 'IQG-8177', 'Finalizado', 'Aprovado'),
(58, 'Milho', 'Granolandia', 'São Paulo', '2018-11-05', '03:44:17', '03:50:42', 'IQG-9348', 'Finalizado', 'Aprovado'),
(59, 'Soja', 'Granolandia', 'Guaruja', '2018-11-05', '03:59:05', '04:07:37', 'NWE-2216', 'Finalizado', 'Aprovado'),
(60, 'Soja', 'Granolandia', 'Santos', '2018-11-05', '03:59:27', '04:07:43', 'SQI-8293', 'Finalizado', 'Aprovado'),
(61, 'Soja', 'Fazendeiros Tabajara', 'Japão', '2018-11-05', '03:59:57', '04:07:50', 'YQ8-7120', 'Finalizado', 'Aprovado'),
(62, 'Milho', 'Fazendeiros Tabajara', 'Taiwan', '2018-11-05', '04:00:15', '04:07:56', 'OIJ-3774', 'Finalizado', 'Aprovado'),
(63, 'Soja', 'Moinho Paulista', 'Santos', '2018-11-05', '04:01:50', '04:08:39', 'RSA-3632', 'Finalizado', 'Aprovado'),
(64, 'Soja', 'MM Grãos', 'São Vicente', '2018-11-05', '04:02:43', '04:08:15', '0WA-9688', 'Finalizado', 'Aprovado'),
(65, 'Soja', 'Fazendeiros Tabajara', 'Guaruja', '2018-11-05', '04:03:34', '04:08:51', 'SQI-8493', 'Finalizado', 'Reprovado'),
(66, 'Milho', 'Fazendeiros Tabajara', 'Santos', '2018-11-05', '04:09:25', '00:21:36', 'EJN-4063', 'Guarda', 'Reprovado');

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
(321, 'Caruara', 1, '01:49:51', '2018-09-19', 'ANALISTA DE GRAOS'),
(322, 'Caruara', 0, '22:10:30', '2018-09-22', 'ANALISTA DE GRAOS'),
(323, 'Caruara', 0, '22:17:33', '2018-09-22', 'ANALISTA DE GRAOS'),
(324, 'Eduardo', 1, '22:17:38', '2018-09-22', 'GUARDA'),
(325, 'Lara', 1, '22:17:43', '2018-09-22', 'GUARDA'),
(326, 'Nicholas', 1, '22:17:49', '2018-09-22', 'CCO'),
(327, 'Nicholas', 0, '22:17:52', '2018-09-22', 'CCO'),
(328, 'Nicholas', 1, '22:17:57', '2018-09-22', 'CCO'),
(329, 'Nicholas', 0, '22:18:12', '2018-09-22', 'CCO'),
(330, 'Marcos', 1, '22:18:17', '2018-09-22', 'CCO'),
(331, 'Mauro', 1, '22:18:31', '2018-09-22', 'ANALISTA DE GRAOS'),
(332, 'Mauro', 0, '13:30:40', '2018-09-23', 'ANALISTA DE GRAOS'),
(333, 'Caruara', 1, '13:30:46', '2018-09-23', 'ANALISTA DE GRAOS'),
(334, 'Lara', 0, '19:32:27', '2018-09-23', 'GUARDA'),
(335, 'Lara', 1, '19:32:35', '2018-09-23', 'GUARDA'),
(336, 'Lara', 0, '19:38:13', '2018-09-23', 'GUARDA'),
(337, 'Eduardo', 0, '23:58:17', '2018-09-25', 'GUARDA'),
(338, 'Nicholas', 1, '23:58:24', '2018-09-25', 'CCO'),
(339, 'Marcos', 0, '01:18:31', '2018-09-26', 'CCO'),
(340, 'Caruara', 1, '01:18:38', '2018-09-26', 'ANALISTA DE GRAOS'),
(341, 'Caruara', 0, '01:34:34', '2018-09-26', 'ANALISTA DE GRAOS'),
(342, 'Nicholas', 0, '01:34:41', '2018-09-26', 'CCO'),
(343, 'Nicholas', 1, '01:34:51', '2018-09-26', 'CCO'),
(344, 'Eduardo', 1, '01:53:00', '2018-09-26', 'GUARDA'),
(345, 'Lara', 1, '03:49:56', '2018-09-26', 'GUARDA'),
(346, 'Lara', 0, '03:59:13', '2018-09-26', 'GUARDA'),
(347, 'Nicholas', 0, '03:59:28', '2018-09-26', 'CCO'),
(348, 'Eduardo', 0, '03:59:32', '2018-09-26', 'GUARDA'),
(349, 'Nicholas', 1, '07:25:41', '2018-09-26', 'CCO'),
(350, 'Lara', 1, '07:27:08', '2018-09-26', 'GUARDA'),
(351, 'Eduardo', 1, '07:53:04', '2018-09-26', 'GUARDA'),
(352, 'Eduardo', 0, '17:52:25', '2018-09-26', 'GUARDA'),
(353, 'Eduardo', 1, '17:52:32', '2018-09-26', 'GUARDA'),
(354, 'Eduardo', 0, '18:20:10', '2018-09-26', 'GUARDA'),
(355, 'Eduardo', 1, '18:22:16', '2018-09-26', 'GUARDA'),
(356, 'Eduardo', 0, '18:22:36', '2018-09-26', 'GUARDA'),
(357, 'Eduardo', 1, '18:22:56', '2018-09-26', 'GUARDA'),
(358, 'Nicholas', 1, '22:40:33', '2018-09-26', 'CCO'),
(359, 'Eduardo', 1, '22:42:51', '2018-09-26', 'GUARDA'),
(360, 'Eduardo', 0, '22:42:54', '2018-09-26', 'GUARDA'),
(361, 'Caruara', 1, '22:43:00', '2018-09-26', 'ANALISTA DE GRAOS'),
(362, 'Lara', 1, '22:43:16', '2018-09-26', 'GUARDA'),
(363, 'Caruara', 0, '22:43:23', '2018-09-26', 'ANALISTA DE GRAOS'),
(364, 'Marcos', 1, '22:43:30', '2018-09-26', 'CCO'),
(365, 'Lara', 0, '22:47:44', '2018-09-26', 'GUARDA'),
(366, 'Eduardo', 1, '22:48:00', '2018-09-26', 'GUARDA'),
(367, 'Eduardo', 0, '22:49:49', '2018-09-26', 'GUARDA'),
(368, 'Eduardo', 1, '22:52:18', '2018-09-26', 'GUARDA'),
(369, 'Eduardo', 0, '22:52:21', '2018-09-26', 'GUARDA'),
(370, 'Lara', 1, '22:52:50', '2018-09-26', 'GUARDA'),
(371, 'Lara', 0, '22:52:53', '2018-09-26', 'GUARDA'),
(372, 'Lara', 1, '22:54:10', '2018-09-26', 'GUARDA'),
(373, 'Lara', 0, '22:54:14', '2018-09-26', 'GUARDA'),
(374, 'Lara', 1, '22:55:10', '2018-09-26', 'GUARDA'),
(375, 'Lara', 0, '22:55:13', '2018-09-26', 'GUARDA'),
(376, 'Eduardo', 1, '22:55:55', '2018-09-26', 'GUARDA'),
(377, 'Eduardo', 0, '22:56:01', '2018-09-26', 'GUARDA'),
(378, 'Caruara', 1, '22:56:53', '2018-09-26', 'ANALISTA DE GRAOS'),
(379, 'Caruara', 0, '22:57:01', '2018-09-26', 'ANALISTA DE GRAOS'),
(380, 'Eduardo', 1, '22:57:07', '2018-09-26', 'GUARDA'),
(381, 'Eduardo', 0, '22:57:10', '2018-09-26', 'GUARDA'),
(382, 'Lara', 1, '22:57:17', '2018-09-26', 'GUARDA'),
(383, 'Lara', 0, '22:57:21', '2018-09-26', 'GUARDA'),
(384, 'Eduardo', 1, '23:11:17', '2018-09-26', 'GUARDA'),
(385, 'Eduardo', 0, '23:12:49', '2018-09-26', 'GUARDA'),
(386, 'Lara', 1, '23:13:12', '2018-09-26', 'GUARDA'),
(387, 'Lara', 0, '23:13:15', '2018-09-26', 'GUARDA'),
(388, 'Lara', 1, '23:27:17', '2018-09-26', 'GUARDA'),
(389, 'Lara', 1, '22:56:49', '2018-09-30', 'GUARDA'),
(390, 'Lara', 0, '22:57:12', '2018-09-30', 'GUARDA'),
(391, 'Mauro', 1, '22:57:24', '2018-09-30', 'ANALISTA DE GRAOS'),
(392, 'Mauro', 0, '22:57:27', '2018-09-30', 'ANALISTA DE GRAOS'),
(393, 'Mauro', 1, '22:59:05', '2018-09-30', 'ANALISTA DE GRAOS'),
(394, 'Mauro', 0, '23:17:47', '2018-09-30', 'ANALISTA DE GRAOS'),
(395, 'Lara', 1, '23:17:52', '2018-09-30', 'GUARDA'),
(396, 'Lara', 0, '23:18:38', '2018-09-30', 'GUARDA'),
(397, 'Caruara', 1, '23:18:43', '2018-09-30', 'ANALISTA DE GRAOS'),
(398, 'Caruara', 0, '23:18:48', '2018-09-30', 'ANALISTA DE GRAOS'),
(399, 'Lara', 1, '23:20:20', '2018-09-30', 'GUARDA'),
(400, 'Lara', 0, '23:23:18', '2018-09-30', 'GUARDA'),
(401, 'Lara', 1, '23:23:27', '2018-09-30', 'GUARDA'),
(402, 'Lara', 0, '23:23:55', '2018-09-30', 'GUARDA'),
(403, 'Marcos', 1, '23:23:59', '2018-09-30', 'CCO'),
(404, 'Nicholas', 1, '02:03:14', '2018-10-02', 'CCO'),
(405, 'Eduardo', 1, '02:14:26', '2018-10-02', 'GUARDA'),
(406, 'Lara', 1, '02:27:11', '2018-10-02', 'GUARDA'),
(407, 'Lara', 0, '02:27:14', '2018-10-02', 'GUARDA'),
(408, 'Eduardo', 0, '02:27:21', '2018-10-02', 'GUARDA'),
(409, 'Eduardo', 1, '02:27:28', '2018-10-02', 'GUARDA'),
(410, 'Nicholas', 1, '02:39:10', '2018-10-02', 'CCO'),
(411, 'Lara', 1, '03:39:01', '2018-10-02', 'GUARDA'),
(412, 'Lara', 0, '03:39:08', '2018-10-02', 'GUARDA'),
(413, 'Eduardo', 1, '03:39:32', '2018-10-02', 'GUARDA'),
(414, 'Eduardo', 0, '03:39:34', '2018-10-02', 'GUARDA'),
(415, 'Lara', 1, '03:39:41', '2018-10-02', 'GUARDA'),
(416, 'Lara', 0, '03:39:56', '2018-10-02', 'GUARDA'),
(417, 'Lara', 1, '03:41:17', '2018-10-02', 'GUARDA'),
(418, 'Lara', 0, '03:41:25', '2018-10-02', 'GUARDA'),
(419, 'Lara', 1, '03:41:29', '2018-10-02', 'GUARDA'),
(420, 'Lara', 0, '03:44:05', '2018-10-02', 'GUARDA'),
(421, 'Lara', 1, '03:44:17', '2018-10-02', 'GUARDA'),
(422, 'Lara', 0, '03:44:23', '2018-10-02', 'GUARDA'),
(423, 'Lara', 1, '03:44:28', '2018-10-02', 'GUARDA'),
(424, 'Eduardo', 1, '03:44:38', '2018-10-02', 'GUARDA'),
(425, 'Lara', 0, '03:44:41', '2018-10-02', 'GUARDA'),
(426, 'Eduardo', 0, '03:44:47', '2018-10-02', 'GUARDA'),
(427, 'Eduardo', 1, '03:44:57', '2018-10-02', 'GUARDA'),
(428, 'Eduardo', 0, '03:45:01', '2018-10-02', 'GUARDA'),
(429, 'Lara', 1, '03:45:46', '2018-10-02', 'GUARDA'),
(430, 'Lara', 0, '03:45:53', '2018-10-02', 'GUARDA'),
(431, 'Lara', 1, '03:46:00', '2018-10-02', 'GUARDA'),
(432, 'Lara', 0, '03:54:19', '2018-10-02', 'GUARDA'),
(433, 'Eduardo', 1, '03:54:25', '2018-10-02', 'GUARDA'),
(434, 'Caruara', 1, '04:10:34', '2018-10-02', 'ANALISTA DE GRAOS'),
(435, 'Caruara', 0, '04:10:38', '2018-10-02', 'ANALISTA DE GRAOS'),
(436, 'Eduardo', 0, '04:10:43', '2018-10-02', 'GUARDA'),
(437, 'Lara', 1, '04:13:24', '2018-10-02', 'GUARDA'),
(438, 'Lara', 0, '04:44:36', '2018-10-02', 'GUARDA'),
(439, 'Lara', 1, '04:46:41', '2018-10-02', 'GUARDA'),
(440, 'Nicholas', 1, '00:15:09', '2018-10-10', 'CCO'),
(441, 'Nicholas', 1, '00:19:00', '2018-10-10', 'CCO'),
(442, 'Eduardo', 1, '00:23:54', '2018-10-10', 'GUARDA'),
(443, 'Eduardo', 0, '00:24:02', '2018-10-10', 'GUARDA'),
(444, 'Caruara', 1, '12:36:53', '2018-10-10', 'ANALISTA DE GRAOS'),
(445, 'Caruara', 1, '15:53:36', '2018-10-10', 'ANALISTA DE GRAOS'),
(446, 'Caruara', 0, '16:22:01', '2018-10-10', 'ANALISTA DE GRAOS'),
(447, 'Lara', 1, '16:22:07', '2018-10-10', 'GUARDA'),
(448, 'Lara', 0, '16:22:10', '2018-10-10', 'GUARDA'),
(449, 'Eduardo', 1, '16:22:16', '2018-10-10', 'GUARDA'),
(450, 'Eduardo', 0, '16:22:22', '2018-10-10', 'GUARDA'),
(451, 'Lara', 1, '16:22:28', '2018-10-10', 'GUARDA'),
(452, 'Eduardo', 1, '16:22:55', '2018-10-10', 'GUARDA'),
(453, 'Eduardo', 0, '16:32:30', '2018-10-10', 'GUARDA'),
(454, 'Caruara', 1, '16:32:37', '2018-10-10', 'ANALISTA DE GRAOS'),
(455, 'Lara', 0, '16:47:50', '2018-10-10', 'GUARDA'),
(456, 'Caruara', 1, '16:47:54', '2018-10-10', 'ANALISTA DE GRAOS'),
(457, 'Caruara', 0, '16:52:49', '2018-10-10', 'ANALISTA DE GRAOS'),
(458, 'Eduardo', 1, '17:21:26', '2018-10-10', 'GUARDA'),
(459, 'Eduardo', 0, '17:35:10', '2018-10-10', 'GUARDA'),
(460, 'Lara', 1, '17:35:15', '2018-10-10', 'GUARDA'),
(461, 'Caruara', 0, '17:45:10', '2018-10-10', 'ANALISTA DE GRAOS'),
(462, 'Nicholas', 1, '12:21:06', '2018-10-16', 'CCO'),
(463, 'Caruara', 1, '12:24:03', '2018-10-16', 'ANALISTA DE GRAOS'),
(464, 'Nicholas', 0, '12:27:21', '2018-10-16', 'CCO'),
(465, 'Eduardo', 1, '12:27:31', '2018-10-16', 'GUARDA'),
(466, 'Eduardo', 0, '12:27:34', '2018-10-16', 'GUARDA'),
(467, 'Lara', 1, '12:27:37', '2018-10-16', 'GUARDA'),
(468, 'Lara', 0, '12:28:20', '2018-10-16', 'GUARDA'),
(469, 'Nicholas', 1, '12:28:24', '2018-10-16', 'CCO'),
(470, 'Caruara', 0, '12:28:53', '2018-10-16', 'ANALISTA DE GRAOS'),
(471, 'Nicholas', 0, '12:44:22', '2018-10-16', 'CCO'),
(472, 'Caruara', 1, '12:44:32', '2018-10-16', 'ANALISTA DE GRAOS'),
(473, 'Caruara', 0, '13:43:56', '2018-10-16', 'ANALISTA DE GRAOS'),
(474, 'Caruara', 1, '13:44:12', '2018-10-16', 'ANALISTA DE GRAOS'),
(475, 'Nicholas', 1, '13:44:21', '2018-10-16', 'CCO'),
(476, 'Caruara', 0, '14:25:54', '2018-10-16', 'ANALISTA DE GRAOS'),
(477, 'Nicholas', 0, '14:25:54', '2018-10-16', 'CCO'),
(478, 'Nicholas', 1, '14:27:20', '2018-10-16', 'CCO'),
(479, 'Caruara', 1, '14:27:26', '2018-10-16', 'ANALISTA DE GRAOS'),
(480, 'Eduardo', 1, '14:27:33', '2018-10-16', 'GUARDA'),
(481, 'Lara', 1, '14:27:37', '2018-10-16', 'GUARDA'),
(482, 'Caruara', 0, '14:30:37', '2018-10-16', 'ANALISTA DE GRAOS'),
(483, 'Caruara', 1, '14:30:44', '2018-10-16', 'ANALISTA DE GRAOS'),
(484, 'Eduardo', 0, '14:33:37', '2018-10-16', 'GUARDA'),
(485, 'Eduardo', 1, '14:33:44', '2018-10-16', 'GUARDA'),
(486, 'Nicholas', 1, '05:30:06', '2018-10-19', 'CCO'),
(487, 'Nicholas', 1, '12:33:07', '2018-10-20', 'CCO'),
(488, 'Caruara', 1, '15:12:57', '2018-10-20', 'ANALISTA DE GRAOS'),
(489, 'Lara', 1, '15:16:20', '2018-10-20', 'GUARDA'),
(490, 'Lara', 0, '15:16:22', '2018-10-20', 'GUARDA'),
(491, 'Eduardo', 1, '15:16:28', '2018-10-20', 'GUARDA'),
(492, 'Eduardo', 0, '15:16:33', '2018-10-20', 'GUARDA'),
(493, 'Eduardo', 1, '15:16:40', '2018-10-20', 'GUARDA'),
(494, 'Eduardo', 0, '15:17:52', '2018-10-20', 'GUARDA'),
(495, 'Nicholas', 0, '15:17:56', '2018-10-20', 'CCO'),
(496, 'Nicholas', 1, '17:27:24', '2018-10-20', 'CCO'),
(497, 'Caruara', 0, '18:45:33', '2018-10-27', 'ANALISTA DE GRAOS'),
(498, 'Nicholas', 1, '19:56:04', '2018-10-27', 'CCO'),
(499, 'Nicholas', 0, '19:57:20', '2018-10-27', 'CCO'),
(500, 'Nicholas', 1, '19:57:29', '2018-10-27', 'CCO'),
(501, 'Nicholas', 0, '19:59:21', '2018-10-27', 'CCO'),
(502, 'Nicholas', 0, '19:59:24', '2018-10-27', 'CCO'),
(503, 'Nicholas', 1, '20:19:40', '2018-10-27', 'CCO'),
(504, 'Nicholas', 0, '21:21:07', '2018-10-27', 'CCO'),
(505, 'Nicholas', 1, '21:31:14', '2018-10-27', 'CCO'),
(506, 'Caruara', 1, '22:28:07', '2018-10-27', 'ANALISTA DE GRAOS'),
(507, 'Nicholas', 0, '23:18:54', '2018-10-27', 'CCO'),
(508, 'Nicholas', 1, '23:19:16', '2018-10-27', 'CCO'),
(509, 'Nicholas', 0, '23:20:26', '2018-10-27', 'CCO'),
(510, 'Caruara', 0, '23:38:25', '2018-10-27', 'ANALISTA DE GRAOS'),
(511, 'Nicholas', 1, '17:14:45', '2018-10-28', 'CCO'),
(512, 'Nicholas', 0, '02:02:16', '2018-10-29', 'CCO'),
(513, 'Nicholas', 1, '02:06:51', '2018-10-29', 'CCO'),
(514, 'Nicholas', 1, '10:23:03', '2018-10-30', 'CCO'),
(515, 'Nicholas', 0, '11:26:52', '2018-10-30', 'CCO'),
(516, 'Nicholas', 0, '20:40:28', '2018-10-31', 'CCO'),
(517, 'Eduardo', 1, '22:18:54', '2018-10-31', 'GUARDA'),
(518, 'Eduardo', 1, '23:34:28', '2018-10-31', 'GUARDA'),
(519, 'Eduardo', 1, '11:26:12', '2018-11-03', 'GUARDA'),
(520, 'Eduardo', 0, '11:45:23', '2018-11-03', 'GUARDA'),
(521, 'Eduardo', 1, '11:45:35', '2018-11-03', 'GUARDA'),
(522, 'Eduardo', 0, '11:47:47', '2018-11-03', 'GUARDA'),
(523, 'Eduardo', 1, '11:47:53', '2018-11-03', 'GUARDA'),
(524, 'Eduardo', 0, '11:48:25', '2018-11-03', 'GUARDA'),
(525, 'Eduardo', 1, '11:48:30', '2018-11-03', 'GUARDA'),
(526, 'Eduardo', 0, '11:49:00', '2018-11-03', 'GUARDA'),
(527, 'Eduardo', 1, '11:49:04', '2018-11-03', 'GUARDA'),
(528, 'Eduardo', 0, '11:49:24', '2018-11-03', 'GUARDA'),
(529, 'Eduardo', 1, '11:49:29', '2018-11-03', 'GUARDA'),
(530, 'Eduardo', 0, '11:49:57', '2018-11-03', 'GUARDA'),
(531, 'Eduardo', 1, '11:50:07', '2018-11-03', 'GUARDA'),
(532, 'Eduardo', 0, '11:50:35', '2018-11-03', 'GUARDA'),
(533, 'Eduardo', 1, '11:50:40', '2018-11-03', 'GUARDA'),
(534, 'Marcos', 1, '12:06:17', '2018-11-03', 'CCO'),
(535, 'Marcos', 0, '12:06:29', '2018-11-03', 'CCO'),
(536, 'Lara', 1, '12:06:35', '2018-11-03', 'GUARDA'),
(537, 'Eduardo', 0, '14:20:05', '2018-11-03', 'GUARDA'),
(538, 'Eduardo', 1, '14:20:10', '2018-11-03', 'GUARDA'),
(539, 'Marcos', 1, '16:26:30', '2018-11-03', 'CCO'),
(540, 'Eduardo', 0, '17:40:57', '2018-11-04', 'GUARDA'),
(541, 'Nicholas', 1, '17:41:04', '2018-11-04', 'CCO'),
(542, 'Nicholas', 1, '17:54:09', '2018-11-04', 'CCO'),
(543, 'Nicholas', 0, '18:16:36', '2018-11-04', 'CCO'),
(544, 'Caruara', 1, '18:16:40', '2018-11-04', 'ANALISTA DE GRAOS'),
(545, 'Caruara', 0, '18:17:04', '2018-11-04', 'ANALISTA DE GRAOS'),
(546, 'Nicholas', 1, '18:17:10', '2018-11-04', 'CCO'),
(547, 'Eduardo', 1, '01:28:04', '2018-11-05', 'GUARDA'),
(548, 'Eduardo', 0, '01:50:49', '2018-11-05', 'GUARDA'),
(549, 'Lara', 1, '01:50:53', '2018-11-05', 'GUARDA'),
(550, 'Nicholas', 0, '02:26:11', '2018-11-05', 'CCO'),
(551, 'Eduardo', 1, '02:26:20', '2018-11-05', 'GUARDA'),
(552, 'Nicholas', 1, '02:39:10', '2018-11-05', 'CCO'),
(553, 'Nicholas', 0, '02:39:16', '2018-11-05', 'CCO'),
(554, 'Caruara', 1, '02:39:20', '2018-11-05', 'ANALISTA DE GRAOS'),
(555, 'Caruara', 0, '02:39:40', '2018-11-05', 'ANALISTA DE GRAOS'),
(556, 'Marcos', 1, '02:39:46', '2018-11-05', 'CCO'),
(557, 'Marcos', 0, '02:40:43', '2018-11-05', 'CCO'),
(558, 'Caruara', 1, '02:40:47', '2018-11-05', 'ANALISTA DE GRAOS'),
(559, 'Caruara', 0, '02:41:02', '2018-11-05', 'ANALISTA DE GRAOS'),
(560, 'Marcos', 1, '02:41:08', '2018-11-05', 'CCO'),
(561, 'Marcos', 0, '02:49:58', '2018-11-05', 'CCO'),
(562, 'Caruara', 1, '02:50:02', '2018-11-05', 'ANALISTA DE GRAOS'),
(563, 'Caruara', 0, '02:50:27', '2018-11-05', 'ANALISTA DE GRAOS'),
(564, 'Nicholas', 1, '02:50:33', '2018-11-05', 'CCO'),
(565, 'Nicholas', 0, '03:02:45', '2018-11-05', 'CCO'),
(566, 'Caruara', 1, '03:02:51', '2018-11-05', 'ANALISTA DE GRAOS'),
(567, 'Caruara', 0, '03:14:51', '2018-11-05', 'ANALISTA DE GRAOS'),
(568, 'Marcos', 1, '03:14:56', '2018-11-05', 'CCO'),
(569, 'Nicholas', 1, '03:34:11', '2018-11-05', 'CCO'),
(570, 'Nicholas', 0, '03:36:06', '2018-11-05', 'CCO'),
(571, 'Caruara', 1, '03:36:10', '2018-11-05', 'ANALISTA DE GRAOS'),
(572, 'Caruara', 0, '03:36:42', '2018-11-05', 'ANALISTA DE GRAOS'),
(573, 'Nicholas', 1, '03:36:49', '2018-11-05', 'CCO'),
(574, 'Nicholas', 0, '03:43:53', '2018-11-05', 'CCO'),
(575, 'Caruara', 1, '03:43:58', '2018-11-05', 'ANALISTA DE GRAOS'),
(576, 'Caruara', 0, '03:45:03', '2018-11-05', 'ANALISTA DE GRAOS'),
(577, 'Nicholas', 1, '03:45:09', '2018-11-05', 'CCO'),
(578, 'Nicholas', 0, '04:07:18', '2018-11-05', 'CCO'),
(579, NULL, 0, '04:07:20', '2018-11-05', NULL),
(580, 'Caruara', 1, '04:07:27', '2018-11-05', 'ANALISTA DE GRAOS'),
(581, 'Caruara', 0, '04:08:25', '2018-11-05', 'ANALISTA DE GRAOS'),
(582, 'Marcos', 1, '04:08:32', '2018-11-05', 'CCO'),
(583, 'Marcos', 0, '04:09:14', '2018-11-05', 'CCO'),
(584, 'Caruara', 1, '04:09:19', '2018-11-05', 'ANALISTA DE GRAOS'),
(585, 'Eduardo', 0, '00:05:38', '2018-11-06', 'GUARDA'),
(586, 'Nicholas', 1, '00:05:44', '2018-11-06', 'CCO'),
(587, 'Lara', 0, '00:15:37', '2018-11-06', 'GUARDA'),
(588, 'Caruara', 1, '00:15:44', '2018-11-06', 'ANALISTA DE GRAOS'),
(589, 'Caruara', 0, '00:21:24', '2018-11-06', 'ANALISTA DE GRAOS'),
(590, 'Lara', 1, '00:21:30', '2018-11-06', 'GUARDA');

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
(17, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 25, 'Milho'),
(18, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 34, 'Soja'),
(19, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 26, 'Milho'),
(20, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 26, 'Milho'),
(21, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 33, 'Milho'),
(22, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 26, 'Milho'),
(23, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 32, 'Soja'),
(24, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 26, 'Milho'),
(25, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 33, 'Milho'),
(26, 4, 'CCO', 'Lara Croft', 'Reprovado', 'Finalizado', 33, 'Milho'),
(27, 3, 'CCO', 'Lara Croft', 'Reprovado', 'Finalizado', 32, 'Soja'),
(28, 9, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 26, 'Milho'),
(29, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 31, 'Milho'),
(30, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 37, 'Milho'),
(31, 1, 'CCO', 'Eduardo', 'Reprovado', 'Finalizado', 38, 'Milho'),
(32, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 39, 'Soja'),
(33, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 37, 'Milho'),
(34, 2, 'CCO', '0', 'Aprovado', 'Finalizado', 35, 'Soja'),
(35, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 36, 'Soja'),
(36, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 37, 'Milho'),
(37, 5, 'CCO', 'Eduardo', 'Reprovado', 'Finalizado', 37, 'Milho'),
(38, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 40, 'Soja'),
(39, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 43, 'Milho'),
(40, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 44, 'Milho'),
(41, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 41, 'Soja'),
(42, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 42, 'Soja'),
(43, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 42, 'Soja'),
(44, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(45, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(46, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 17, 'Soja'),
(47, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(48, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(49, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(50, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(51, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(52, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 46, 'Milho'),
(53, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(54, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 46, 'Milho'),
(55, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 47, 'Soja'),
(56, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(57, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(58, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 49, 'Milho'),
(59, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 50, 'Soja'),
(60, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 45, 'Milho'),
(61, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 48, 'Soja'),
(62, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 49, 'Milho'),
(63, 3, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 49, 'Milho'),
(64, 18, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 45, 'Milho'),
(65, 6, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 46, 'Milho'),
(66, 3, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 48, 'Soja'),
(67, 1, 'CCO', 'Eduardo', 'Reprovado', 'Finalizado', 51, 'Milho'),
(68, 1, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 52, 'Soja'),
(69, 1, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 53, 'Soja'),
(70, 1, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 54, 'Milho'),
(71, 1, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 55, 'Soja'),
(72, 1, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 56, 'Soja'),
(73, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 57, 'Soja'),
(74, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 58, 'Milho'),
(75, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 59, 'Soja'),
(76, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 60, 'Soja'),
(77, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 61, 'Soja'),
(78, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 62, 'Milho'),
(79, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 64, 'Soja'),
(80, 1, 'CCO', '0', 'Aprovado', 'Finalizado', 63, 'Soja'),
(81, 1, 'CCO', 'Eduardo', 'Reprovado', 'Finalizado', 65, 'Soja'),
(82, 1, 'Analista', '0', 'Aprovado', 'Finalizado', 66, 'Milho'),
(83, 3, 'CCO', 'Lara', 'Reprovado', 'Finalizado', 66, 'Milho');

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
  `status_atual` varchar(30) DEFAULT 'Offline',
  `situacao` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `senha`, `cargo`, `nome_completo`, `status_atual`, `situacao`) VALUES
('Caruara', 'mestra', 'ANALISTA DE GRAOS', 'Anderton Aleluia', 'Offline', NULL),
('Eduardo', 'mestra', 'GUARDA', 'Eduardo Portos', 'Offline', 'Disponivel'),
('Jessica', 'mestra', 'ANALISTA DE GRAOS', 'Jessica Portos', 'Offline', NULL),
('Lara', 'mestra', 'GUARDA', 'Lara Croft', 'Online', 'Disponivel'),
('Marcos', 'mestra', 'CCO', 'Marcos o CCO', 'Offline', NULL),
('Mauricio', 'mestra', 'GUARDA', 'Mauricio Mendonça', 'Offline', 'Disponivel'),
('Mauro', 'mestra', 'ANALISTA DE GRAOS', 'Mauro O Analista', 'Offline', NULL),
('Mazzei', 'mestra', 'CCO', 'Mazzei Testando', 'Offline', NULL),
('Nicholas', 'mestra', 'CCO', 'Nicholas Wesley Mazzei', 'Online', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `analise_manual`
--
ALTER TABLE `analise_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

--
-- AUTO_INCREMENT for table `carac_graos`
--
ALTER TABLE `carac_graos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `info_cargas`
--
ALTER TABLE `info_cargas`
  MODIFY `id_carga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `logs_func`
--
ALTER TABLE `logs_func`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;

--
-- AUTO_INCREMENT for table `log_analise`
--
ALTER TABLE `log_analise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
