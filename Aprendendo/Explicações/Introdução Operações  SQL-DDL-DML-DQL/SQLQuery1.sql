-- Apagar base de dados caso exista 
-- DROP DATABASE Clinica_Medica;

-- Criar base de dados (Clinica Medica)
CREATE DATABASE Clinica_Medica;
GO

USE Clinica_Medica;
GO

CREATE TABLE Paciente (
	CPF VARCHAR(14) PRIMARY KEY,
	Nome VARCHAR(40),
	Telefone VARCHAR(30),
	NumeroPlano INT,
	NomePlano VARCHAR(20),
	TipoPlano VARCHAR(10)
);
GO

CREATE TABLE Medico (
	CRM INT PRIMARY KEY,
	NomeMedico VARCHAR(30),
	especialidade VARCHAR(20)
);
GO

CREATE TABLE Consulta (
	NumeroConsulta INT PRIMARY KEY IDENTITY(1,1), -- (Valor inicial, Incremento).
	DataConsulta DATE,
	HorarioConsulta TIME,
	CMR_Medico INT FOREIGN KEY REFERENCES Medico(CRM),
	CPF_Paciente VARCHAR(14) FOREIGN KEY REFERENCES Paciente(CPF)
);
GO

SELECT * FROM Paciente;  
SELECT * FROM Medico;
SELECT * FROM Consulta;
