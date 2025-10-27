CREATE TABLE nivel(
	codigoNivel INT PRIMARY KEY,
	descricao VARCHAR (90)
);



CREATE TABLE curso (
	codigoCurso INT PRIMARY KEY,
	nome VARCHAR (90),
	dataCriacao DATE NOT NULL,
	codigoNivel INT,
	FOREIGN KEY (codigoNivel) REFERENCES nivel(codigoNivel)
);

-- Altera (excluir e adicionar um novo campo)
ALTER TABLE curso DROP COLUMN dataCriacao;
ALTER TABLE curso ADD COLUMN criacaoData DATE NOT NULL;

-- Excluir 
--DROP TABLE curso;
--DROP TABLE nivel;

CREATE TABLE curso2(
	codigoCurso2 INT PRIMARY KEY,
	nome VARCHAR(90),
	dataCriacao DATE NOT NULL
);

CREATE TABLE disciplina(
	codigoDisciplina INT PRIMARY KEY,
	nome VARCHAR(90),
	cargaHoraria INT
);

-- Outra maneira de escrever o primary key e foreign key
-- CONSTRAIT DISCIPLINA_pk PRIMARY KEY (CODIGODISPLINA) 
-- CONSTRAIT cursodisplina FOREIGN KEY (CODIGOCURSO) REFERENCES CURSO (CODIGOCURSO)

CREATE TABLE curso2_disciplina(
	codigoCurso2 INT,
	codigoDisciplina INT,
	FOREIGN KEY (codigoCurso2) REFERENCES curso2(codigoCurso2),
	FOREIGN KEY (codigoDisciplina) REFERENCES disciplina(codigoDisciplina),
	PRIMARY KEY(codigoCurso2, codigoDisciplina)
);


CREATE TABLE curso_Disciplina(
	codigoCurso2 INT,
	codigoDisciplina INT,
	CONSTRAINT disciplina_curso FOREIGN KEY (codigoCurso2) REFERENCES curso2(codigoCurso2),
	CONSTRAINT curso_disciplina FOREIGN KEY (codigoDisciplina) REFERENCES disciplina(codigoDisciplina),
	CONSTRAINT id_qualquer PRIMARY KEY (codigoCurso2,codigoDisciplina)
);
