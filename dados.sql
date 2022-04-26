-- Populando o Banco

--MEDICOS--
INSERT INTO Medico 
	VALUES (95620594807, 'José Augusto', '1977-01-01', 9876);
	
INSERT INTO Medico 
	VALUES (59999198864, 'Solange Santos', '1988-03-17', 17890);
	
INSERT INTO Medico 
	VALUES (15347709847, 'Billy Linguini', '1991-12-10', 22876);
	
INSERT INTO Medico 
	VALUES (78245495859, 'Arnaldo Faria de Souza', '1942-11-28', 2888);
	
INSERT INTO Medico 
	VALUES (52775330878, 'Marcela Pereira', '1999-04-19', 96314);
	
--ENFERMEIROS--
INSERT INTO Enfermeiro 
	VALUES (12795147874, 'Carlos Prestes', '1982-10-10', 10111);
	
INSERT INTO Enfermeiro 
	VALUES (13767793822, 'Emanuel Vitto', '1990-02-01', 9982);
	
INSERT INTO Enfermeiro 
	VALUES (63585511830, 'Ana Clara Machado', '1999-09-06', 777666);
	
INSERT INTO Enfermeiro 
	VALUES (31053060807, 'Bruna Rodrigues Oliveira', '1987-03-11', 8919);
	
INSERT INTO Enfermeiro 
	VALUES (51723859834, 'Magnus Antedeguemon', '1980-07-21', 29012);
	
--PACIENTES--
INSERT INTO Paciente 
	VALUES (45380517803, 'Thiago Toguro', '2002-08-12', '2022-03-19', 1130444766);

INSERT INTO Paciente 
	VALUES (33335600894, 'Serafina Melo', '1987-11-10', '2021-12-30', 1734546426);
	
INSERT INTO Paciente 
	VALUES (70993275850, 'Daniel Orivaldo da Silva', '1980-05-23', '2022-04-01', 1929683802);
	
INSERT INTO Paciente 
	VALUES (61631636804, 'Lucas Anderiscor', '1922-12-25', '2022-02-10', 1834026490);
	
INSERT INTO Paciente 
	VALUES (16351920809, 'Guilherme Bartolomeu Silva', '1957-02-11', '2022-04-11', 19991937444);
	
INSERT INTO Paciente 
	VALUES (17926818879, 'Casimiro Miguel', '1989-06-16', '2022-03-13', 18975727414);
	
INSERT INTO Paciente 
	VALUES (53469578800, 'Eva Salomão Aquino', '1981-01-17', '2022-03-17', 13973122335);

INSERT INTO Paciente 
	VALUES (37496351881, 'Lais Pires Guerreiro', '2010-04-18', '2022-04-10', 12974978512);
	
--REMEDIOS--
INSERT INTO Remedios 
	VALUES ('Novalgina', 'Medley', 10, 'Dores');
	
INSERT INTO Remedios 
	VALUES ('Dorflex', 'Sanofi Aventis', 22, 'Dores');
	
INSERT INTO Remedios 
	VALUES ('Torsilax', 'Bayern', 40, 'Dores');
	
INSERT INTO Remedios 
	VALUES ('Dramin', 'Medley', 15, 'Náusea');
	
INSERT INTO Remedios 
	VALUES ('Tylenol', 'Genérico', 20, 'Febre');
	
INSERT INTO Remedios 
	VALUES ('Losartana', 'EMS', 25, 'Hipertensão');
	
INSERT INTO Remedios 
	VALUES ('Allegra', 'Sanofi Aventis', 30, 'Reação Alérgica');
	
INSERT INTO Remedios 
	VALUES ('Dexametasona', 'EMS', 33, 'Reação Alérgica');
	
INSERT INTO Remedios 
	VALUES ('Scaflan', 'Genérico', 35, 'Inflamação');
	
--REMEDIOS_COMPOSICAO--
INSERT INTO Remedios_Composicao 
	VALUES ('Dipirona', 'Novalgina', 'Medley');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Dimenidrinato', 'Dramin', 'Medley');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Paracetamol', 'Tylenol', 'Genérico');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Carvedilol', 'Losartana', 'EMS');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Povidona', 'Losartana', 'EMS');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Fexofenadina', 'Allegra', 'Sanofi Aventis');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Povidona', 'Allegra', 'Sanofi Aventis');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Nimesulida', 'Scaflan', 'Genérico');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Hidroxopropil', 'Scaflan', 'Genérico');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Hidroxopropil', 'Dramin', 'Medley');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Acetaminofeno', 'Torsilax', 'Bayern');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Orfenadrina', 'Dorflex', 'Sanofi Aventis');
	
INSERT INTO Remedios_Composicao 
	VALUES ('Corticosteroide', 'Dexametasona', 'EMS');
	
--PACIENTE_CASO--
INSERT INTO Paciente_Caso 
	VALUES ('Dores', '45380517803');
	
INSERT INTO Paciente_Caso 
	VALUES ('Dores', '33335600894');
	
INSERT INTO Paciente_Caso 
	VALUES ('Náusea', '45380517803');
	
INSERT INTO Paciente_Caso 
	VALUES ('Febre', '70993275850');
	
INSERT INTO Paciente_Caso 
	VALUES ('Hipertensão', '61631636804');
	
INSERT INTO Paciente_Caso 
	VALUES ('Dores', '16351920809');
	
INSERT INTO Paciente_Caso 
	VALUES ('Reação Alérgica', '17926818879');
	
INSERT INTO Paciente_Caso 
	VALUES ('Reação Alérgica', '53469578800');
	
INSERT INTO Paciente_Caso 
	VALUES ('Inflamação', '37496351881');
	
INSERT INTO Paciente_Caso 
	VALUES ('Reação Alérgica', '37496351881');
	
--PACIENTE_ALERGIA--
INSERT INTO Paciente_Alergia 
	VALUES ('Orfenadrina', '37496351881');
	
INSERT INTO Paciente_Alergia 
	VALUES ('Povidona', '37496351881');
	
INSERT INTO Paciente_Alergia 
	VALUES ('Paracetamol', '37496351881');
	
INSERT INTO Paciente_Alergia 
	VALUES ('Corticosteroide', '17926818879');
	
INSERT INTO Paciente_Alergia  
	VALUES ('Dipirona', '45380517803');
	
INSERT INTO Paciente_Alergia  
	VALUES ('Acetaminofeno', '45380517803');
	
INSERT INTO Paciente_Alergia 
	VALUES ('Acetaminofeno', '70993275850');
	
--ATUALIZA--
INSERT INTO Atualiza
	VALUES ('2022-03-10 12:04:02', 'Tylenol', 'Genérico', '12795147874', 12);
	
INSERT INTO Atualiza
	VALUES ('2022-04-01 16:33:10', 'Losartana', 'EMS', '51723859834', 9);
	
INSERT INTO Atualiza
	VALUES ('2022-04-14 06:44:56', 'Scaflan', 'Genérico', '63585511830', 14);
	
INSERT INTO Atualiza
	VALUES ('2022-04-14 07:02:16', 'Scaflan', 'Genérico', '63585511830', 2);
	
--MINISTRA--
INSERT INTO Ministra
	VALUES ('2022-02-11 19:22:11', 'Losartana', 'EMS', '61631636804', '95620594807', 1); --lucas
	
INSERT INTO Ministra
	VALUES ('2022-03-30 21:02:01', 'Tylenol', 'Genérico', '70993275850', '59999198864', 2); --daniel
	
INSERT INTO Ministra
	VALUES ('2022-04-11 16:33:10', 'Scaflan', 'Genérico', '37496351881', '78245495859', 3); --lais
	
INSERT INTO Ministra
	VALUES ('2022-04-11 16:58:59', 'Dexametasona', 'EMS', '37496351881', '52775330878', 1); --lais
	
INSERT INTO Ministra
	VALUES ('2022-03-19 08:00:31', 'Dorflex', 'Sanofi Aventis', '45380517803', '15347709847', 2); --toguro
	
INSERT INTO Ministra
	VALUES ('2022-03-19 11:05:20', 'Dramin', 'Medley', '45380517803', '15347709847', 3); --toguro
	
INSERT INTO Ministra
	VALUES ('2022-01-01 11:59:55', 'Novalgina', 'Medley', '33335600894', '95620594807', 4); --serafina
	
	