-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 11/08/2021 às 22:47
-- Versão do servidor: 5.7.28-0ubuntu0.16.04.2-log
-- Versão do PHP: 7.1.32-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_metas_sta`
--

DROP DATABASE db_metas_sta;

CREATE DATABASE db_metas_sta CHARACTER SET utf8 COLLATE utf8_general_ci;

USE db_metas_sta;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fontes_evidencias_fisica`
--

CREATE TABLE `fontes_evidencias_fisica` (
  `CD_DOC` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` text NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `fontes_evidencias_fisica`
--

INSERT INTO `fontes_evidencias_fisica` (`CD_DOC`, `DS_NOME`, `DS_DIRETORIO`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 'mpdf.pdf', 'uploads/mpdf.pdf', '2021-08-13 17:18:31', '2021-08-13 17:18:31'),
(2, 'Proposta_Comercial_de_Servicos Negociação Final.pdf', 'uploads/Proposta_Comercial_de_Servicos Negociação Final.pdf', '2021-08-13 17:18:32', '2021-08-13 17:18:32'),
(3, 'FICHA DE EVOLUÇÃO FONOAUDIOLÓGICA.pdf', 'uploads/FICHA DE EVOLUÇÃO FONOAUDIOLÓGICA.pdf', '2021-08-13 17:18:32', '2021-08-13 17:18:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fontes_evidencias_qualit`
--

CREATE TABLE `fontes_evidencias_qualit` (
  `CD_DOC` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `DS_DIRETORIO` varchar(128) NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `NR_CONSTATACOES` float(11,2) DEFAULT '0.00',
  `NR_EVID_APRESENTA` int(11) DEFAULT NULL,
  `DS_JUSTIFIC` text,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NR_JULG_COMISSAO` float(11,2) DEFAULT '0.00',
  `NR_SALDO` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `metas_fisicas`
--

INSERT INTO `metas_fisicas` (`CD_METAS_FISICAS`, `CD_SETOR`, `CD_PROCESSO`, `CD_USUARIO`, `NR_META`, `NR_CONSTATACOES`, `NR_EVID_APRESENTA`, `DS_JUSTIFIC`, `DT_CRIACAO`, `DT_ATUALIZACAO`, `NR_JULG_COMISSAO`, `NR_SALDO`) VALUES
(1, 1, 1, 1, 230, 12.50, 220, 'wqdwqdwqd qwwq', '2021-08-06 09:48:53', '2021-08-13 17:18:31', 12.00, 0),
(2, 2, 1, 1, 160, 12.50, 150, 'vAMOS LA', '2021-08-06 09:51:39', '2021-08-13 16:20:18', 17.20, 0),
(3, 3, 1, 1, 30, 12.50, NULL, NULL, '2021-08-06 10:02:32', '2021-08-06 10:04:11', 0.00, 0),
(4, 4, 1, 1, 187, 12.50, NULL, NULL, '2021-08-06 10:03:14', '2021-08-06 10:04:17', 0.00, 0),
(5, 5, 1, 1, 192, 12.50, NULL, NULL, '2021-08-06 10:05:55', '2021-08-06 10:06:30', 0.00, 0),
(6, 6, 1, 1, 20, 12.50, NULL, NULL, '2021-08-06 10:06:52', '2021-08-06 10:08:30', 0.00, 0),
(7, 7, 1, 1, 90, 12.50, NULL, NULL, '2021-08-06 10:07:26', '2021-08-06 10:08:35', 0.00, 0),
(8, 8, 1, 1, 471, 12.50, NULL, NULL, '2021-08-06 10:09:14', '2021-08-06 10:09:40', 0.00, 0),
(9, 1, 2, 1, 60, 28.60, NULL, NULL, '2021-08-06 10:11:36', '2021-08-06 10:11:59', 0.00, 0),
(10, 2, 2, 1, 3, 28.60, NULL, NULL, '2021-08-06 10:14:30', '2021-08-06 10:17:56', 0.00, 0),
(11, 6, 2, 1, 70, 28.60, NULL, NULL, '2021-08-06 10:15:57', '2021-08-06 10:17:59', 0.00, 0),
(12, 10, 2, 1, 25, 28.60, NULL, NULL, '2021-08-06 10:17:11', '2021-08-06 10:18:06', 0.00, 0),
(13, 11, 2, 1, 20, 28.60, NULL, NULL, '2021-08-06 10:20:37', '2021-08-06 10:22:07', 0.00, 0),
(14, 12, 2, 1, 100, 28.60, NULL, NULL, '2021-08-06 10:21:47', '2021-08-06 10:22:11', 0.00, 0),
(15, 13, 3, 1, 2155, 25.00, NULL, NULL, '2021-08-06 10:24:52', '2021-08-06 10:28:28', 0.00, 0),
(16, 14, 3, 1, 350, 25.00, NULL, NULL, '2021-08-06 10:25:49', '2021-08-06 10:28:32', 0.00, 0),
(17, 15, 3, 1, 300, 25.00, NULL, NULL, '2021-08-06 10:26:49', '2021-08-06 10:28:36', 0.00, 0),
(18, 16, 3, 1, 30, 25.00, NULL, NULL, '2021-08-06 10:27:50', '2021-08-06 10:28:40', 0.00, 0),
(19, 17, 4, 1, 250, 8.30, NULL, NULL, '2021-08-06 10:38:58', '2021-08-10 08:09:21', 0.00, 0),
(20, 6, 4, 1, 125, 8.30, NULL, NULL, '2021-08-06 10:41:03', '2021-08-10 08:09:28', 0.00, 0),
(21, 3, 4, 1, 750, 8.30, NULL, NULL, '2021-08-06 10:43:56', '2021-08-10 08:09:31', 0.00, 0),
(22, 9, 4, 1, 50, 8.30, NULL, NULL, '2021-08-06 10:52:47', '2021-08-10 08:09:34', 0.00, 0),
(23, 18, 4, 1, 60, 8.30, NULL, NULL, '2021-08-06 10:55:07', '2021-08-10 08:09:37', 0.00, 0),
(24, 19, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 10:55:54', '2021-08-10 08:09:43', 0.00, 0),
(25, 20, 4, 1, 30, 8.30, NULL, NULL, '2021-08-06 10:56:34', '2021-08-10 08:09:47', 0.00, 0),
(26, 21, 4, 1, 110, 8.30, NULL, NULL, '2021-08-06 10:57:15', '2021-08-10 08:11:00', 0.00, 0),
(27, 22, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 10:57:43', '2021-08-10 08:11:05', 0.00, 0),
(28, 1, 4, 1, 550, 8.30, NULL, NULL, '2021-08-06 10:58:25', '2021-08-10 08:11:17', 0.00, 0),
(29, 11, 4, 1, 20, 8.30, NULL, NULL, '2021-08-06 10:59:11', '2021-08-10 08:11:28', 0.00, 0),
(39, 23, 4, 1, 200, 8.30, NULL, NULL, '2021-08-09 10:28:45', '2021-08-10 08:12:14', 0.00, 0),
(40, 24, 5, 1, 13033, 6.25, NULL, NULL, '2021-08-09 10:29:44', '2021-08-10 08:12:18', 0.00, 0),
(41, 25, 5, 1, 100, 6.25, NULL, NULL, '2021-08-09 10:33:11', '2021-08-10 08:12:25', 0.00, 0),
(42, 27, 5, 1, 40, 6.25, NULL, NULL, '2021-08-09 10:37:45', '2021-08-10 08:12:28', 0.00, 0),
(43, 28, 5, 1, 20, 6.25, NULL, NULL, '2021-08-09 10:38:25', '2021-08-10 08:12:31', 0.00, 0),
(44, 29, 5, 1, 750, 6.25, NULL, NULL, '2021-08-09 10:48:14', '2021-08-10 08:12:34', 0.00, 0),
(45, 30, 5, 1, 30, 6.25, NULL, NULL, '2021-08-09 10:49:46', '2021-08-10 08:12:40', 0.00, 0),
(46, 31, 5, 1, 10, 6.25, NULL, NULL, '2021-08-09 10:50:50', '2021-08-10 08:12:43', 0.00, 0),
(47, 32, 5, 1, 10, 6.25, NULL, NULL, '2021-08-09 10:51:58', '2021-08-10 08:12:47', 0.00, 0),
(48, 33, 5, 1, 185, 6.25, NULL, NULL, '2021-08-09 10:52:50', '2021-08-10 08:12:52', 0.00, 0),
(49, 34, 5, 1, 150, 6.25, NULL, NULL, '2021-08-09 10:53:28', '2021-08-10 08:12:56', 0.00, 0),
(50, 35, 5, 1, 2500, 6.25, NULL, NULL, '2021-08-09 10:55:04', '2021-08-10 08:13:01', 0.00, 0),
(51, 36, 5, 1, 208, 6.25, NULL, NULL, '2021-08-09 10:55:45', '2021-08-10 08:13:03', 0.00, 0),
(52, 37, 5, 1, 100, 6.25, NULL, NULL, '2021-08-09 10:56:27', '2021-08-10 08:13:07', 0.00, 0),
(53, 38, 5, 1, 550, 6.25, NULL, NULL, '2021-08-09 10:57:06', '2021-08-10 08:13:10', 0.00, 0),
(54, 39, 5, 1, 204, 6.25, NULL, NULL, '2021-08-09 10:58:22', '2021-08-10 08:13:14', 0.00, 0),
(55, 9, 2, 1, 70, 28.60, NULL, NULL, '2021-08-11 16:02:08', '2021-08-11 16:02:08', 0.00, 0),
(56, 26, 5, 1, 30, 6.25, NULL, NULL, '2021-08-11 16:21:45', '2021-08-11 16:21:45', 0.00, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `metas_fontes_fisicas`
--

CREATE TABLE `metas_fontes_fisicas` (
  `CD_METAS_FONTES_FISICAS` int(11) NOT NULL,
  `CD_METAS_FISICAS` int(11) NOT NULL,
  `CD_FONTES_EVIDENCIAS_FISICAS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `metas_fontes_fisicas`
--

INSERT INTO `metas_fontes_fisicas` (`CD_METAS_FONTES_FISICAS`, `CD_METAS_FISICAS`, `CD_FONTES_EVIDENCIAS_FISICAS`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `metas_fontes_qualit`
--

CREATE TABLE `metas_fontes_qualit` (
  `CD_METAS_FONTES_QUALIT` int(11) NOT NULL,
  `CD_METAS_QUALIT` int(11) NOT NULL,
  `CD_FONTES_EVIDENCIAS_QUALIT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `metas_qualit`
--

CREATE TABLE `metas_qualit` (
  `CD_METAS_QUALIT` int(11) NOT NULL,
  `CD_SETOR` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  `DS_NOME` text NOT NULL,
  `NR_CONSTATACOES` float(11,2) DEFAULT '0.00',
  `NR_EVID_APRESENTA` float(11,2) DEFAULT '0.00',
  `DS_JUSTIFIC` text,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `metas_qualit`
--

INSERT INTO `metas_qualit` (`CD_METAS_QUALIT`, `CD_SETOR`, `CD_USUARIO`, `DS_NOME`, `NR_CONSTATACOES`, `NR_EVID_APRESENTA`, `DS_JUSTIFIC`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 40, 1, 'Garantir atendimento ininterrupto com funcionamento nas 24 (vinte e quatro) horas do dia e em todos os dias da semana', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(3, 40, 1, 'Acolher os casos de urgência encaminhados pelo Serviço de Atendimento Móvel de Urgência (SAMU), respeitando o perfil epidemiológico e capacidade de atendimento do hospital.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(4, 40, 1, 'Executar o acolhimento e classificação de risco de 100% (cem por cento) dos pacientes adultos atendidos na unidade de emergência da instituição, segundo protocolo estabelecido para Urgências e Emergências.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(5, 41, 1, 'Garantir médico traumatologista para desenvolvimento de ambulatório de avaliação cirúrgica para procedimentos eletivos e relacionados a estratégia de aumento do acesso aos Procedimentos Traumato-ortopédicos de Média Complexidade.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(6, 42, 1, 'Assegurar atenção pós-operatória continuada a todos pacientes que sejamsubmetidos a ações terapêuticas neurointervencionistas e/ou neurocirúrgicasnaunidade', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(7, 43, 1, 'Manter a taxa de suspensão de cirurgias eletivas menor que 8% (oito por cento), exceto aquelas relacionadas ao paciente', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(8, 43, 1, 'Garantir o acesso dos usuários do SUS ao ambulatório para avaliação cirúrgica', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(9, 43, 1, 'Implementar a Sistematização da Assistência de Enfermagem Perioperatória – SAEP', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(10, 44, 1, 'Monitorar e manter atualizados e disponíveis ao gestor do SUS, com periodicidade mensal, os seguintes indicadores: Taxa de ocupação operacional; Taxa de mortalidade absoluta e estimada; Tempo de permanência na Unidade de Terapia Intensiva; Taxa de reinternação em 24 (vinte e quatro) horas; Densidade de Incidência de Pneumonia Associada à Ventilação Mecânica (PAV); Taxa de utilização de ventilação mecânica (VM); Densidade de Incidência de Infecção Primária da Corrente Sanguínea (IPCS) relacionada ao Acesso Vascular Central; Taxa de utilização de cateter venoso central (CVC); Densidade de Incidência de Infecções do Trato Urinário (ITU) relacionada ao cateter vesical.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(11, 44, 1, 'Manter Taxa de ocupação média mensal da unidade de, no mínimo, 90% (noventa por cento);', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(12, 44, 1, 'Cumprir os seguintes requisitos de Humanização: Garantia de visitas diárias programadas dos familiares; Garantia de livre acesso a mãe e ao pai, e permanência da mãe ou pai; Garantia de informações da evolução dos pacientes aos familiares, pela equipe médica no mínimo uma vez ao dia.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(13, 44, 1, 'Garantir a ocorrência de Lesão por pressão de pacientes internados na UTI menor ou igual a 10% do total de pacientes.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(14, 45, 1, 'Realizar a confecção da fístula artério venosa de acesso à hemodiálise ou do implante de cateter para diálise peritoneal', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(15, 46, 1, 'Ofertar os exames indicados para o diagnóstico diferencial e definitivo, estadiamento e acompanhamento dos pacientes cadastrados no estabelecimento e, além, ofertar, por demanda e sob regulação do respectivo gestor, exames e consultas especializadas, dentro dos limites dos recursos contratualizados', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(16, 46, 1, 'Realizar o diagnóstico definitivo e a avaliação da extensão da neoplasia (estadiamento), iniciar tempestivamente o tratamento e assegurar a continuidade do atendimento, o pronto atendimento e os cuidados paliativos', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(17, 46, 1, 'Manter atualizados os protocolos clínicos e diretrizes terapêuticas (PCDT) e estabelecer protocolos e condutas institucionais para diagnóstico, estadiamento, tratamento e seguimento dos pacientes com base nas Diretrizes Diagnósticas e Terapêuticas (DDT)', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(18, 46, 1, 'Utilizar e manter atualizados o Sistema de Informação sobre o Câncer (SISCAN - Colo e Mama) e Registro Hospitalar de Câncer (RHC), conforme as normas técnico-operacionais preconizadas pelo Ministério da Saúde,', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(19, 46, 1, 'Registrar o atendimento dos pacientes em prontuário único', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(20, 47, 1, 'Garantir o acesso as medicações necessárias para o processo de pulsoterapia de pacientes crônicos usuários do SUS na quantidade ofertada.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(21, 48, 1, 'Implementar plano de redução de cesarianas com apresentação bimestral dos resultados alcançados.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(22, 48, 1, 'Manter escala da sala de parto com pediatra em 100% (cem por cento) dos turnos', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(23, 48, 1, 'Manter frequência de, no mínimo, 50% (cinquenta por cento) dos representantes da instituição nas reuniões dos comitês municipal e estadual de mortalidade materna e infantil.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(24, 49, 1, 'Garantir o acesso via regulação, de crianças que necessitem de avaliação clínica,internação,cirurgia relacionada à especialidade da traumato/ortopedia,sem necessidade de   valiação inicial no Hospital Regional Norte (HRN) em casos de trauma de extremidades.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(25, 50, 1, 'Manter 100% (cem por cento) dos leitos visualizados no Sistema de Regulação de Leitos, com garantia de acesso regulado aos Leitos de Internação/internações locais.', 7.70, 0.00, NULL, '2021-08-09 10:24:07', '2021-08-09 10:24:07'),
(26, 45, 1, 'Realizar Tratamento Dialítico em Trânsito', 7.70, 0.00, NULL, '2021-08-09 11:48:05', '2021-08-09 11:48:05'),
(27, 50, 1, 'Garantir tempo resposta do Núcleo Interno de Regulação do hospital à solicitação de regulação dos leitos pela Central de Regulações em até quatro horas.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(28, 50, 1, 'Encaminhar 100% (cem por cento) das escalas de Consultas e Exames e alterações previsíveis de agenda profissional até o dia 10 (dez) do mês anterior.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(29, 50, 1, 'Confirmar diariamente no Sistema Informatizado de Regulação de Sobral (SISREG-Sobral) e FASTMEDIC as consultas e exames realizados.\r\nImplantar e manter atualizados os protocolos Básicos Segurança do Paciente (Cirurgia segura; Segurança na Prescrição, Uso e Administração de Medicamentos; Prevenção de Quedas).', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(30, 50, 1, 'Disponibilizar mensalmente os indicadores de acompanhamento dos Protocolos Básicos de Segurança do Paciente (Identificação do Paciente; Prevenção de Úlcera por Pressão; Prática de Higiene das Mãos em Serviços de Saúde).', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(31, 50, 1, 'Implantar/atualizar protocolos clínico sem 90% (noventa por cento) dos serviços do hospital.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(32, 50, 1, 'Realizar 1(uma) reunião mensal dos colegiados de coordenadores de serviço, de gestão clínica e do conselho gestor, com frequência mínima de cinquenta por cento mais 1 dos seus respectivos membros.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(33, 50, 1, 'Realizar 1 (uma) reunião bimensal do Colegiado de Gestão Participativa, comparticipação de funcionários do hospital, docentes e discentes  das Instituiçõesde Ensino Superior, assegurando frequência mínima de cinquenta por cento mais 1 dos seus membros.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(34, 50, 1, 'Realizar 1 (uma) reunião mensal das Comissões Hospitalares e Gerência de Riscos com frequência mínima de cinquenta por cento mais 1 (um) dos seus membros.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(35, 50, 1, 'Realizar, trimestralmente, 1 (uma) reunião da Comissão de Proteção Radiológica com frequência mínima de cinquenta por cento mais 1 de seus membros.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(36, 50, 1, 'Manter e qualificar as Comissões Assessoras Obrigatórias pertinentes a instituições hospitalares.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(37, 50, 1, 'Avaliar mensalmente amostra de 1% (um por cento) dos prontuários médicos,elaborando relatório descritivo e analítico, incluindo as recomendações necessárias para o seu preenchimento de acordo com a legislação em vigor por parte da equipe multiprofissional, incluindo médicos e enfermeiros residentes e internos de medicina e enfermagem.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(38, 50, 1, 'Notificar e investigar 100% (cem por cento) dos casos de doenças de notificação compulsória e de interesse para o Sistema Municipal de Saúde de Sobral, inclusive os casos suspeitos atendidos no  ambulatório e na emergência, utilizando as fichas de notificação e investigação padronizadas pelo Sistema de Informação de Agravos de Notificação - SINAN.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(39, 50, 1, 'Manter programa de Educação Permanente para os profissionais do hospital.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(40, 50, 1, 'Elaborar e executar 80% (oitenta por cento) do cronograma anual de atividades de Educação Permanente para todas as categorias profissionais do hospital.\r\nRealizar atividades de apoio ao desenvolvimento docente.', 7.70, 0.00, NULL, '2021-08-09 11:52:57', '2021-08-09 11:52:57'),
(53, 50, 1, 'Realizar atividades de apoio ao desenvolvimento docente.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(54, 50, 1, 'Qualificar os Programas de Residência Médica e Multiprofissional.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(55, 50, 1, 'Manter o funcionamento do Departamento de Ensino, Pesquisa e Extensão.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(56, 50, 1, 'Manter em funcionamento o Comitê de Ética em Pesquisa com Seres Humanos da SCMS (CEP–SCMS).', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(57, 50, 1, 'Informar aos Comitês de Ética em Pesquisas locais sobre o início, o andamento e o término das pesquisas desenvolvidas no hospital.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(58, 50, 1, 'Ofertar bolsa-auxílio pelo Departamento de Ensino, Pesquisa e Extensão aos estudantes de graduação de instituições de ensino superior (IES) de Sobral.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(59, 50, 1, 'Apresentar, anualmente, relatório descritivo e analítico das atividades de extensão desenvolvidas no hospital.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(60, 50, 1, 'Manter em funcionamento a Comissão de Residências em Saúde.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(61, 50, 1, 'Promover, semestralmente, momentos de interação e integração entre a SCMS e IES conveniadas.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(62, 50, 1, 'Manter índices globais de satisfação dos usuários iguais ou superiores a 70% (setenta por cento) no serviço de emergência, e de 80% (oitenta por cento) nos demais serviços.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(63, 50, 1, 'Monitorar, avaliar e disponibilizar mensalmente os indicadores de taxa de ocupação de leitos, tempo médio de permanência para leitos de clínica médica e cirúrgica e taxa de mortalidade institucional.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(64, 50, 1, 'Monitorar, avaliar e disponibilizar mensalmente os indicadores relacionados aos componentes da Rede Cegonha: Taxa de óbitos infantis (neonatal e pós-neonatal). Numero absoluto de óbitos maternos;  Nas- cidos vivos segundo idade da mãe, segundo IG (< 37 semanas); Tipo de parto: % de partos cesáreos e partos normais.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39'),
(65, 50, 1, 'Monitorar, avaliar e disponibilizar mensalmente os indicadores relacionados aos componentes da Rede de Urgência e Emergência: taxa de morbimortalidade, incidência de causas externas (considerando taxa de acidentes automobilísticos, agressão física, entre outros), tempo de permanência e tempo de internação.', 7.70, 0.00, NULL, '2021-08-09 14:12:39', '2021-08-09 14:12:39');

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
(1, 'E1 - INTERNAÇÕES', '2021-08-06 08:50:42', '2021-08-08 16:50:51'),
(2, 'E2  - CIRURGIAS ELETIVAS E CIRURGIAS DE TRAUMATOLOGIA /ORTOPEDIA (FECHADAS)\r\n', '2021-08-06 08:50:43', '2021-08-08 16:20:03'),
(3, 'E3 - ATENDIMENTOS AMBULATORIAS\r\n', '2021-08-06 08:50:43', '2021-08-08 16:20:09'),
(4, 'E4 - CONSULTAS AMBULATORIAIS\r\n', '2021-08-06 08:50:43', '2021-08-08 16:20:16'),
(5, 'E5 - EXAMES\r\n\r\n', '2021-08-06 08:50:44', '2021-08-08 16:59:28');

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
(39, 'CARDIOTOCOGRAFIA AMBULATORIAL', '2021-08-08 12:57:41', '2021-08-08 12:57:41'),
(40, 'E1 - EMERGÊNCIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(41, 'E2 - TRAUMATOLOGIA/ORTOPEDIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(42, 'E3 - NEUROLOGIA/NEUROCIRURGIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(43, 'E4 - CLINICA MÉDICA/CIRURGICA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(44, 'E5 - UNIDADES DE TERAPIA INTENSIVA - UTI', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(45, 'E6 - HEMODIALISE/DIALISE PERITONIAL', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(46, 'E7 - ONCOLOGIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(47, 'E8 - PULSOTERAPIA/INFUSÃO DE FARMACOS', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(48, 'E9 - OBSTETRICIA/NEONATOLOGIA ', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(49, 'E10 - PEDIATRIA', '2021-08-09 00:12:37', '2021-08-09 00:12:37'),
(50, 'E12 - TRANSVERSAIS', '2021-08-09 00:12:37', '2021-08-09 00:12:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `CD_USUARIO` int(11) NOT NULL,
  `DS_LOGIN` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DS_SENHA` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DT_CRIACAO` datetime DEFAULT CURRENT_TIMESTAMP,
  `DT_ATUALIZACAO` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`CD_USUARIO`, `DS_LOGIN`, `DS_SENHA`, `DT_CRIACAO`, `DT_ATUALIZACAO`) VALUES
(1, 'admin', 'admin', '2021-08-08 10:19:59', '2021-08-08 10:19:59');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `fontes_evidencias_fisica`
--
ALTER TABLE `fontes_evidencias_fisica`
  ADD PRIMARY KEY (`CD_DOC`);

--
-- Índices de tabela `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  ADD PRIMARY KEY (`CD_DOC`);

--
-- Índices de tabela `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD PRIMARY KEY (`CD_METAS_FISICAS`),
  ADD KEY `FK_metas_fisicas_setor` (`CD_SETOR`),
  ADD KEY `FK_metas_fisicas_processo` (`CD_PROCESSO`),
  ADD KEY `FK_metas_fisicas_usuario` (`CD_USUARIO`);

--
-- Índices de tabela `metas_fontes_fisicas`
--
ALTER TABLE `metas_fontes_fisicas`
  ADD PRIMARY KEY (`CD_METAS_FONTES_FISICAS`),
  ADD KEY `FK_metas_fisicas` (`CD_METAS_FISICAS`),
  ADD KEY `FK_fontes_evidencias_fisicas` (`CD_FONTES_EVIDENCIAS_FISICAS`);

--
-- Índices de tabela `metas_fontes_qualit`
--
ALTER TABLE `metas_fontes_qualit`
  ADD PRIMARY KEY (`CD_METAS_FONTES_QUALIT`),
  ADD KEY `FK_metas_qualit` (`CD_METAS_QUALIT`),
  ADD KEY `FK_fontes_evidencias_qualit` (`CD_FONTES_EVIDENCIAS_QUALIT`);

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
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`CD_USUARIO`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `fontes_evidencias_fisica`
--
ALTER TABLE `fontes_evidencias_fisica`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `fontes_evidencias_qualit`
--
ALTER TABLE `fontes_evidencias_qualit`
  MODIFY `CD_DOC` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  MODIFY `CD_METAS_FISICAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT de tabela `metas_fontes_fisicas`
--
ALTER TABLE `metas_fontes_fisicas`
  MODIFY `CD_METAS_FONTES_FISICAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `metas_fontes_qualit`
--
ALTER TABLE `metas_fontes_qualit`
  MODIFY `CD_METAS_FONTES_QUALIT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `metas_qualit`
--
ALTER TABLE `metas_qualit`
  MODIFY `CD_METAS_QUALIT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT de tabela `processos`
--
ALTER TABLE `processos`
  MODIFY `CD_PROCESSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `CD_SETOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `CD_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `metas_fisicas`
--
ALTER TABLE `metas_fisicas`
  ADD CONSTRAINT `FK_metas_fisicas_processo` FOREIGN KEY (`CD_PROCESSO`) REFERENCES `processos` (`CD_PROCESSO`),
  ADD CONSTRAINT `FK_metas_fisicas_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`),
  ADD CONSTRAINT `FK_metas_fisicas_usuario` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`);

--
-- Restrições para tabelas `metas_fontes_fisicas`
--
ALTER TABLE `metas_fontes_fisicas`
  ADD CONSTRAINT `FK_fontes_evidencias_fisicas` FOREIGN KEY (`CD_FONTES_EVIDENCIAS_FISICAS`) REFERENCES `fontes_evidencias_fisica` (`CD_DOC`),
  ADD CONSTRAINT `FK_metas_fisicas` FOREIGN KEY (`CD_METAS_FISICAS`) REFERENCES `metas_fisicas` (`CD_METAS_FISICAS`);

--
-- Restrições para tabelas `metas_fontes_qualit`
--
ALTER TABLE `metas_fontes_qualit`
  ADD CONSTRAINT `FK_fontes_evidencias_qualit` FOREIGN KEY (`CD_FONTES_EVIDENCIAS_QUALIT`) REFERENCES `fontes_evidencias_qualit` (`CD_DOC`),
  ADD CONSTRAINT `FK_metas_qualit` FOREIGN KEY (`CD_METAS_QUALIT`) REFERENCES `metas_qualit` (`CD_METAS_QUALIT`);

--
-- Restrições para tabelas `metas_qualit`
--
ALTER TABLE `metas_qualit`
  ADD CONSTRAINT `FK_metas_qualit_setor` FOREIGN KEY (`CD_SETOR`) REFERENCES `setores` (`CD_SETOR`),
  ADD CONSTRAINT `FK_metas_qualit_usuario` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
