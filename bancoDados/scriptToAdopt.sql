CREATE database toadopt;
USE toadopt;

CREATE TABLE usuario(
  idUsuario INT PRIMARY KEY,
  nome VARCHAR(45) NULL,
  sobrenome  VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  telCel CHAR(11) NULL,
  senha CHAR(8)
 );

CREATE TABLE IF NOT EXISTS adocao(
  idAdocao INT,
  fkUsuario INT,
  nomeAnimal VARCHAR(45),
  especie CHAR(6),
  sexo CHAR(5),
  porte CHAR(7),
  PRIMARY KEY (idAdocao, fkUsuario),
  FOREIGN KEY (fkUsuario)
    REFERENCES usuario(idUsuario)
);

CREATE TABLE respostaQuiz(
  idQuiz INT,
  FKUsuario INT,
  resposta CHAR(2) NULL,
  PRIMARY KEY (idQuiz, FKUsuario),
  FOREIGN KEY (FKUsuario)
    REFERENCES usuario(idUsuario)
);

