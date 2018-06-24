CREATE DATABASE movieagregator /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE movieagregator;

DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(45) NOT NULL,
  director varchar(45) NOT NULL,
  URL varchar(100) NOT NULL,
  year varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM movies;