DROP DATABASE IF EXISTS tp_db;
CREATE DATABASE tp_db;

USE tp_db;

create table paciente(nroDoc INT NOT NULL, nombre VARCHAR(50), apellido VARCHAR(50), tipoDoc VARCHAR(10),
fechaNac DATE, email VARCHAR(50), telefono VARCHAR(20), lugarNac VARCHAR(50),
	CONSTRAINT PK_paciente PRIMARY KEY (nroDoc)
);

create table medico(nroDoc INT NOT NULL, nombre VARCHAR(50), apellido VARCHAR(50), tipoDoc VARCHAR(10),
fechaNac DATE, email VARCHAR(50), telefono VARCHAR(20), lugarNac VARCHAR(50), matricula INT,
	CONSTRAINT PK_medico PRIMARY KEY (nroDoc)
);

create table agenda_medico(nroDoc INT, idAgenda INT, fecha DATE,  horaDesde TIME,  horaHasta TIME,
        CONSTRAINT PK_agenda PRIMARY KEY (idAgenda),
	CONSTRAINT FK_agendaMedico FOREIGN KEY (nroDoc) REFERENCES medico(nroDoc)
);

create table cobertura(idCobertura INT NOT NULL, nombre VARCHAR(50),
	CONSTRAINT PK_cobertura PRIMARY KEY (idCobertura)
);

create table plan(idPlan INT NOT NULL, nombre VARCHAR(50), idCobertura INT,
	CONSTRAINT PK_plan PRIMARY KEY (idPlan),
	CONSTRAINT FK_planCobertura FOREIGN KEY (idCobertura) REFERENCES cobertura(idCobertura)
);

create table turno(idTurno INT NOT NULL, fecha DATE, hora TIME, descripcion VARCHAR(50), nroDoc INT, idPlan INT,
	CONSTRAINT PK_turno PRIMARY KEY (idTurno),
	CONSTRAINT FK_turnoPaciente FOREIGN KEY (nroDoc) REFERENCES paciente(nroDoc),
	CONSTRAINT FK_turnoPlan FOREIGN KEY (idPlan) REFERENCES plan(idPlan)
);

create table prestacion(idPrestacion INT NOT NULL, nombre VARCHAR(50),
	CONSTRAINT PK_prestacion PRIMARY KEY (idPrestacion)
);

create table turno_prestacion(idTurno INT NOT NULL, idPrestacion INT,
	CONSTRAINT PK_turnoPrestacion PRIMARY KEY (idTurno,idPrestacion),
	CONSTRAINT FK_turno_prestacion FOREIGN KEY (idTurno) REFERENCES turno(idTurno),
	CONSTRAINT FK_prestacion FOREIGN KEY (idPrestacion) REFERENCES prestacion(idPrestacion)
);

create table atencion_turno(nroDoc INT, idTurno INT,
	CONSTRAINT PK_atencionTurno PRIMARY KEY (idTurno),
	CONSTRAINT FK_turno FOREIGN KEY (idTurno) REFERENCES turno(idTurno),
	CONSTRAINT FK_medico FOREIGN KEY (nroDoc) REFERENCES medico(nroDoc)
);

create table realiza_prestacion(nroDoc INT, idPrestacion INT, observaciones VARCHAR(100),
	CONSTRAINT PK_realizaPrestacion PRIMARY KEY (nroDoc, idPrestacion),
	CONSTRAINT FK_realiza_prestacion FOREIGN KEY (idPrestacion) REFERENCES prestacion(idPrestacion),
	CONSTRAINT FK_medico_prestacion FOREIGN KEY (nroDoc) REFERENCES medico(nroDoc)
);

create table plan_prestacion(idPlan INT, idPrestacion INT,
	CONSTRAINT PK_planPrestacion PRIMARY KEY (idPlan, idPrestacion),
	CONSTRAINT FK_plan FOREIGN KEY (idPlan) REFERENCES plan(idPlan),
	CONSTRAINT FK_plan_prestacion FOREIGN KEY (idPrestacion) REFERENCES prestacion(idPrestacion)
);

create table paciente_plan(nroDoc INT, idPlan INT,
	CONSTRAINT PK_pacientePlan PRIMARY KEY (nroDoc, idPlan),
	CONSTRAINT FK_paciente FOREIGN KEY (nroDoc) REFERENCES paciente(nroDoc),
	CONSTRAINT FK_paciente_plan FOREIGN KEY (idPlan) REFERENCES plan(idPlan)
);

create table fichado_paciente(nroDoc INT, nroDocMedico INT,
	CONSTRAINT PK_ficha PRIMARY KEY (nroDoc, nroDocMedico),
	CONSTRAINT FK_ficha_paciente FOREIGN KEY (nroDoc) REFERENCES paciente(nroDoc),
	CONSTRAINT FK_paciente_medico FOREIGN KEY (nroDocMedico) REFERENCES medico(nroDoc)
);