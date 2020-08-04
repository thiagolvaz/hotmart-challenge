CREATE TABLE categoria (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE produto (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	descricao VARCHAR(1000) NOT NULL,
	data_criacao DATETIME NOT NULL,
	id_categoria BIGINT(20) NOT NULL,
	score FLOAT DEFAULT(0),
	FOREIGN KEY(id_categoria) REFERENCES categoria(id)
);

CREATE TABLE comprador (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL
);

CREATE TABLE vendedor (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL
);

CREATE TABLE venda (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	id_vendedor BIGINT(20) NOT NULL,
	id_comprador BIGINT(20) NOT NULL,
	id_produto BIGINT(20) NOT NULL,
	FOREIGN KEY(id_vendedor) REFERENCES vendedor(id),
	FOREIGN KEY(id_comprador) REFERENCES comprador(id),
	FOREIGN KEY(id_produto) REFERENCES produto(id)
);

CREATE TABLE avaliacao (
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
	id_venda BIGINT(20) NOT NULL,
	avaliacao SMALLINT NOT NULL,
	data DATETIME NOT NULL,
	FOREIGN KEY(id_venda) REFERENCES venda(id)
);

-- TABELAS PARA AUDITORIA

CREATE TABLE REVINFO (
    REV BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    REVTSTMP bigint
);

CREATE TABLE produto_aud (
	id BIGINT(20) NOT NULL,
	nome VARCHAR(100),
	descricao VARCHAR(1000),
	data_criacao DATETIME,
	id_categoria BIGINT(20),
	score FLOAT DEFAULT(0),
	REV BIGINT(20),
	REVTYPE SMALLINT,
	PRIMARY KEY (id, REV)
);