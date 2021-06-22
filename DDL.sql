CREATE TABLE banco (
	numero INTEGER NOT NULL,
	nome VARCHAR (50) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY key (numero)
);

CREATE TABLE agencia (
	banco_numerico INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	nome Varchar (80) NOT NULL,
	PRIMARY key (banco_numerico,numero),
	FOREIGN KEY (banco_numerico) REFERENCES banco (numero)
);

CREATE TABLE cliente(
	numero BIGSERIAL,
	nome VARCHAR(150) NOT NULL,
	emial VARCHAR(450) NOT NULL,
	PRIMARY KEY (numero)

);

CREATE TABLE conta_corrente(
	banco_numero INTEGER NOT NULL,
	agencia_numero INTEGER NOT NULL,
	numero BIGINT NOT NULL,
	digito SMALLINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (banco_numero,agencia_numero,numero,digito,cliente_numero),
	FOREIGN KEY (banco_numero,agencia_numero) REFERENCES agencia (banco_numerico,numero),
	FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)

);

CREATE TABLE tipo_transacao(
	id SMALLSERIAL,
	nome VARCHAR(50),
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
	
);

CREATE TABLE cliente_transacoes(
	id BIGSERIAL, 
	banco_numero INTEGER NOT NULL,
	agencia_numero INTEGER NOT NULL,
	conta_corrente_numero BIGINT NOT NULL,
	conta_corrente_digito SMALLINT NOT NULL,
	cliente_numero BIGINT NOT NULL,
	tipo_transacao_id SMALLINT NOT NULL,
	valor NUMERIC(15,2) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,	
	PRIMARY KEY (id),
	FOREIGN KEY (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero) REFERENCES conta_corrente(banco_numero,agencia_numero,numero,digito,cliente_numero)
	
);