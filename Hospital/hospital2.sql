CREATE DATABASE  IF NOT EXISTS `hospital2`
USE `hospital2`;


DROP TABLE IF EXISTS `consultas`;

CREATE TABLE `consultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int NOT NULL,
  `medico_id` int NOT NULL,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `consultas` WRITE;
INSERT INTO `consultas` VALUES (1,1,1,'2023-06-01','10:00:00'),(2,2,2,'2023-06-02','14:30:00'),(3,3,3,'2023-06-03','11:15:00'),(4,3,2,'2023-05-03','10:05:00'),(5,4,4,'2023-06-03','09:00:00'),(6,3,1,'2023-05-02','10:05:00'),(7,3,4,'2023-06-01','10:05:00'),(8,3,1,'2023-05-20','10:05:00');
UNLOCK TABLES;


DROP TABLE IF EXISTS `medicos`;
CREATE TABLE `medicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `medicos` WRITE;
INSERT INTO `medicos` VALUES (1,'Dr. Carlos Lima','Cardiologia'),(2,'Dra. Ana Oliveira','Pediatria'),(3,'Dr. André Santos','Ortopedia'),(4,'Dra. Luana Truman','Endocrinologista');
UNLOCK TABLES;


DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `idade` int NOT NULL,
  `sexo` enum('Masculino','Feminino') NOT NULL,
  `endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `pacientes` WRITE;
INSERT INTO `pacientes` VALUES (1,'João Silva',35,'Masculino','Rua A, 123'),(2,'Maria Santos',42,'Feminino','Av. B, 456'),(3,'Pedro Rocha',28,'Masculino','Rua C, 789'),(4,'Helena Nogueira',19,'Feminino','Rua C, 789');
UNLOCK TABLES;


DROP TABLE IF EXISTS `prontuarios`;
CREATE TABLE `prontuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int NOT NULL,
  `medico_id` int NOT NULL,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `diagnostico` varchar(200) NOT NULL,
  `receita` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `prontuarios_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `prontuarios_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `prontuarios` WRITE;
INSERT INTO `prontuarios` VALUES (1,1,1,'2023-06-01','10:00:00','Pressão alta','AAS 100mg diariamente'),(2,2,2,'2023-06-02','14:30:00','Resfriado','Repouso e hidratação'),(3,3,3,'2023-06-03','11:15:00','Fratura no braço','Imobilização e analgésicos'),(4,3,2,'2023-05-03','10:05:00','Enxaqueca','Relaxamento muscular e analgésicos'),(5,4,4,'2023-06-03','09:00:00','hiperandrogenismo','Terapia hormonal'),(6,3,1,'2023-05-03','10:05:00','Pressão alta','BBs 150mg diariamente'),(7,3,4,'2023-06-01','10:05:00','hipertireoidismo','Dieta a base de iodo');
UNLOCK TABLES;

