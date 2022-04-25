-- Database: controle_remedios

DROP DATABASE IF EXISTS controle_remedios;

CREATE DATABASE controle_remedios
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
CREATE TABLE Medico (
	CPF VARCHAR(11) NOT NULL,
	nome VARCHAR(255) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	CRM INT NOT NULL,
	CONSTRAINT CPF_medico primary key(CPF)
);

CREATE TABLE Enfermeiro (
	CPF VARCHAR(11) NOT NULL,
	nome VARCHAR(255) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	COREM INT NOT NULL,
	CONSTRAINT CPF_enfermeiro primary key(CPF)
);

CREATE TABLE Remedios (
	nome VARCHAR(255) NOT NULL,
	laboratorio VARCHAR(255) NOT NULL,
	doses_disponiveis SMALLINT	NOT NULL, --criar domain
	uso_destinado VARCHAR(255) NOT NULL,
	CONSTRAINT ID_remedio primary key(nome, laboratorio)
);

CREATE TABLE Remedios_Composicao(
	composicao VARCHAR(255) NOT NULL,
	nome_remedio VARCHAR(255) NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	CONSTRAINT composto_isolado primary key (composicao, nome_remedio, laboratorio_remedio) 
);

CREATE TABLE Paciente (
	CPF VARCHAR(11) NOT NULL,
	nome VARCHAR(255) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	data_de_entrada DATE NOT NULL,
	contato_emergencia VARCHAR(11) NOT NULL,
	CONSTRAINT CPF_paciente primary key(CPF)
);

CREATE TABLE Paciente_Caso(
	caso VARCHAR(255) NOT NULL,
	CPF_paciente VARCHAR(11) NOT NULL,
	FOREIGN KEY (CPF_paciente) REFERENCES Paciente(CPF),
	CONSTRAINT caso_isolado primary key(caso, CPF_paciente)
);

CREATE TABLE Paciente_Alergia(
	alergia VARCHAR(255) NOT NULL,
	CPF_paciente VARCHAR(11) NOT NULL,
	FOREIGN KEY (CPF_paciente) REFERENCES Paciente(CPF),
	CONSTRAINT alergia_isolado primary key(alergia, CPF_paciente)
);

CREATE TABLE Atualiza (
	data_hora TIMESTAMP NOT NULL,
	nome_remedio VARCHAR(255) NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	CPF_enfermeiro VARCHAR(11) NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	FOREIGN KEY (CPF_enfermeiro) REFERENCES Enfermeiro(CPF),
	CONSTRAINT atualizacao primary key (data_hora, nome_remedio, laboratorio_remedio, CPF_enfermeiro) 
);

CREATE TABLE Atualiza_Quantidade (
	quantidade INT NOT NULL,
	nome_remedio VARCHAR(255) NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	CONSTRAINT atualizacao_qtd primary key (nome_remedio, laboratorio_remedio) 
);

	