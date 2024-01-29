USE HSL_TESTE
GO

DROP TABLE IF EXISTS EMPRESA_PRODUTO
DROP TABLE IF EXISTS EMPRESA_USUARIO
DROP TABLE IF EXISTS EQUIPE_USUARIO
DROP TABLE IF EXISTS EQUIPE_PRODUTO
DROP TABLE IF EXISTS VENDA
DROP TABLE IF EXISTS OBJETIVO
DROP TABLE IF EXISTS EQUIPE
DROP TABLE IF EXISTS EMPRESA
DROP TABLE IF EXISTS PRODUTO
DROP TABLE IF EXISTS USUARIO

CREATE TABLE EMPRESA
(
	CD_EMPRESA INT IDENTITY,
	NM_EMPRESA VARCHAR(100) NOT NULL,
	PRIMARY KEY(CD_EMPRESA)
)

CREATE TABLE PRODUTO
(
	CD_PRODUTO INT IDENTITY,
	NM_PRODUTO VARCHAR(100) NOT NULL,
	EAN VARCHAR(13) NOT NULL,
	PRIMARY KEY(CD_PRODUTO),
	UNIQUE (EAN)
)

CREATE TABLE EMPRESA_PRODUTO
(
	CD_EMPRESA_PRODUTO INT IDENTITY,
	CD_EMPRESA INT NOT NULL,
	CD_PRODUTO INT NOT NULL,
	PRIMARY KEY(CD_EMPRESA_PRODUTO),
	FOREIGN KEY (CD_EMPRESA) REFERENCES EMPRESA(CD_EMPRESA),
	FOREIGN KEY (CD_PRODUTO) REFERENCES PRODUTO(CD_PRODUTO)
)

CREATE TABLE USUARIO
(
	CD_USUARIO INT IDENTITY,
	NM_USUARIO VARCHAR(100) NOT NULL,
	PRIMARY KEY(CD_USUARIO)
)

CREATE TABLE EMPRESA_USUARIO
(
	CD_EMPRESA_USUARIO INT IDENTITY,
	CD_EMPRESA INT NOT NULL,
	CD_USUARIO INT NOT NULL,
	PRIMARY KEY(CD_EMPRESA_USUARIO),
	FOREIGN KEY (CD_EMPRESA) REFERENCES EMPRESA(CD_EMPRESA),
	FOREIGN KEY (CD_USUARIO) REFERENCES USUARIO(CD_USUARIO)
)

CREATE TABLE EQUIPE
(
	CD_EQUIPE INT IDENTITY,
	NM_EQUIPE VARCHAR(100) NOT NULL,
	CD_EMPRESA INT,
	PRIMARY KEY(CD_EQUIPE),
	FOREIGN KEY (CD_EMPRESA) REFERENCES EMPRESA(CD_EMPRESA)
)

CREATE TABLE EQUIPE_USUARIO
(
	CD_EQUIPE_USUARIO INT IDENTITY,
	CD_EQUIPE INT NOT NULL,
	CD_USUARIO INT NOT NULL,
	PRIMARY KEY(CD_EQUIPE_USUARIO),
	FOREIGN KEY (CD_EQUIPE) REFERENCES EQUIPE(CD_EQUIPE),
	FOREIGN KEY (CD_USUARIO) REFERENCES USUARIO(CD_USUARIO)
)

CREATE TABLE VENDA
(
	CD_VENDA INT IDENTITY,
	CD_PRODUTO INT NOT NULL,
	CD_EQUIPE INT NOT NULL,
	CD_USUARIO INT NOT NULL,
	DT_PERIODO DATETIME NOT NULL,
	NR_QUANTIDADE INT NOT NULL,
	PRIMARY KEY(CD_VENDA),
	FOREIGN KEY (CD_EQUIPE) REFERENCES EQUIPE(CD_EQUIPE),
	FOREIGN KEY (CD_PRODUTO) REFERENCES PRODUTO(CD_PRODUTO),
	FOREIGN KEY (CD_USUARIO) REFERENCES USUARIO(CD_USUARIO)
)

CREATE TABLE OBJETIVO
(
	CD_VENDA INT IDENTITY,
	CD_PRODUTO INT NOT NULL,
	CD_EQUIPE INT NOT NULL,
	CD_USUARIO INT NOT NULL,
	DT_PERIODO DATETIME NOT NULL,
	NR_QUANTIDADE INT NOT NULL,
	PRIMARY KEY(CD_VENDA),
	FOREIGN KEY (CD_EQUIPE) REFERENCES EQUIPE(CD_EQUIPE),
	FOREIGN KEY (CD_PRODUTO) REFERENCES PRODUTO(CD_PRODUTO),
	FOREIGN KEY (CD_USUARIO) REFERENCES USUARIO(CD_USUARIO)
)

CREATE TABLE EQUIPE_PRODUTO
(
	CD_EQUIPE_PRODUTO INT IDENTITY,
	CD_EQUIPE INT NOT NULL,
	CD_PRODUTO INT NOT NULL,
	NR_PESO FLOAT NOT NULL
	PRIMARY KEY(CD_EQUIPE_PRODUTO),
	FOREIGN KEY (CD_EQUIPE) REFERENCES EQUIPE(CD_EQUIPE),
	FOREIGN KEY (CD_PRODUTO) REFERENCES PRODUTO(CD_PRODUTO)
)

