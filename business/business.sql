CREATE DATABASE  IF NOT EXISTS `business`;
USE `business`;

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos` (
  `idCargos` int NOT NULL,
  `nome` varchar(70) NOT NULL,
  PRIMARY KEY (`idCargos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `cargos` WRITE;
INSERT INTO `cargos` VALUES (1,'Gerente'),(2,'Desenvolvedor'),(3,'Analista');
UNLOCK TABLES;

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `idClientes` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `enderecos` varchar(200) NOT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `clientes` WRITE;
INSERT INTO `clientes` VALUES (1,'Empresa X','Endereço 1'),(2,'Empresa Y','Endereço 2');
UNLOCK TABLES;


DROP TABLE IF EXISTS `clientes_has_contrata`;
CREATE TABLE `clientes_has_contrata` (
  `Clientes_idClientes` int NOT NULL,
  `Departamentos_idDepartamentos` int NOT NULL,
  PRIMARY KEY (`Clientes_idClientes`,`Departamentos_idDepartamentos`),
  KEY `fk_Clientes_has_Departamentos_Departamentos1_idx` (`Departamentos_idDepartamentos`),
  KEY `fk_Clientes_has_Departamentos_Clientes1_idx` (`Clientes_idClientes`),
  CONSTRAINT `fk_Clientes_has_Departamentos_Clientes1` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `fk_Clientes_has_Departamentos_Departamentos1` FOREIGN KEY (`Departamentos_idDepartamentos`) REFERENCES `departamentos` (`idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `clientes_has_contrata` WRITE;
INSERT INTO `clientes_has_contrata` VALUES (1,1),(2,2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `idDepartamentos` int NOT NULL,
  `Nome` varchar(70) NOT NULL,
  `Localização` varchar(100) NOT NULL,
  PRIMARY KEY (`idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
LOCK TABLES `departamentos` WRITE;
INSERT INTO `departamentos` VALUES (1,'RH','São Paulo'),(2,'TI','Rio de Janeiro');
UNLOCK TABLES;

DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE `funcionarios` (
  `idFuncionarios` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `Salario` float NOT NULL,
  `Cargos_idCargos` int NOT NULL,
  PRIMARY KEY (`idFuncionarios`,`Cargos_idCargos`),
  KEY `fk_Funcionarios_Cargos1_idx` (`Cargos_idCargos`),
  CONSTRAINT `fk_Funcionarios_Cargos1` FOREIGN KEY (`Cargos_idCargos`) REFERENCES `cargos` (`idCargos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `funcionarios` WRITE;
INSERT INTO `funcionarios` VALUES (1,'João Silva',5000,1),(2,'Maria Santos',4000,2),(3,'Pedro Almeida',3500,2),(4,'Helena Nogueira',7000,2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `infos_proj`;
CREATE TABLE `infos_proj` (
  `data_inicio` date NOT NULL,
  `data_final` date NOT NULL,
  `Projetos_idProjetos` int NOT NULL,
  PRIMARY KEY (`Projetos_idProjetos`),
  CONSTRAINT `fk_Infos_proj_Projetos1` FOREIGN KEY (`Projetos_idProjetos`) REFERENCES `projetos` (`idProjetos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `infos_proj` WRITE;
INSERT INTO `infos_proj` VALUES ('2023-01-01','2023-12-31',1),('2023-06-01','2023-12-31',2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `lotado_em`;
CREATE TABLE `lotado_em` (
  `Departamentos_idDepartamentos` int NOT NULL,
  `Funcionarios_idFuncionarios` int NOT NULL,
  PRIMARY KEY (`Departamentos_idDepartamentos`,`Funcionarios_idFuncionarios`),
  KEY `fk_Departamentos_has_Funcionarios_Funcionarios1_idx` (`Funcionarios_idFuncionarios`),
  KEY `fk_Departamentos_has_Funcionarios_Departamentos_idx` (`Departamentos_idDepartamentos`),
  CONSTRAINT `fk_Departamentos_has_Funcionarios_Departamentos` FOREIGN KEY (`Departamentos_idDepartamentos`) REFERENCES `departamentos` (`idDepartamentos`),
  CONSTRAINT `fk_Departamentos_has_Funcionarios_Funcionarios1` FOREIGN KEY (`Funcionarios_idFuncionarios`) REFERENCES `funcionarios` (`idFuncionarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `lotado_em` WRITE;
INSERT INTO `lotado_em` VALUES (1,1),(2,2),(2,3),(2,4);
UNLOCK TABLES;

DROP TABLE IF EXISTS `projetos`;
CREATE TABLE `projetos` (
  `idProjetos` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `Departamentos_idDepartamentos` int NOT NULL,
  PRIMARY KEY (`idProjetos`,`Departamentos_idDepartamentos`),
  KEY `fk_Projetos_Departamentos1_idx` (`Departamentos_idDepartamentos`),
  CONSTRAINT `fk_Projetos_Departamentos1` FOREIGN KEY (`Departamentos_idDepartamentos`) REFERENCES `departamentos` (`idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `projetos` WRITE;
INSERT INTO `projetos` VALUES (1,'Projeto A',1),(2,'Projeto B',2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `trabalha_em`;
CREATE TABLE `trabalha_em` (
  `Projetos_idProjetos` int NOT NULL,
  `Funcionarios_idFuncionarios` int NOT NULL,
  PRIMARY KEY (`Projetos_idProjetos`,`Funcionarios_idFuncionarios`),
  KEY `fk_Projetos_has_Funcionarios_Funcionarios1_idx` (`Funcionarios_idFuncionarios`),
  KEY `fk_Projetos_has_Funcionarios_Projetos1_idx` (`Projetos_idProjetos`),
  CONSTRAINT `fk_Projetos_has_Funcionarios_Funcionarios1` FOREIGN KEY (`Funcionarios_idFuncionarios`) REFERENCES `funcionarios` (`idFuncionarios`),
  CONSTRAINT `fk_Projetos_has_Funcionarios_Projetos1` FOREIGN KEY (`Projetos_idProjetos`) REFERENCES `projetos` (`idProjetos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `trabalha_em` WRITE;
INSERT INTO `trabalha_em` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(2,4);
UNLOCK TABLES;

