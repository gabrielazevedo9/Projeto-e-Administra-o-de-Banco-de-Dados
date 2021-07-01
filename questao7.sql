CREATE TABLE empregado (
	cod_empregado INT, 
	nome_empregado VARCHAR(30), 
	rua VARCHAR(30), 
	cidade VARCHAR(20), 
	salario REAL,
    PRIMARY KEY (cod_empregado)
);

CREATE TABLE trabalha (
	cod_empregado INT,
	cod_companhia INT,
    	PRIMARY KEY(cod_empregado, cod_empregado),
   	CONSTRAINT fk_empregado FOREIGN KEY (cod_empregado)
        REFERENCES empregado(cod_empregado)
        ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_companhia FOREIGN KEY (cod_companhia)
        REFERENCES companhia(cod_companhia)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE companhia (
	cod_companhia INT, 
    CNPJ VARCHAR(15),
    nome_companhia VARCHAR(30), 
    cidade_companhia VARCHAR(20),
    PRIMARY KEY (cod_companhia)
);

CREATE TABLE gerente (
	cod_empregado INT, 
	cod_companhia INT,
    	PRIMARY KEY(cod_empregado, cod_empregado),
    	CONSTRAINT empregado_fk FOREIGN KEY (cod_empregado)
       	REFERENCES empregado(cod_empregado)
        ON DELETE RESTRICT ON UPDATE CASCADE,
  	CONSTRAINT companhia_fk FOREIGN KEY (cod_companhia)
       	REFERENCES companhia(cod_companhia)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO empregado(cod_companhia, nome_empregado, rua, cidade, salario) VALUES 
(0001, "Gabriel Azevedo dos Santos", "Tonheca Dantas", "Caicó", 2.500);

INSERT INTO trabalha(cod_empregado, cod_companhia) VALUES (0001, 2648);

INSERT INTO companhia(cod_companhia, CNPJ, nome_companhia, cidade_companhia) VALUES
 (2648,  "12.345.678/0001-09", "Google", "Caicó");

INSERT INTO gerente(cod_empregado, cod_companhia) VALUES (0002, 2648);
