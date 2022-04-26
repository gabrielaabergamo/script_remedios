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
	
-- CRIAÇÃO DOS DOMINOS

CREATE DOMAIN PHONE as 
	VARCHAR(11) CHECK 
		(VALUE ~ '^\d{10}$' OR VALUE ~ '^\d{11}$');
		
CREATE DOMAIN VARCPF as
	CHAR(11) CHECK
		(VALUE ~'^\d{11}$');

CREATE DOMAIN VARNAME as
	VARCHAR(255) CHECK
		(LENGTH(VALUE) > 2);

--CRIAÇÃO DAS TABELAS
		 
CREATE TABLE Medico (
	CPF VARCPF NOT NULL,
	nome VARNAME NOT NULL,
	data_de_nascimento DATE NOT NULL,
	CRM INT CHECK (CRM > 0) NOT NULL,
	CONSTRAINT CPF_medico primary key(CPF)
);

CREATE TABLE Enfermeiro (
	CPF VARCPF NOT NULL,
	nome VARNAME NOT NULL,
	data_de_nascimento DATE NOT NULL,
	COREM INT CHECK (COREM > 0) NOT NULL,
	CONSTRAINT CPF_enfermeiro primary key(CPF)
);

CREATE TABLE Remedios (
	nome VARNAME NOT NULL,
	laboratorio VARCHAR(255) NOT NULL,
	doses_disponiveis SMALLINT	NOT NULL, --criar domain
	uso_destinado VARCHAR(255) NOT NULL,
	CONSTRAINT ID_remedio primary key(nome, laboratorio)
);

CREATE TABLE Remedios_Composicao(
	composicao VARCHAR(255) NOT NULL,
	nome_remedio VARNAME NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	CONSTRAINT composto_isolado primary key (composicao, nome_remedio, laboratorio_remedio) 
);

CREATE TABLE Paciente (
	CPF VARCPF NOT NULL,
	nome  VARNAME NOT NULL,
	data_de_nascimento DATE NOT NULL,
	data_de_entrada DATE NOT NULL,
	contato_emergencia PHONE NOT NULL,
	CONSTRAINT CPF_paciente primary key(CPF)
);

CREATE TABLE Paciente_Caso(
	caso VARCHAR(255) NOT NULL,
	CPF_paciente VARCPF NOT NULL,
	FOREIGN KEY (CPF_paciente) REFERENCES Paciente(CPF)
		ON DELETE CASCADE,
	CONSTRAINT caso_isolado primary key(caso, CPF_paciente)
);

CREATE TABLE Paciente_Alergia(
	alergia VARCHAR(255) NOT NULL,
	CPF_paciente VARCPF NOT NULL,
	FOREIGN KEY (CPF_paciente) REFERENCES Paciente(CPF)
		ON DELETE CASCADE,
	CONSTRAINT alergia_isolado primary key(alergia, CPF_paciente)
);

CREATE TABLE Atualiza (
	data_hora TIMESTAMP NOT NULL,
	nome_remedio VARNAME NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	CPF_enfermeiro VARCPF NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	FOREIGN KEY (CPF_enfermeiro) REFERENCES Enfermeiro(CPF)
		ON DELETE SET NULL,
	CONSTRAINT atualizacao primary key (data_hora, nome_remedio, laboratorio_remedio, CPF_enfermeiro) 
);

CREATE TABLE Atualiza_Quantidade (
	quantidade INT CHECK (quantidade > 0) NOT NULL,
	nome_remedio VARNAME NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	CONSTRAINT atualizacao_qtd primary key (nome_remedio, laboratorio_remedio) 
);

CREATE TABLE Ministra(
	data_hora TIMESTAMP NOT NULL,
	nome_remedio VARNAME NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	CPF_paciente  VARCPF NOT NULL,
	CPF_medico VARCPF NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	FOREIGN KEY (CPF_medico) REFERENCES Medico(CPF)
		ON DELETE SET NULL,
	FOREIGN KEY (CPF_paciente) REFERENCES Paciente(CPF)
		ON DELETE SET NULL,
	CONSTRAINT ministrar primary key (data_hora, nome_remedio, laboratorio_remedio, CPF_paciente, CPF_medico) 
);

CREATE TABLE Ministra_Dosagem(
	dosagem INT CHECK (dosagem > 0) NOT NULL,
	nome_remedio VARNAME NOT NULL,
	laboratorio_remedio VARCHAR(255) NOT NULL,
	CPF_paciente VARCPF NOT NULL,
	FOREIGN KEY (nome_remedio, laboratorio_remedio) REFERENCES Remedios(nome, laboratorio),
	FOREIGN KEY (CPF_paciente) REFERENCES Paciente(CPF)
		ON DELETE SET NULL,
	CONSTRAINT ministrar_dose primary key (nome_remedio, laboratorio_remedio, CPF_paciente) 
);

--DROP TABLE Medico CASCADE;
--DROP TABLE Enfermeiro CASCADE;
--DROP TABLE Remedios CASCADE;
--DROP TABLE Remedios_Composicao CASCADE;
--DROP TABLE Paciente CASCADE;
--DROP TABLE Paciente_Caso CASCADE;
--DROP TABLE Paciente_Alergia CASCADE;
--DROP TABLE Atualiza CASCADE;
--DROP TABLE Atualiza_Quantidade CASCADE;
--DROP TABLE Ministra CASCADE;
--DROP TABLE Ministra_Dosagem CASCADE;