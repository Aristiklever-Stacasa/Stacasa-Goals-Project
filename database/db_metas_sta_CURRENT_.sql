-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2021 at 02:34 PM
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
-- Database: `db_metas_sta`
--

DROP DATABASE db_metas_sta;

CREATE DATABASE db_metas_sta CHARACTER SET utf8 COLLATE utf8_general_ci;

USE db_metas_sta;

-- --------------------------------------------------------

--
-- Table structure for table `fontes_evidencias_fisica`
--

CREATE TABLE `fontes_evidencias_fisica` (
  `CD_DOC` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` text NOT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fontes_evidencias_fisica`
--

INSERT INTO `fontes_evidencias_fisica` (`CD_DOC`, `DS_NOME`, `DS_DIRETORIO`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 'ED_1_IBGE_21_ACM_ACS_ABERTURA.PDF', 'uploads/ED_1_IBGE_21_ACM_ACS_ABERTURA.PDF', '2021-08-15 19:23:07', '2021-08-15 19:23:07'),
(2, 'ED_1_IBGE_21_ACM_ACS_ABERTURA.PDF', 'uploads/ED_1_IBGE_21_ACM_ACS_ABERTURA.PDF', '2021-08-15 19:24:49', '2021-08-15 19:24:49'),
(3, 'ED_2_IBGE_21_RECENSEADOR_ABERTURA.PDF', 'uploads/ED_2_IBGE_21_RECENSEADOR_ABERTURA.PDF', '2021-08-15 19:24:49', '2021-08-15 19:24:49'),
(4, '3 AP - Empreendedorismo.pdf', 'uploads/3 AP - Empreendedorismo.pdf', '2021-08-15 19:27:18', '2021-08-15 19:27:18'),
(5, 'AP 1 - Empreendedorismo.pdf', 'uploads/AP 1 - Empreendedorismo.pdf', '2021-08-15 19:27:18', '2021-08-15 19:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `fontes_evidencias_qualit`
--

CREATE TABLE `fontes_evidencias_qualit` (
  `CD_DOC` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` varchar(128) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_metas_fisicas`
--

CREATE TABLE `log_metas_fisicas` (
  `CD_LOG_METAS` int(11) NOT NULL,
  `CD_METAS_FISICAS` int(11) NOT NULL,
  `NR_EVID_APRESENTA` int(11) DEFAULT 0,
  `DS_JUSTIFIC` text DEFAULT NULL,
  `NR_JULG_COMISSAO` float(11,2) DEFAULT 0.00,
  `NR_SALDO` int(11) DEFAULT 0,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log_metas_fisicas`
--

INSERT INTO `log_metas_fisicas` (`CD_LOG_METAS`, `CD_METAS_FISICAS`, `NR_EVID_APRESENTA`, `DS_JUSTIFIC`, `NR_JULG_COMISSAO`, `NR_SALDO`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 1, 220, 'ASasdadsd askjd', 12.00, 0, '2021-08-15 19:24:48', '2021-08-15 19:24:48'),
(2, 2, 150, 'Teste final.', 11.70, 0, '2021-08-15 19:27:18', '2021-08-15 19:27:18');

--
-- Triggers `log_metas_fisicas`
--
DELIMITER $$
CREATE TRIGGER `TG_saldo_verification` BEFORE INSERT ON `log_metas_fisicas` FOR EACH ROW BEGIN
	DECLARE nrmeta INT;
	SET nrmeta = (SELECT NR_META FROM metas_fisicas WHERE CD_METAS_FISICAS = NEW.CD_METAS_FISICAS);
	IF (NEW.NR_EVID_APRESENTA > nrmeta)
    THEN
    	SET NEW.NR_SALDO = NEW.NR_EVID_APRESENTA - nrmeta;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_metas_qualit`
--

CREATE TABLE `log_metas_qualit` (
  `CD_LOG_METAS` int(11) NOT NULL,
  `CD_METAS_QUALIT` int(11) NOT NULL,
  `NR_EVID_APRESENTA` float DEFAULT 0,
  `DS_JUSTIFIC` text DEFAULT NULL,
  `NR_JULG_COMISSAO` float(11,2) DEFAULT 0.00,
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metas_fisicas`
--

INSERT INTO `metas_fisicas` (`CD_METAS_FISICAS`, `CD_SETOR`, `CD_PROCESSO`, `CD_USUARIO`, `NR_META`, `NR_CONSTATACOES`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 1, 1, 1, 230, 12.50, '2021-08-06 09:48:53', '2021-08-13 17:18:31'),
(2, 2, 1, 1, 160, 12.50, '2021-08-06 09:51:39', '2021-08-13 16:20:18'),
(3, 3, 1, 1, 30, 12.50, '2021-08-06 10:02:32', '2021-08-06 10:04:11'),
(4, 4, 1, 1, 187, 12.50, '2021-08-06 10:03:14', '2021-08-06 10:04:17'),
(5, 5, 1, 1, 192, 12.50, '2021-08-06 10:05:55', '2021-08-06 10:06:30'),
(6, 6, 1, 1, 20, 12.50, '2021-08-06 10:06:52', '2021-08-06 10:08:30'),
(7, 7, 1, 1, 90, 12.50, '2021-08-06 10:07:26', '2021-08-06 10:08:35'),
(8, 8, 1, 1, 471, 12.50, '2021-08-06 10:09:14', '2021-08-06 10:09:40'),
(9, 1, 2, 1, 60, 28.60, '2021-08-06 10:11:36', '2021-08-06 10:11:59'),
(10, 2, 2, 1, 3, 28.60, '2021-08-06 10:14:30', '2021-08-06 10:17:56'),
(11, 6, 2, 1, 70, 28.60, '2021-08-06 10:15:57', '2021-08-06 10:17:59'),
(12, 10, 2, 1, 25, 28.60, '2021-08-06 10:17:11', '2021-08-06 10:18:06'),
(13, 11, 2, 1, 20, 28.60, '2021-08-06 10:20:37', '2021-08-06 10:22:07'),
(14, 12, 2, 1, 100, 28.60, '2021-08-06 10:21:47', '2021-08-06 10:22:11'),
(15, 13, 3, 1, 2155, 25.00, '2021-08-06 10:24:52', '2021-08-06 10:28:28'),
(16, 14, 3, 1, 350, 25.00, '2021-08-06 10:25:49', '2021-08-06 10:28:32'),
(17, 15, 3, 1, 300, 25.00, '2021-08-06 10:26:49', '2021-08-06 10:28:36'),
(18, 16, 3, 1, 30, 25.00, '2021-08-06 10:27:50', '2021-08-06 10:28:40'),
(19, 17, 4, 1, 250, 8.30, '2021-08-06 10:38:58', '2021-08-10 08:09:21'),
(20, 6, 4, 1, 125, 8.30, '2021-08-06 10:41:03', '2021-08-10 08:09:28'),
(21, 3, 4, 1, 750, 8.30, '2021-08-06 10:43:56', '2021-08-10 08:09:31'),
(22, 9, 4, 1, 50, 8.30, '2021-08-06 10:52:47', '2021-08-10 08:09:34'),
(23, 18, 4, 1, 60, 8.30, '2021-08-06 10:55:07', '2021-08-10 08:09:37'),
(24, 19, 4, 1, 20, 8.30, '2021-08-06 10:55:54', '2021-08-10 08:09:43'),
(25, 20, 4, 1, 30, 8.30, '2021-08-06 10:56:34', '2021-08-10 08:09:47'),
(26, 21, 4, 1, 110, 8.30, '2021-08-06 10:57:15', '2021-08-10 08:11:00'),
(27, 22, 4, 1, 20, 8.30, '2021-08-06 10:57:43', '2021-08-10 08:11:05'),
(28, 1, 4, 1, 550, 8.30, '2021-08-06 10:58:25', '2021-08-10 08:11:17'),
(29, 11, 4, 1, 20, 8.30, '2021-08-06 10:59:11', '2021-08-10 08:11:28'),
(39, 23, 4, 1, 200, 8.30, '2021-08-09 10:28:45', '2021-08-10 08:12:14'),
(40, 24, 5, 1, 13033, 6.25, '2021-08-09 10:29:44', '2021-08-10 08:12:18'),
(41, 25, 5, 1, 100, 6.25, '2021-08-09 10:33:11', '2021-08-10 08:12:25'),
(42, 27, 5, 1, 40, 6.25, '2021-08-09 10:37:45', '2021-08-10 08:12:28'),
(43, 28, 5, 1, 20, 6.25, '2021-08-09 10:38:25', '2021-08-10 08:12:31'),
(44, 29, 5, 1, 750, 6.25, '2021-08-09 10:48:14', '2021-08-10 08:12:34'),
(45, 30, 5, 1, 30, 6.25, '2021-08-09 10:49:46', '2021-08-10 08:12:40'),
(46, 31, 5, 1, 10, 6.25, '2021-08-09 10:50:50', '2021-08-10 08:12:43'),
(47, 32, 5, 1, 10, 6.25, '2021-08-09 10:51:58', '2021-08-10 08:12:47'),
(48, 33, 5, 1, 185, 6.25, '2021-08-09 10:52:50', '2021-08-10 08:12:52'),
(49, 34, 5, 1, 150, 6.25, '2021-08-09 10:53:28', '2021-08-10 08:12:56'),
(50, 35, 5, 1, 2500, 6.25, '2021-08-09 10:55:04', '2021-08-10 08:13:01'),
(51, 36, 5, 1, 208, 6.25, '2021-08-09 10:55:45', '2021-08-10 08:13:03'),
(52, 37, 5, 1, 100, 6.25, '2021-08-09 10:56:27', '2021-08-10 08:13:07'),
(53, 38, 5, 1, 550, 6.25, '2021-08-09 10:57:06', '2021-08-10 08:13:10'),
(54, 39, 5, 1, 204, 6.25, '2021-08-09 10:58:22', '2021-08-10 08:13:14'),
(55, 9, 2, 1, 70, 28.60, '2021-08-11 16:02:08', '2021-08-11 16:02:08'),
(56, 26, 5, 1, 30, 6.25, '2021-08-11 16:21:45', '2021-08-11 16:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `metas_fontes_fisicas`
--

CREATE TABLE `metas_fontes_fisicas` (
  `CD_METAS_FONTES_FISICAS` int(11) NOT NULL,
  `CD_METAS_FISICAS` int(11) NOT NULL,
  `CD_FONTES_EVIDENCIAS_FISICAS` int(11) NOT NULL,
  `DT_VINCULACAO` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metas_fontes_fisicas`
--

INSERT INTO `metas_fontes_fisicas` (`CD_METAS_FONTES_FISICAS`, `CD_METAS_FISICAS`, `CD_FONTES_EVIDENCIAS_FISICAS`, `DT_VINCULACAO`) VALUES
(1, 1, 2, '2021-08-15 19:24:49'),
(2, 1, 3, '2021-08-15 19:24:49'),
(3, 2, 4, '2021-08-15 19:27:18'),
(4, 2, 5, '2021-08-15 19:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `metas_fontes_qualit`
--

CREATE TABLE `metas_fontes_qualit` (
  `CD_METAS_FONTES_QUALIT` int(11) NOT NULL,
  `CD_METAS_QUALIT` int(11) NOT NULL,
  `CD_FONTES_EVIDENCIAS_QUALIT` int(11) NOT NULL,
  `DT_VINCULACAO` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `DT_CRIACAO` datetime DEFAULT current_timestamp(),
  `DT_ATUALIZACAO` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metas_qualit`
--

INSERT INTO `metas_qualit` (`CD_METAS_QUALIT`, `CD_SETOR`, `CD_USUARIO`, `DS_NOME`, `NR_CONSTATACOES`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 40, 1, 'Garantir atendimento ininterrupto com funcionamento nas 24 (vinte e quatro) horas do dia e em todos os dias da semana', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(3, 40, 1, 'Acolher os casos de urg??ncia encaminhados pelo Servi??o de Atendimento M??vel de Urg??ncia (SAMU), respeitando o perfil epidemiol??gico e capacidade de atendimento do hospital.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(4, 40, 1, 'Executar o acolhimento e classifica????o de risco de 100% (cem por cento) dos pacientes adultos atendidos na unidade de emerg??ncia da institui????o, segundo protocolo estabelecido para Urg??ncias e Emerg??ncias.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(5, 41, 1, 'Garantir m??dico traumatologista para desenvolvimento de ambulat??rio de avalia????o cir??rgica para procedimentos eletivos e relacionados a estrat??gia de aumento do acesso aos Procedimentos Traumato-ortop??dicos de M??dia Complexidade.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(6, 42, 1, 'Assegurar aten????o p??s-operat??ria continuada a todos pacientes que sejamsubmetidos a a????es terap??uticas neurointervencionistas e/ou neurocir??rgicasnaunidade', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(7, 43, 1, 'Manter a taxa de suspens??o de cirurgias eletivas menor que 8% (oito por cento), exceto aquelas relacionadas ao paciente', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(8, 43, 1, 'Garantir o acesso dos usu??rios do SUS ao ambulat??rio para avalia????o cir??rgica', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(9, 43, 1, 'Implementar a Sistematiza????o da Assist??ncia de Enfermagem Perioperat??ria ??? SAEP', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(10, 44, 1, 'Monitorar e manter atualizados e dispon??veis ao gestor do SUS, com periodicidade mensal, os seguintes indicadores: Taxa de ocupa????o operacional; Taxa de mortalidade absoluta e estimada; Tempo de perman??ncia na Unidade de Terapia Intensiva; Taxa de reinterna????o em 24 (vinte e quatro) horas; Densidade de Incid??ncia de Pneumonia Associada ?? Ventila????o Mec??nica (PAV); Taxa de utiliza????o de ventila????o mec??nica (VM); Densidade de Incid??ncia de Infec????o Prim??ria da Corrente Sangu??nea (IPCS) relacionada ao Acesso Vascular Central; Taxa de utiliza????o de cateter venoso central (CVC); Densidade de Incid??ncia de Infec????es do Trato Urin??rio (ITU) relacionada ao cateter vesical.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(11, 44, 1, 'Manter Taxa de ocupa????o m??dia mensal da unidade de, no m??nimo, 90% (noventa por cento);', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(12, 44, 1, 'Cumprir os seguintes requisitos de Humaniza????o: Garantia de visitas di??rias programadas dos familiares; Garantia de livre acesso a m??e e ao pai, e perman??ncia da m??e ou pai; Garantia de informa????es da evolu????o dos pacientes aos familiares, pela equipe m??dica no m??nimo uma vez ao dia.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(13, 44, 1, 'Garantir a ocorr??ncia de Les??o por press??o de pacientes internados na UTI menor ou igual a 10% do total de pacientes.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(14, 45, 1, 'Realizar a confec????o da f??stula art??rio venosa de acesso ?? hemodi??lise ou do implante de cateter para di??lise peritoneal', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(15, 46, 1, 'Ofertar os exames indicados para o diagn??stico diferencial e definitivo, estadiamento e acompanhamento dos pacientes cadastrados no estabelecimento e, al??m, ofertar, por demanda e sob regula????o do respectivo gestor, exames e consultas especializadas, dentro dos limites dos recursos contratualizados', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(16, 46, 1, 'Realizar o diagn??stico definitivo e a avalia????o da extens??o da neoplasia (estadiamento), iniciar tempestivamente o tratamento e assegurar a continuidade do atendimento, o pronto atendimento e os cuidados paliativos', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(17, 46, 1, 'Manter atualizados os protocolos cl??nicos e diretrizes terap??uticas (PCDT) e estabelecer protocolos e condutas institucionais para diagn??stico, estadiamento, tratamento e seguimento dos pacientes com base nas Diretrizes Diagn??sticas e Terap??uticas (DDT)', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(18, 46, 1, 'Utilizar e manter atualizados o Sistema de Informa????o sobre o C??ncer (SISCAN - Colo e Mama) e Registro Hospitalar de C??ncer (RHC), conforme as normas t??cnico-operacionais preconizadas pelo Minist??rio da Sa??de,', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(19, 46, 1, 'Registrar o atendimento dos pacientes em prontu??rio ??nico', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(20, 47, 1, 'Garantir o acesso as medica????es necess??rias para o processo de pulsoterapia de pacientes cr??nicos usu??rios do SUS na quantidade ofertada.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(21, 48, 1, 'Implementar plano de redu????o de cesarianas com apresenta????o bimestral dos resultados alcan??ados.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(22, 48, 1, 'Manter escala da sala de parto com pediatra em 100% (cem por cento) dos turnos', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(23, 48, 1, 'Manter frequ??ncia de, no m??nimo, 50% (cinquenta por cento) dos representantes da institui????o nas reuni??es dos comit??s municipal e estadual de mortalidade materna e infantil.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(24, 49, 1, 'Garantir o acesso via regula????o, de crian??as que necessitem de avalia????o cl??nica,interna????o,cirurgia relacionada ?? especialidade da traumato/ortopedia,sem necessidade de   valia????o inicial no Hospital Regional Norte (HRN) em casos de trauma de extremidades.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(25, 50, 1, 'Manter 100% (cem por cento) dos leitos visualizados no Sistema de Regula????o de Leitos, com garantia de acesso regulado aos Leitos de Interna????o/interna????es locais.', 7.70, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(26, 45, 1, 'Realizar Tratamento Dial??tico em Tr??nsito', 7.70, '2021-08-09 11:48:05', '2021-08-09 11:48:05'),
(27, 50, 1, 'Garantir tempo resposta do N??cleo Interno de Regula????o do hospital ?? solicita????o de regula????o dos leitos pela Central de Regula????es em at?? quatro horas.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(28, 50, 1, 'Encaminhar 100% (cem por cento) das escalas de Consultas e Exames e altera????es previs??veis de agenda profissional at?? o dia 10 (dez) do m??s anterior.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(29, 50, 1, 'Confirmar diariamente no Sistema Informatizado de Regula????o de Sobral (SISREG-Sobral) e FASTMEDIC as consultas e exames realizados.\r\nImplantar e manter atualizados os protocolos B??sicos Seguran??a do Paciente (Cirurgia segura; Seguran??a na Prescri????o, Uso e Administra????o de Medicamentos; Preven????o de Quedas).', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(30, 50, 1, 'Disponibilizar mensalmente os indicadores de acompanhamento dos Protocolos B??sicos de Seguran??a do Paciente (Identifica????o do Paciente; Preven????o de ??lcera por Press??o; Pr??tica de Higiene das M??os em Servi??os de Sa??de).', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(31, 50, 1, 'Implantar/atualizar protocolos cl??nico sem 90% (noventa por cento) dos servi??os do hospital.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(32, 50, 1, 'Realizar 1(uma) reuni??o mensal dos colegiados de coordenadores de servi??o, de gest??o cl??nica e do conselho gestor, com frequ??ncia m??nima de cinquenta por cento mais 1 dos seus respectivos membros.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(33, 50, 1, 'Realizar 1 (uma) reuni??o bimensal do Colegiado de Gest??o Participativa, comparticipa????o de funcion??rios do hospital, docentes e discentes  das Institui????esde Ensino Superior, assegurando frequ??ncia m??nima de cinquenta por cento mais 1 dos seus membros.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(34, 50, 1, 'Realizar 1 (uma) reuni??o mensal das Comiss??es Hospitalares e Ger??ncia de Riscos com frequ??ncia m??nima de cinquenta por cento mais 1 (um) dos seus membros.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(35, 50, 1, 'Realizar, trimestralmente, 1 (uma) reuni??o da Comiss??o de Prote????o Radiol??gica com frequ??ncia m??nima de cinquenta por cento mais 1 de seus membros.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(36, 50, 1, 'Manter e qualificar as Comiss??es Assessoras Obrigat??rias pertinentes a institui????es hospitalares.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(37, 50, 1, 'Avaliar mensalmente amostra de 1% (um por cento) dos prontu??rios m??dicos,elaborando relat??rio descritivo e anal??tico, incluindo as recomenda????es necess??rias para o seu preenchimento de acordo com a legisla????o em vigor por parte da equipe multiprofissional, incluindo m??dicos e enfermeiros residentes e internos de medicina e enfermagem.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(38, 50, 1, 'Notificar e investigar 100% (cem por cento) dos casos de doen??as de notifica????o compuls??ria e de interesse para o Sistema Municipal de Sa??de de Sobral, inclusive os casos suspeitos atendidos no  ambulat??rio e na emerg??ncia, utilizando as fichas de notifica????o e investiga????o padronizadas pelo Sistema de Informa????o de Agravos de Notifica????o - SINAN.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(39, 50, 1, 'Manter programa de Educa????o Permanente para os profissionais do hospital.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(40, 50, 1, 'Elaborar e executar 80% (oitenta por cento) do cronograma anual de atividades de Educa????o Permanente para todas as categorias profissionais do hospital.\r\nRealizar atividades de apoio ao desenvolvimento docente.', 7.70, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(53, 50, 1, 'Realizar atividades de apoio ao desenvolvimento docente.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(54, 50, 1, 'Qualificar os Programas de Resid??ncia M??dica e Multiprofissional.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(55, 50, 1, 'Manter o funcionamento do Departamento de Ensino, Pesquisa e Extens??o.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(56, 50, 1, 'Manter em funcionamento o Comit?? de ??tica em Pesquisa com Seres Humanos da SCMS (CEP???SCMS).', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(57, 50, 1, 'Informar aos Comit??s de ??tica em Pesquisas locais sobre o in??cio, o andamento e o t??rmino das pesquisas desenvolvidas no hospital.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(58, 50, 1, 'Ofertar bolsa-aux??lio pelo Departamento de Ensino, Pesquisa e Extens??o aos estudantes de gradua????o de institui????es de ensino superior (IES) de Sobral.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(59, 50, 1, 'Apresentar, anualmente, relat??rio descritivo e anal??tico das atividades de extens??o desenvolvidas no hospital.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(60, 50, 1, 'Manter em funcionamento a Comiss??o de Resid??ncias em Sa??de.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(61, 50, 1, 'Promover, semestralmente, momentos de intera????o e integra????o entre a SCMS e IES conveniadas.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(62, 50, 1, 'Manter ??ndices globais de satisfa????o dos usu??rios iguais ou superiores a 70% (setenta por cento) no servi??o de emerg??ncia, e de 80% (oitenta por cento) nos demais servi??os.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(63, 50, 1, 'Monitorar, avaliar e disponibilizar mensalmente os indicadores de taxa de ocupa????o de leitos, tempo m??dio de perman??ncia para leitos de cl??nica m??dica e cir??rgica e taxa de mortalidade institucional.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(64, 50, 1, 'Monitorar, avaliar e disponibilizar mensalmente os indicadores relacionados aos componentes da Rede Cegonha: Taxa de ??bitos infantis (neonatal e p??s-neonatal). Numero absoluto de ??bitos maternos;  Nas- cidos vivos segundo idade da m??e, segundo IG (< 37 semanas); Tipo de parto: % de partos ces??reos e partos normais.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(65, 50, 1, 'Monitorar, avaliar e disponibilizar mensalmente os indicadores relacionados aos componentes da Rede de Urg??ncia e Emerg??ncia: taxa de morbimortalidade, incid??ncia de causas externas (considerando taxa de acidentes automobil??sticos, agress??o f??sica, entre outros), tempo de perman??ncia e tempo de interna????o.', 7.70, '2021-08-09 14:12:39', '2021-08-09 14:12:39');

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
(1, 'E1 - INTERNA????ES', '2021-08-06 08:50:42', '2021-08-08 16:50:51'),
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
(13, 'ATENDIMENTOS DE URG??NCIA / EMERG??NCIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(14, 'TRAT. CONSERVADOR TRAUMATOLOGIA / ORTPEDIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(15, 'CIRURGIAS AMBULATORIAIS', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(16, 'PULSOTERAPIAS / INFUS??O DE FARM??COS', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(17, 'NEUROLOGIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(18, 'CIRURGIA PLASTICA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(19, 'CIRURGIA DE CABE??A E PESCO??O (Exceto Oncol??gica)', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
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
(33, 'ANATOMIA PATOL??GICA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(34, 'IMUNOHISTOQUIMICA DE NEOPLASIAS MALIG', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(35, 'RADIOGRAFIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(36, 'MAMOGRAFIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(37, 'ULTRASSONOGRAFIA COM DOPPLER - OBSTETRICIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(38, 'ULTRASSONOGRAFIA AMB OBSTETRICIA', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(39, 'CARDIOTOCOGRAFIA AMBULATORIAL', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(40, 'E1 - EMERG??NCIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(41, 'E2 - TRAUMATOLOGIA/ORTOPEDIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(42, 'E3 - NEUROLOGIA/NEUROCIRURGIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(43, 'E4 - CLINICA M??DICA/CIRURGICA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(44, 'E5 - UNIDADES DE TERAPIA INTENSIVA - UTI', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(45, 'E6 - HEMODIALISE/DIALISE PERITONIAL', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(46, 'E7 - ONCOLOGIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(47, 'E8 - PULSOTERAPIA/INFUS??O DE FARMACOS', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(48, 'E9 - OBSTETRICIA/NEONATOLOGIA ', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(49, 'E10 - PEDIATRIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(50, 'E12 - TRANSVERSAIS', '2021-08-09 00:12:37', '2021-08-09 00:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `CD_USUARIO` int(11) NOT NULL,
  `DS_LOGIN` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DS_SENHA` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Indexes for table `fontes_evidencias_fisica`
--
ALTER TABLE `fontes_evidencias_fisica`
  ADD PRIMARY KEY (`CD_DOC`);

--
-- Indexes for table `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  ADD PRIMARY KEY (`CD_DOC`);

--
-- Indexes for table `log_metas_fisicas`
--
ALTER TABLE `log_metas_fisicas`
  ADD PRIMARY KEY (`CD_LOG_METAS`),
  ADD KEY `FK_metas_fisicas_log` (`CD_METAS_FISICAS`);

--
-- Indexes for table `log_metas_qualit`
--
ALTER TABLE `log_metas_qualit`
  ADD PRIMARY KEY (`CD_LOG_METAS`),
  ADD KEY `FK_metas_qualit_log` (`CD_METAS_QUALIT`);

--
-- Indexes for table `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD PRIMARY KEY (`CD_METAS_FISICAS`),
  ADD KEY `FK_metas_fisicas_setor` (`CD_SETOR`),
  ADD KEY `FK_metas_fisicas_processo` (`CD_PROCESSO`),
  ADD KEY `FK_metas_fisicas_usuario` (`CD_USUARIO`);

--
-- Indexes for table `metas_fontes_fisicas`
--
ALTER TABLE `metas_fontes_fisicas`
  ADD PRIMARY KEY (`CD_METAS_FONTES_FISICAS`),
  ADD KEY `FK_metas_fisicas` (`CD_METAS_FISICAS`),
  ADD KEY `FK_fontes_evidencias_fisicas` (`CD_FONTES_EVIDENCIAS_FISICAS`);

--
-- Indexes for table `metas_fontes_qualit`
--
ALTER TABLE `metas_fontes_qualit`
  ADD PRIMARY KEY (`CD_METAS_FONTES_QUALIT`),
  ADD KEY `FK_metas_qualit` (`CD_METAS_QUALIT`),
  ADD KEY `FK_fontes_evidencias_qualit` (`CD_FONTES_EVIDENCIAS_QUALIT`);

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
-- AUTO_INCREMENT for table `fontes_evidencias_fisica`
--
ALTER TABLE `fontes_evidencias_fisica`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_metas_fisicas`
--
ALTER TABLE `log_metas_fisicas`
  MODIFY `CD_LOG_METAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log_metas_qualit`
--
ALTER TABLE `log_metas_qualit`
  MODIFY `CD_LOG_METAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  MODIFY `CD_METAS_FISICAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `metas_fontes_fisicas`
--
ALTER TABLE `metas_fontes_fisicas`
  MODIFY `CD_METAS_FONTES_FISICAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `metas_fontes_qualit`
--
ALTER TABLE `metas_fontes_qualit`
  MODIFY `CD_METAS_FONTES_QUALIT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metas_qualit`
--
ALTER TABLE `metas_qualit`
  MODIFY `CD_METAS_QUALIT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `processos`
--
ALTER TABLE `processos`
  MODIFY `CD_PROCESSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `setores`
--
ALTER TABLE `setores`
  MODIFY `CD_SETOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `CD_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_metas_fisicas`
--
ALTER TABLE `log_metas_fisicas`
  ADD CONSTRAINT `FK_metas_fisicas_log` FOREIGN KEY (`CD_METAS_FISICAS`) REFERENCES `metas_fisicas` (`CD_METAS_FISICAS`);

--
-- Constraints for table `log_metas_qualit`
--
ALTER TABLE `log_metas_qualit`
  ADD CONSTRAINT `FK_metas_qualit_log` FOREIGN KEY (`CD_METAS_QUALIT`) REFERENCES `metas_qualit` (`CD_METAS_QUALIT`);

--
-- Constraints for table `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD CONSTRAINT `FK_metas_fisicas_processo` FOREIGN KEY (`CD_PROCESSO`) REFERENCES `processos` (`CD_PROCESSO`),
  ADD CONSTRAINT `FK_metas_fisicas_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`),
  ADD CONSTRAINT `FK_metas_fisicas_usuario` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`);

--
-- Constraints for table `metas_fontes_fisicas`
--
ALTER TABLE `metas_fontes_fisicas`
  ADD CONSTRAINT `FK_fontes_evidencias_fisicas` FOREIGN KEY (`CD_FONTES_EVIDENCIAS_FISICAS`) REFERENCES `fontes_evidencias_fisica` (`CD_DOC`),
  ADD CONSTRAINT `FK_metas_fisicas` FOREIGN KEY (`CD_METAS_FISICAS`) REFERENCES `metas_fisicas` (`CD_METAS_FISICAS`);

--
-- Constraints for table `metas_fontes_qualit`
--
ALTER TABLE `metas_fontes_qualit`
  ADD CONSTRAINT `FK_fontes_evidencias_qualit` FOREIGN KEY (`CD_FONTES_EVIDENCIAS_QUALIT`) REFERENCES `fontes_evidencias_qualit` (`CD_DOC`),
  ADD CONSTRAINT `FK_metas_qualit` FOREIGN KEY (`CD_METAS_QUALIT`) REFERENCES `metas_qualit` (`CD_METAS_QUALIT`);

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
