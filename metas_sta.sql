-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 08/08/2021 às 09:20
-- Versão do servidor: 5.7.28-0ubuntu0.16.04.2-log
-- Versão do PHP: 7.1.32-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `metas_sta`
--

CREATE DATABASE mydatabase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fontes_evidencias_qualit`
--

CREATE TABLE `usuarios` (
  `CD_USUARIO` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `DS_LOGIN` VARCHAR(128) NOT NULL,
  `DS_SENHA` VARCHAR(128) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `fontes_evidencias_qualit` (
  `CD_DOC` int(11) NOT NULL,
  `CD_METAS_QUALIT` int(11) DEFAULT NULL,
  `CD_SETOR` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` varchar(128) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gatilhos `fontes_evidencias_qualit`
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
-- Estrutura para tabela `fontes_evidencia_fisicas`
--

CREATE TABLE `fontes_evidencia_fisicas` (
  `CD_DOC` int(11) NOT NULL,
  `CD_METAS_FISICAS` int(11) NOT NULL,
  `CD_PROCESSO` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` text NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gatilhos `fontes_evidencia_fisicas`
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
-- Estrutura para tabela `metas_qualit`
--

CREATE TABLE `metas_qualit` (
  `CD_METAS_QUALIT` int(11) NOT NULL,
  `CD_SETOR` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `NR_CONSTATACOES` float(4,2) NOT NULL,
  `NR_EVID_APRESENTA` int(11) NOT NULL,
  `DS_JUSTIFIC` text NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `processos`
--

CREATE TABLE `processos` (
  `CD_PROCESSO` int(11) NOT NULL,
  `DS_NOME` varchar(255) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `processos`
--

INSERT INTO `processos` (`CD_PROCESSO`, `DS_NOME`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 'E1- INTERNAÇÕES - 100 pontos', '2021-08-06 08:50:42', '2021-08-06 08:50:42'),
(2, 'E2  -- CIRURGIAS ELETIVAS E CIRURGIAS DE TRAUMATOLOGIA /ORTOPEDIA (FECHADAS) - 200 pontos\n', '2021-08-06 08:50:43', '2021-08-06 08:50:43'),
(3, 'E3 -ATENDIMENTOS AMBULATORIAS- 100 pontos\n', '2021-08-06 08:50:43', '2021-08-06 08:50:43'),
(4, 'E4 - CONSULTAS AMBULATORIAIS - 100 PONTOS \n', '2021-08-06 08:50:43', '2021-08-06 08:50:43'),
(5, 'E4 - EXAMES - 100 PONTOS \n', '2021-08-06 08:50:44', '2021-08-06 08:50:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

CREATE TABLE `setores` (
  `CD_SETOR` int(11) NOT NULL,
  `DS_NOME` varchar(64) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `setores`
--

INSERT INTO `setores` (`CD_SETOR`, `DS_NOME`) VALUES
(33, 'ANATOMIA PATOLÓGICA'),
(13, 'ATENDIMENTOS DE URGêNCIA / EMERGÊNCIA'),
(39, 'CARDIOTOCOGRAFIA AMBULATORIAL'),
(19, 'CIRURGIA DE CABEÇA E PESCOÇO (Exceto Oncológica)'),
(9, 'CIRURGIA GERAL'),
(18, 'CIRURGIA PLASTICA'),
(10, 'CIRURGIA UROLOGICA'),
(15, 'CIRURGIAS AMBULATORIAIS'),
(12, 'CIRURIGAS DE TRAUMATOLIGA / ORTOPEDIA (FECHADAS )'),
(8, 'CLINICA GERAL + CIRURGIAS DE URGENCIA (EXCETO TRAUMA)'),
(31, 'COLONOSCOPIA'),
(27, 'ECODOPPLER ARTERIAL (ADULTO )'),
(28, 'ECODOPPLER ARTERIAL (NEONATAL)'),
(25, 'ELETROENCEFALOGRAMA'),
(26, 'ELETRONEUROMIOGRAFIA'),
(30, 'ENDOSCOPIA DIGESTIVA'),
(23, 'FONOAUDIOLOGIA'),
(6, 'GINECOLOGIA'),
(34, 'IMUNOHISTOQUIMICA DE NEOPLASIAS MALIG'),
(24, 'LABORATORIO CLINICO'),
(36, 'MAMOGRAFIA'),
(21, 'NEFROLOGIA'),
(17, 'NEUROLOGIA'),
(2, 'NEUROLOGIA / NEUROCIRURGIA'),
(4, 'OBSTETRICIA / PARTO CESAREANO'),
(5, 'OBSTETRICIA / PARTO NORMAL'),
(3, 'ONCOLOGIA'),
(11, 'OTORRINOLARINGOLOGIA'),
(7, 'PEDIATRIA / NEONATOLOGIA'),
(16, 'PULSOTERAPIAS / INFUSÃO DE FARMÁCOS'),
(35, 'RADIOGRAFIA'),
(32, 'RETOSSIGMOIDOSCOPIA'),
(20, 'REUMATOLOGIA'),
(14, 'TRAT. CONSERVADOR TRAUMATOLOGIA / ORTPEDIA'),
(1, 'TRAUMATOLOGIA / ORTOPEDIA'),
(29, 'ULTRASSONOGRAFIA'),
(38, 'ULTRASSONOGRAFIA AMB OBSTETRICIA'),
(37, 'ULTRASSONOGRAFIA COM DOPPLER - OBSTETRICIA'),
(22, 'UROLOGIA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `metas_fisicas`
--

CREATE TABLE `metas_fisicas` (
  `CD_METAS_FISICAS` int(11) NOT NULL,
  `CD_SETOR` int(11) NOT NULL,
  `CD_PROCESSO` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `NR_META` int(11) NOT NULL,
  `NR_CONSTATACOES` float(4,2) DEFAULT NULL,
  `NR_EVID_APRESENTA` int(11) DEFAULT NULL,
  `DS_JUSTIFIC` text,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `metas_fisicas`
--

INSERT INTO `metas_fisicas` (`CD_METAS_FISICAS`, `CD_SETOR`, `CD_PROCESSO`, `NR_META`, `NR_CONSTATACOES`, `NR_EVID_APRESENTA`, `DS_JUSTIFIC`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 1, 1, 230, 12.50, NULL, NULL, '2021-08-06 09:48:53', '2021-08-06 09:48:53'),
(2, 2, 1, 160, 12.50, NULL, NULL, '2021-08-06 09:51:39', '2021-08-06 09:51:39'),
(3, 3, 1, 30, 12.50, NULL, NULL, '2021-08-06 10:02:32', '2021-08-06 10:04:11'),
(4, 4, 1, 187, 12.50, NULL, NULL, '2021-08-06 10:03:14', '2021-08-06 10:04:17'),
(5, 5, 1, 192, 12.50, NULL, NULL, '2021-08-06 10:05:55', '2021-08-06 10:06:30'),
(6, 6, 1, 20, 12.50, NULL, NULL, '2021-08-06 10:06:52', '2021-08-06 10:08:30'),
(7, 7, 1, 90, 12.50, NULL, NULL, '2021-08-06 10:07:26', '2021-08-06 10:08:35'),
(8, 8, 1, 471, 12.50, NULL, NULL, '2021-08-06 10:09:14', '2021-08-06 10:09:40'),
(9, 1, 2, 60, 28.60, NULL, NULL, '2021-08-06 10:11:36', '2021-08-06 10:11:59'),
(10, 2, 2, 3, 28.60, NULL, NULL, '2021-08-06 10:14:30', '2021-08-06 10:17:56'),
(11, 6, 2, 70, 28.60, NULL, NULL, '2021-08-06 10:15:57', '2021-08-06 10:17:59'),
(12, 10, 2, 25, 28.60, NULL, NULL, '2021-08-06 10:17:11', '2021-08-06 10:18:06'),
(13, 11, 2, 20, 28.60, NULL, NULL, '2021-08-06 10:20:37', '2021-08-06 10:22:07'),
(14, 12, 2, 100, 28.60, NULL, NULL, '2021-08-06 10:21:47', '2021-08-06 10:22:11'),
(15, 13, 3, 2155, 25.00, NULL, NULL, '2021-08-06 10:24:52', '2021-08-06 10:28:28'),
(16, 14, 3, 350, 25.00, NULL, NULL, '2021-08-06 10:25:49', '2021-08-06 10:28:32'),
(17, 15, 3, 300, 25.00, NULL, NULL, '2021-08-06 10:26:49', '2021-08-06 10:28:36'),
(18, 16, 3, 30, 25.00, NULL, NULL, '2021-08-06 10:27:50', '2021-08-06 10:28:40'),
(20, 17, 4, 250, 8.30, NULL, NULL, '2021-08-06 10:38:58', '2021-08-06 11:03:56'),
(21, 6, 4, 125, 8.30, NULL, NULL, '2021-08-06 10:41:03', '2021-08-06 10:41:03'),
(22, 3, 4, 750, 8.30, NULL, NULL, '2021-08-06 10:43:56', '2021-08-06 10:43:56'),
(23, 9, 4, 50, 8.30, NULL, NULL, '2021-08-06 10:52:47', '2021-08-06 10:52:47'),
(24, 18, 4, 60, 8.30, NULL, NULL, '2021-08-06 10:55:07', '2021-08-06 10:55:07'),
(25, 19, 4, 20, 8.30, NULL, NULL, '2021-08-06 10:55:54', '2021-08-06 10:55:54'),
(26, 20, 4, 30, 8.30, NULL, NULL, '2021-08-06 10:56:34', '2021-08-06 10:56:34'),
(27, 21, 4, 110, 8.30, NULL, NULL, '2021-08-06 10:57:15', '2021-08-06 10:57:15'),
(28, 22, 4, 20, 8.30, NULL, NULL, '2021-08-06 10:57:43', '2021-08-06 10:57:43'),
(29, 1, 4, 550, 8.30, NULL, NULL, '2021-08-06 10:58:25', '2021-08-06 10:58:25'),
(30, 11, 4, 20, 8.30, NULL, NULL, '2021-08-06 10:59:11', '2021-08-06 10:59:11'),
(31, 21, 4, 110, 8.30, NULL, NULL, '2021-08-06 11:13:32', '2021-08-06 11:13:32'),
(32, 22, 4, 20, 8.30, NULL, NULL, '2021-08-06 11:15:30', '2021-08-06 11:15:30'),
(33, 1, 4, 550, 8.30, NULL, NULL, '2021-08-06 11:34:40', '2021-08-06 11:34:40'),
(34, 11, 4, 20, 8.30, NULL, NULL, '2021-08-06 11:35:35', '2021-08-06 11:35:35'),
(35, 23, 4, 200, 8.30, NULL, NULL, '2021-08-06 11:36:11', '2021-08-06 11:36:11');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  ADD PRIMARY KEY (`CD_DOC`),
  ADD KEY `FK_fontes_setor` (`CD_SETOR`),
  ADD KEY `FK_fontes_metas_qualit` (`CD_METAS_QUALIT`) USING BTREE;

--
-- Índices de tabela `fontes_evidencia_fisicas`
--
ALTER TABLE `fontes_evidencia_fisicas`
  ADD PRIMARY KEY (`CD_DOC`),
  ADD KEY `FK_fontes_metas_fisicas` (`CD_METAS_FISICAS`),
  ADD KEY `FK_fontes_processo` (`CD_PROCESSO`);

--
-- Índices de tabela `metas_qualit`
--
ALTER TABLE `metas_qualit`
  ADD PRIMARY KEY (`CD_METAS_QUALIT`),
  ADD KEY `FK_metas_qualit_setor` (`CD_SETOR`),
  ADD KEY `FK_metas_qualit_usuario` (`CD_USUARIO`);

--
-- Índices de tabela `processos`
--
ALTER TABLE `processos`
  ADD PRIMARY KEY (`CD_PROCESSO`),
  ADD UNIQUE KEY `DS_NOME` (`DS_NOME`);

--
-- Índices de tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`CD_SETOR`),
  ADD UNIQUE KEY `DS_NOME` (`DS_NOME`);

--
-- Índices de tabela `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD PRIMARY KEY (`CD_METAS_FISICAS`),
  ADD KEY `FK_metas_fisicas_setor` (`CD_SETOR`),
  ADD KEY `FK_metas_fisicas_processo` (`CD_PROCESSO`),
  ADD KEY `FK_metas_fisicas_usuario` (`CD_USUARIO`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `fontes_evidencia_fisicas`
--
ALTER TABLE `fontes_evidencia_fisicas`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `metas_qualit`
--
ALTER TABLE `metas_qualit`
  MODIFY `CD_METAS_QUALIT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `processos`
--
ALTER TABLE `processos`
  MODIFY `CD_PROCESSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `CD_SETOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de tabela `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  MODIFY `CD_METAS_FISICAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  ADD CONSTRAINT `FK_fontes_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`);

--
-- Restrições para tabelas `fontes_evidencia_fisicas`
--
ALTER TABLE `fontes_evidencia_fisicas`
  ADD CONSTRAINT `FK_fontes_processo` FOREIGN KEY (`CD_PROCESSO`) REFERENCES `processos` (`CD_PROCESSO`),
  ADD CONSTRAINT `FK_fontes_metas_fisicas` FOREIGN KEY (`CD_METAS_FISICAS`) REFERENCES `metas_fisicas` (`CD_METAS_FISICAS`);

--
-- Restrições para tabelas `metas_qualit`
--
ALTER TABLE `metas_qualit`
  ADD CONSTRAINT `FK_metas_qualit_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`),
  ADD CONSTRAINT `FK_metas_qualit_usuario` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`);

--
-- Restrições para tabelas `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD CONSTRAINT `FK_metas_fisicas_processo` FOREIGN KEY (`CD_PROCESSO`) REFERENCES `processos` (`CD_PROCESSO`),
  ADD CONSTRAINT `FK_metas_fisicas_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`),
  ADD CONSTRAINT `FK_metas_fisicas_usuario` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
