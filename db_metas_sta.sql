-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2021 at 11:48 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `metas_sta`
--

CREATE DATABASE db_metas_sta CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE db_metas_sta;

-- --------------------------------------------------------

--
-- Table structure for table `fontes_evidencias_qualit`
--

CREATE TABLE `fontes_evidencias_qualit` (
  `CD_DOC` int(11) NOT NULL,
  `CD_METAS_QUALIT` int(11) DEFAULT NULL,
  `CD_SETOR` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` varchar(128) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `fontes_evidencias_qualit`
--
DELIMITER $$
CREATE TRIGGER `CK_fontes_qualit_relations` BEFORE INSERT ON `fontes_evidencias_qualit` FOR EACH ROW BEGIN
	-- Verificar se o usuário não atrelou ao documento nem o setor, nem o metas_fisicas
    -- Para os campos CD_METAS_FISICAS e CD_SETOR
	IF NEW.CD_METAS_QUALIT IS NULL AND NEW.CD_SETOR IS NULL THEN
    	CALL wsp.error( 'É necessário informar um dos dois (setor, setor_proesso)!' );
    END IF;
    
    -- Verificar se o usuário atrelou ambos os códigos: CD_METAS_FISICAS, CD_SETOR
    IF NEW.CD_METAS_QUALIT IS NOT NULL AND NEW.CD_SETOR IS NOT NULL THEN
    	CALL wsp.error( 'É necessário informar apenas um código.' );
	END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `fontes_evidencia_fisicas`
--

CREATE TABLE `fontes_evidencia_fisicas` (
  `CD_DOC` int(11) NOT NULL,
  `CD_METAS_FISICAS` int(11) NOT NULL,
  `CD_PROCESSO` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` text NOT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `fontes_evidencia_fisicas`
--
DELIMITER $$
CREATE TRIGGER `CK_fontes_fisicas_relations` BEFORE INSERT ON `fontes_evidencia_fisicas` FOR EACH ROW BEGIN
	-- Verificar se o usuário não atrelou ao documento nem o setor, nem o metas_fisic
    -- Para os campos CD_METAS_FISICAS e CD_SETOR
	IF NEW.CD_METAS_FISICAS IS NULL AND NEW.CD_PROCESSO IS NULL THEN
    	CALL wsp.error( 'É necessário informar um dos dois (setor, setor_proesso)!' );
    END IF;
    
    -- Verificar se o usuário atrelou ambos os códigos: CD_METAS_FISIC, CD_SETOR
    IF NEW.CD_METAS_FISICAS IS NOT NULL AND NEW.CD_PROCESSO IS NOT NULL THEN
    	CALL wsp.error( 'É necessário informar apenas um código.' );
	END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `metas_fisicas`
--

CREATE TABLE `metas_fisicas` (
  `CD_METAS_FISICAS` int(11) NOT NULL,
  `CD_SETOR` int(11) NOT NULL,
  `CD_PROCESSO` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `NR_META` int(11) NOT NULL,
  `NR_CONSTATACOES` float(11,2) DEFAULT 0.00,
  `NR_EVID_APRESENTA` int(11) DEFAULT NULL,
  `DS_JUSTIFIC` text DEFAULT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metas_fisicas`
--

INSERT INTO `metas_fisicas` (`CD_METAS_FISICAS`, `CD_SETOR`, `CD_PROCESSO`, `CD_USUARIO`, `NR_META`, `NR_CONSTATACOES`, `NR_EVID_APRESENTA`, `DS_JUSTIFIC`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 1, 1, 1, 230, 12.50, NULL, NULL, '2021-08-06 09:48:53', '2021-08-06 09:48:53'),
(2, 2, 1, 1, 160, 12.50, NULL, NULL, '2021-08-06 09:51:39', '2021-08-06 09:51:39'),
(3, 3, 1, 1, 30, 12.50, NULL, NULL, '2021-08-06 10:02:32', '2021-08-06 10:04:11'),
(4, 4, 1, 1, 187, 12.50, NULL, NULL, '2021-08-06 10:03:14', '2021-08-06 10:04:17'),
(5, 5, 1, 1, 192, 12.50, NULL, NULL, '2021-08-06 10:05:55', '2021-08-06 10:06:30'),
(6, 6, 1, 1, 20, 12.50, NULL, NULL, '2021-08-06 10:06:52', '2021-08-06 10:08:30'),
(7, 7, 1, 1, 90, 12.50, NULL, NULL, '2021-08-06 10:07:26', '2021-08-06 10:08:35'),
(8, 8, 1, 1, 471, 12.50, NULL, NULL, '2021-08-06 10:09:14', '2021-08-06 10:09:40'),
(9, 1, 2, 1, 60, 28.60, NULL, NULL, '2021-08-06 10:11:36', '2021-08-06 10:11:59'),
(10, 2, 2, 1, 3, 28.60, NULL, NULL, '2021-08-06 10:14:30', '2021-08-06 10:17:56'),
(11, 6, 2, 1, 70, 28.60, NULL, NULL, '2021-08-06 10:15:57', '2021-08-06 10:17:59'),
(12, 10, 2, 1, 25, 28.60, NULL, NULL, '2021-08-06 10:17:11', '2021-08-06 10:18:06'),
(13, 11, 2, 1, 20, 28.60, NULL, NULL, '2021-08-06 10:20:37', '2021-08-06 10:22:07'),
(14, 12, 2, 1, 100, 28.60, NULL, NULL, '2021-08-06 10:21:47', '2021-08-06 10:22:11'),
(15, 13, 3, 1, 2155, 25.00, NULL, NULL, '2021-08-06 10:24:52', '2021-08-06 10:28:28'),
(16, 14, 3, 1, 350, 25.00, NULL, NULL, '2021-08-06 10:25:49', '2021-08-06 10:28:32'),
(17, 15, 3, 1, 300, 25.00, NULL, NULL, '2021-08-06 10:26:49', '2021-08-06 10:28:36'),
(18, 16, 3, 1, 30, 25.00, NULL, NULL, '2021-08-06 10:27:50', '2021-08-06 10:28:40'),
(20, 17, 4, 1, 250, 8.30, NULL, NULL, '2021-08-06 10:38:58', '2021-08-06 11:03:56'),
(21, 6, 4, 1, 125, 8.30, NULL, NULL, '2021-08-06 10:41:03', '2021-08-06 10:41:03'),
(22, 3, 4, 1, 750, 8.30, NULL, NULL, '2021-08-06 10:43:56', '2021-08-06 10:43:56'),
(23, 9, 4, 1, 50, 8.30, NULL, NULL, '2021-08-06 10:52:47', '2021-08-06 10:52:47'),
(24, 18, 4, 1, 60, 8.30, NULL, NULL, '2021-08-06 10:55:07', '2021-08-06 10:55:07'),
(25, 19, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 10:55:54', '2021-08-06 10:55:54'),
(26, 20, 4, 1, 30, 8.30, NULL, NULL, '2021-08-06 10:56:34', '2021-08-06 10:56:34'),
(27, 21, 4, 1, 110, 8.30, NULL, NULL, '2021-08-06 10:57:15', '2021-08-06 10:57:15'),
(28, 22, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 10:57:43', '2021-08-06 10:57:43'),
(29, 1, 4, 1, 550, 8.30, NULL, NULL, '2021-08-06 10:58:25', '2021-08-06 10:58:25'),
(30, 11, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 10:59:11', '2021-08-06 10:59:11'),
(31, 21, 4, 1, 110, 8.30, NULL, NULL, '2021-08-06 11:13:32', '2021-08-06 11:13:32'),
(32, 22, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 11:15:30', '2021-08-06 11:15:30'),
(33, 1, 4, 1, 550, 8.30, NULL, NULL, '2021-08-06 11:34:40', '2021-08-06 11:34:40'),
(34, 11, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 11:35:35', '2021-08-06 11:35:35'),
(35, 23, 4, 1, 200, 8.30, NULL, NULL, '2021-08-06 11:36:11', '2021-08-06 11:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `metas_qualit`
--

CREATE TABLE `metas_qualit` (
  `CD_METAS_QUALIT` int(11) NOT NULL,
  `CD_SETOR` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `NR_CONSTATACOES` float(11,2) DEFAULT 0.00,
  `NR_EVID_APRESENTA` float(11,2) DEFAULT 0.00,
  `DS_JUSTIFIC` text DEFAULT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `processos`
--

CREATE TABLE `processos` (
  `CD_PROCESSO` int(11) NOT NULL,
  `DS_NOME` varchar(255) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processos`
--

INSERT INTO `processos` (`CD_PROCESSO`, `DS_NOME`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 'E1 - INTERNAÇÕES', '2021-08-06 08:50:42', '2021-08-08 16:50:51'),
(2, 'E2  - CIRURGIAS ELETIVAS E CIRURGIAS DE TRAUMATOLOGIA /ORTOPEDIA (FECHADAS)\r\n', '2021-08-06 08:50:43', '2021-08-08 16:20:03'),
(3, 'E3 - ATENDIMENTOS AMBULATORIAS\r\n', '2021-08-06 08:50:43', '2021-08-08 16:20:09'),
(4, 'E4 - CONSULTAS AMBULATORIAIS\r\n', '2021-08-06 08:50:43', '2021-08-08 16:20:16'),
(5, 'E5 - EXAMES\r\n\r\n', '2021-08-06 08:50:44', '2021-08-08 16:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `setores`
--

CREATE TABLE `setores` (
  `CD_SETOR` int(11) NOT NULL,
  `DS_NOME` varchar(64) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setores`
--

INSERT INTO `setores` (`CD_SETOR`, `DS_NOME`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 'TRAUMATOLOGIA / ORTOPEDIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(2, 'NEUROLOGIA / NEUROCIRURGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(3, 'ONCOLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(4, 'OBSTETRICIA / PARTO CESAREANO', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(5, 'OBSTETRICIA / PARTO NORMAL', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(6, 'GINECOLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(7, 'PEDIATRIA / NEONATOLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(8, 'CLINICA GERAL + CIRURGIAS DE URGENCIA (EXCETO TRAUMA)', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(9, 'CIRURGIA GERAL', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(10, 'CIRURGIA UROLOGICA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(11, 'OTORRINOLARINGOLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(12, 'CIRURIGAS DE TRAUMATOLIGA / ORTOPEDIA (FECHADAS )', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(13, 'ATENDIMENTOS DE URGêNCIA / EMERGÊNCIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(14, 'TRAT. CONSERVADOR TRAUMATOLOGIA / ORTPEDIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(15, 'CIRURGIAS AMBULATORIAIS', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(16, 'PULSOTERAPIAS / INFUSÃO DE FARMÁCOS', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(17, 'NEUROLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(18, 'CIRURGIA PLASTICA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(19, 'CIRURGIA DE CABEÇA E PESCOÇO (Exceto Oncológica)', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(20, 'REUMATOLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(21, 'NEFROLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(22, 'UROLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(23, 'FONOAUDIOLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(24, 'LABORATORIO CLINICO', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(25, 'ELETROENCEFALOGRAMA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(26, 'ELETRONEUROMIOGRAFIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(27, 'ECODOPPLER ARTERIAL (ADULTO )', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(28, 'ECODOPPLER ARTERIAL (NEONATAL)', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(29, 'ULTRASSONOGRAFIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(30, 'ENDOSCOPIA DIGESTIVA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(31, 'COLONOSCOPIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(32, 'RETOSSIGMOIDOSCOPIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(33, 'ANATOMIA PATOLÓGICA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(34, 'IMUNOHISTOQUIMICA DE NEOPLASIAS MALIG', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(35, 'RADIOGRAFIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(36, 'MAMOGRAFIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(37, 'ULTRASSONOGRAFIA COM DOPPLER - OBSTETRICIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(38, 'ULTRASSONOGRAFIA AMB OBSTETRICIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(39, 'CARDIOTOCOGRAFIA AMBULATORIAL', '2021-08-08 12:57:41', '2021-08-08 12:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `CD_USUARIO` int(11) NOT NULL,
  `DS_LOGIN` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DS_SENHA` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`CD_USUARIO`, `DS_LOGIN`, `DS_SENHA`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 'admin', 'admin', '2021-08-08 10:19:59', '2021-08-08 10:19:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  ADD PRIMARY KEY (`CD_DOC`),
  ADD KEY `FK_fontes_setor` (`CD_SETOR`),
  ADD KEY `FK_fontes_metas_qualit` (`CD_METAS_QUALIT`) USING BTREE;

--
-- Indexes for table `fontes_evidencia_fisicas`
--
ALTER TABLE `fontes_evidencia_fisicas`
  ADD PRIMARY KEY (`CD_DOC`),
  ADD KEY `FK_fontes_metas_fisicas` (`CD_METAS_FISICAS`),
  ADD KEY `FK_fontes_processo` (`CD_PROCESSO`);

--
-- Indexes for table `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD PRIMARY KEY (`CD_METAS_FISICAS`),
  ADD KEY `FK_metas_fisicas_setor` (`CD_SETOR`),
  ADD KEY `FK_metas_fisicas_processo` (`CD_PROCESSO`),
  ADD KEY `FK_metas_fisicas_usuario` (`CD_USUARIO`);

--
-- Indexes for table `metas_qualit`
--
ALTER TABLE `metas_qualit`
  ADD PRIMARY KEY (`CD_METAS_QUALIT`),
  ADD KEY `FK_metas_qualit_setor` (`CD_SETOR`),
  ADD KEY `FK_metas_qualit_usuario` (`CD_USUARIO`);

--
-- Indexes for table `processos`
--
ALTER TABLE `processos`
  ADD PRIMARY KEY (`CD_PROCESSO`),
  ADD UNIQUE KEY `DS_NOME` (`DS_NOME`);

--
-- Indexes for table `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`CD_SETOR`),
  ADD UNIQUE KEY `DS_NOME` (`DS_NOME`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`CD_USUARIO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fontes_evidencia_fisicas`
--
ALTER TABLE `fontes_evidencia_fisicas`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  MODIFY `CD_METAS_FISICAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `metas_qualit`
--
ALTER TABLE `metas_qualit`
  MODIFY `CD_METAS_QUALIT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `processos`
--
ALTER TABLE `processos`
  MODIFY `CD_PROCESSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `setores`
--
ALTER TABLE `setores`
  MODIFY `CD_SETOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `CD_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  ADD CONSTRAINT `FK_fontes_metas_qualit` FOREIGN KEY (`CD_METAS_QUALIT`) REFERENCES `metas_qualit` (`CD_METAS_QUALIT`),
  ADD CONSTRAINT `FK_fontes_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`);

--
-- Constraints for table `fontes_evidencia_fisicas`
--
ALTER TABLE `fontes_evidencia_fisicas`
  ADD CONSTRAINT `FK_fontes_metas_fisicas` FOREIGN KEY (`CD_METAS_FISICAS`) REFERENCES `metas_fisicas` (`CD_METAS_FISICAS`),
  ADD CONSTRAINT `FK_fontes_processo` FOREIGN KEY (`CD_PROCESSO`) REFERENCES `processos` (`CD_PROCESSO`);

--
-- Constraints for table `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD CONSTRAINT `FK_metas_fisicas_processo` FOREIGN KEY (`CD_PROCESSO`) REFERENCES `processos` (`CD_PROCESSO`),
  ADD CONSTRAINT `FK_metas_fisicas_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`),
  ADD CONSTRAINT `FK_metas_fisicas_usuario` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`);

--
-- Constraints for table `metas_qualit`
--
ALTER TABLE `metas_qualit`
  ADD CONSTRAINT `FK_metas_qualit_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`),
  ADD CONSTRAINT `FK_metas_qualit_usuario` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
