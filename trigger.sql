--TRIGGER P/ ATUALIZAÇÃO DAS DOSES--
CREATE OR REPLACE FUNCTION atualiza_doses() RETURNS TRIGGER AS $atualiza_doses$
	BEGIN 

		UPDATE Remedios 
		SET doses_disponiveis = doses_disponiveis + NEW.quantidade
		WHERE nome = NEW.nome_remedio AND laboratorio = NEW.laboratorio_remedio;

		RETURN NEW;
	END
$atualiza_doses$ language plpgsql;

CREATE TRIGGER atualiza_doses AFTER UPDATE OR INSERT ON Atualiza FOR EACH ROW
EXECUTE PROCEDURE atualiza_doses();

--TRIGGER P/ MINISTRAÇÃO DAS DOSES--
CREATE OR REPLACE FUNCTION ministra_doses() RETURNS TRIGGER AS $ministra_doses$
	BEGIN 

		UPDATE Remedios 
		SET doses_disponiveis = doses_disponiveis - NEW.dosagem
		WHERE nome = NEW.nome_remedio AND laboratorio = NEW.laboratorio_remedio;

		RETURN NEW;
	END
$ministra_doses$ language plpgsql;

CREATE TRIGGER ministra_doses AFTER UPDATE OR INSERT ON Ministra FOR EACH ROW
EXECUTE PROCEDURE ministra_doses();