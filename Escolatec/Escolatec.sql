CREATE DATABASE  IF NOT EXISTS `escolatec`;
USE `escolatec`;


DROP TABLE IF EXISTS `alunos`;
CREATE TABLE `alunos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `alunos` WRITE;
INSERT INTO `alunos` VALUES (1,'João Silva',18,'joao.silva@example.com'),(2,'Maria Santos',20,'maria.santos@example.com'),(3,'Pedro Oliveira',19,'pedro.oliveira@example.com'),(4,'Helena Nogueira',19,'heleny.nog@gmail.com');

UNLOCK TABLES;
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `cursos` WRITE;
INSERT INTO `cursos` VALUES (1,'Técnico Informática','Curso de Manutenção de Computadores e desenvolvimento de software'),(2,'Técnico em Redes','Curso de Redes de Computadores'),(3,'Inglês','Curso de inglês Avançado');
UNLOCK TABLES;

DROP TABLE IF EXISTS `disciplinas`;

CREATE TABLE `disciplinas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `carga_horaria` int DEFAULT NULL,
  `professor_id` int DEFAULT NULL,
  `curso_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_id` (`professor_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professores` (`id`),
  CONSTRAINT `disciplinas_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `disciplinas` WRITE;
INSERT INTO `disciplinas` VALUES (1,'Lógica de ',30,1,1),(2,'Protocolos de Redes',45,2,2),(3,'Conversação em Inglês',60,3,3),(4,'Manutenção de computadores I',48,1,1);
UNLOCK TABLES;


DROP TABLE IF EXISTS `matriculas`;
CREATE TABLE `matriculas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aluno_id` int DEFAULT NULL,
  `disciplina_id` int DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_id` (`aluno_id`),
  KEY `disciplina_id` (`disciplina_id`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `matriculas` WRITE;
INSERT INTO `matriculas` VALUES (1,1,1,'2022-01-15'),(2,1,2,'2022-02-01'),(3,2,2,'2022-02-10'),(4,2,3,'2023-04-18'),(5,3,3,'2022-03-05'),(6,1,3,'2023-04-11'),(7,4,2,'2023-06-01'),(8,3,2,'2023-05-19');
UNLOCK TABLES;

DROP TABLE IF EXISTS `professores`;
CREATE TABLE `professores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `professores` WRITE;
INSERT INTO `professores` VALUES (1,'Ana Souza',35,'ana.souza@example.com','Hardware'),(2,'Carlos Ferreira',40,'carlos.ferreira@example.com','Redes'),(3,'Luciana Santos',30,'luciana.santos@example.com','Inglês');
UNLOCK TABLES;
