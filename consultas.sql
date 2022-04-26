--Consulta 1 - Qual a quantidade de laboratórios de medicamentos disponíveis?
SELECT count(DISTINCT laboratorio)
    FROM Remedios;
	
	
--Consulta 2 - Quais remédios foram atualizados no sistema por um determinado enfermeiro?
SELECT t2.Nome 
	FROM ( 
		SELECT CPF_Enfermeiro
		FROM Atualiza
		WHERE CPF_Enfermeiro = <cpf>
	) t1
	INNER JOIN (
				SELECT Nome, CPF
				FROM Enfermeiro
				) t2
				ON t1.cpf_enfermeiro = t2.cpf;


--Consulta 3 - Quantas doses de um determinado remédio estão disponíveis?
SELECT nome, doses_disponiveis FROM remedios r
         WHERE nome = <nome_remedio>;
	
	
--Consulta 4 - Quais remédios disponíveis que se encaixam com determinado caso do paciente?
SELECT nome FROM Remedios r
	JOIN Paciente_Caso pc 
	ON r.uso_destinado = pc.caso
	WHERE pc.caso = <caso_determinado>
	GROUP BY nome;


--Consulta 5 - Quais pacientes foram medicados no mesmo dia que entraram?
SELECT nome, cpf FROM paciente p
    JOIN ministra m
    ON m.data_hora::date = p.data_de_entrada
	WHERE p.cpf = m.cpf_paciente
    GROUP BY nome, cpf;
	
	
--Consulta 6 - Quais pacientes possuem alergia a um determinado elemento na composição de um remédio?
SELECT CPF_Paciente
    FROM Paciente_Alergia
    WHERE alergia = <alergia>;


--Consulta 7 - Quantos remédios são fabricados por cada laboratório?
SELECT laboratorio, count(Nome)
    FROM Remedios
    GROUP BY laboratorio;


--Consulta 8 - Quais pacientes possuem mais de três alergias e quais são essas alergias?
 SELECT t2.Nome, t3.alergia
	    FROM (
			SELECT CPF_Paciente,count(Alergia)
			FROM Paciente_Alergia
			GROUP BY CPF_Paciente
			HAVING count(Alergia) >= 3
)t1
			INNER JOIN (
	SELECT Nome, CPF 
	FROM Paciente
)t2
ON t1.cpf_paciente = t2.cpf
			INNER JOIN (
				SELECT CPF_Paciente, alergia 
			 	FROM Paciente_Alergia
)t3
ON t3.cpf_paciente = t1.cpf_paciente;
