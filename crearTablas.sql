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
	CONSTRAINT PK_atencionTurno PRIMARY KEY (nroDoc),
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



	/* INSERTAR PACIENTES */

INSERT INTO paciente VALUES (30786654,'Raul', 'Maidana', 'DNI', '1983-10-12', 'raulm@gmail.com', '11-45657788', 'C.A.B.A.');
INSERT INTO paciente VALUES (32786111,'Josefina', 'Martinez', 'DNI', '1985-03-01', 'josemartinez@gmail.com', '11-00997766', 'Martinez. BS AS.');
INSERT INTO paciente VALUES (22745634,'Carlos', 'Bianchi', 'DNI', '1973-11-03', 'carlosbianchi@gmail.com', '11-00887766', 'Palermo C.A.B.A.');
INSERT INTO paciente VALUES (10287889,'Marcela', 'Ramirez', 'DNI', '1986-07-02', 'marcelaram@hotmail.com', '11-45110022', 'Belgrano C.A.B.A.');
INSERT INTO paciente VALUES (34752654,'Benjamin', 'Diaz', 'DNI', '1988-01-10', 'benjadiaz@gmail.com', '11-32244564', 'Avellaneda. BS AS.');
INSERT INTO paciente VALUES (29887765,'Lucia', 'Galvez', 'DNI', '1984-11-29', 'luciagal@hotmail.com', '11-00099987', 'Colegiales C.A.B.A.');
INSERT INTO paciente VALUES (28793654,'Ernesto', 'Lopez', 'DNI', '1983-02-25', 'elopez@gmail.com', '11-45999088', 'Vicente Lopez BS AS.');
INSERT INTO paciente VALUES (34222111,'Claudia', 'Vieria', 'DNI', '1989-01-01', 'vclaudia@hotmail.com', '11-25657388', 'Pergamino BS AS.');
INSERT INTO paciente VALUES (28785694,'Rodrigo', 'Mora', 'DNI', '1984-11-22', 'rmora@gmail.com', '11-44356788', 'Villa Crespo C.A.B.A.');
INSERT INTO paciente VALUES (31998654,'Juan Roman', 'Riquelme', 'DNI', '1984-11-22', 'roman10@gmail.com', '11-66667788', 'Sarandi BS AS.');
INSERT INTO paciente VALUES (11289983,'Juan', 'Mansalva', 'DNI', '1968-02-18', 'jmansalva@gmail.com', '11-44411788', 'Balvanera C.A.B.A.');

	/* INSERTAR MEDICOS */

INSERT INTO medico VALUES (20987765,'Veronica', 'Duran', 'DNI', '1973-10-12', 'veronicaduran@gmail.com', '11-00006788', 'Palermo C.A.B.A.', 45321);
INSERT INTO medico VALUES (32442786,'Cesar', 'Crespo', 'DNI', '1982-07-22', 'ccrespo@hotmail.com', '11-11006418', 'Avellaneda BS AS.', 42221);
INSERT INTO medico VALUES (22987980,'Matias', 'Almeyda', 'DNI', '1978-11-12', 'matiasalmeyda@gmail.com', '11-22223248', 'La Playosa CBA.', 40091);
INSERT INTO medico VALUES (25644324,'Julieta', 'Donovan', 'DNI', '1980-09-22', 'julidonovan@gmail.com', '11-31136688', 'Martinez BS AS.', 40009);
INSERT INTO medico VALUES (15644324,'Josefina', 'Garcia', 'DNI', '1972-10-20', 'josefinagarcia10@gmail.com', '2355-45525', 'Carlos Tejedor BS AS.', 3002);

	/* INSERTAR COBERTURAS */

INSERT INTO cobertura VALUES (1,'Prepaga');
INSERT INTO cobertura VALUES (2,'Obra Social');
INSERT INTO cobertura VALUES (3,'Particular');

	/* INSERTAR PLANES */

INSERT INTO plan VALUES (1, 'Plan 310', 1);
INSERT INTO plan VALUES (2, 'Plan 410', 1);
INSERT INTO plan VALUES (3, 'Plan 510', 1);
INSERT INTO plan VALUES (4, 'Plan Adulto', 1);
INSERT INTO plan VALUES (5, 'Afiliado', 2);
INSERT INTO plan VALUES (6, 'Familiar Afiliado', 2);
INSERT INTO plan VALUES (7, 'Familiar Delegado', 2);
INSERT INTO plan VALUES (8, 'Sin plan', 3);

	/* AGREGAR TURNOS */ 

INSERT INTO turno VALUES (1, '2018-12-20', '10:00:00', 'Consulta general', 30786654, 2);
INSERT INTO turno VALUES (2, '2019-01-05', '15:30:00', 'Cirugia Maxilar', 29887765, 4);
INSERT INTO turno VALUES (3, '2018-11-05', '11:30:00', 'Extraccion pieza 25', 30786654, 2);
INSERT INTO turno VALUES (4, '2019-10-01', '16:00:00', 'Cementar corona', 31998654, 6);
INSERT INTO turno VALUES (5, '2017-12-15', '09:30:00', 'Colocacion ortodoncia', 22745634, 3);
INSERT INTO turno VALUES (6, '2018-10-25', '10:45:00', 'Extraccion', 28785694, 6);
INSERT INTO turno VALUES (7, '2017-12-15', '11:00:00', 'Protesis', 34222111, 5);
INSERT INTO turno VALUES (8, '2018-11-25', '09:30:00', 'Arreglo pieza 24', 28793654, 4);
INSERT INTO turno VALUES (9, '2019-07-16', '19:00:00', 'Arreglo pieza 12', 10287889, 4);
INSERT INTO turno VALUES (10, '2018-11-19', '15:30:00', 'Consulta general', 28785694, 6);
INSERT INTO turno VALUES (11, '2019-02-17', '09:30:00', 'Limpieza general', 22745634, 3);
INSERT INTO turno VALUES (12, '2019-02-17', '10:30:00', 'Cementado corona', 31998654, 6);
INSERT INTO turno VALUES (13, '2019-03-11', '17:45:00', 'Ortodoncia', 30786654, 8);
INSERT INTO turno VALUES (14, '2018-10-21', '13:00:00', 'Consulta Ortodoncia', 34222111, 5);
INSERT INTO turno VALUES (15, '2019-05-22', '10:00:00', 'Consulta', 22745634, 3);
INSERT INTO turno VALUES (16, '2018-05-22', '10:00:00', 'Consulta', 22745634, 3);
INSERT INTO turno VALUES (17, '2016-04-21', '16:00:00', 'Consulta Extraccion', 31998654, 6);
INSERT INTO turno VALUES (18, '2017-07-25', '15:45:00', 'Consulta', 34752654, 3);
INSERT INTO turno VALUES (19, '2015-10-20', '13:30:00', 'Extraccion', 29887765, 4);
INSERT INTO turno VALUES (20, '2017-08-25', '15:45:00', 'Colocacion Perno', 29887765, 4);
INSERT INTO turno VALUES (21, '2018-04-30', '15:45:00', 'Consulta Protesis', 28785694, 6);
INSERT INTO turno VALUES (22, '2019-07-20', '15:45:00', 'Consulta', 34222111, 5);
INSERT INTO turno VALUES (23, '2015-08-18', '15:45:00', 'Consulta ortodoncia', 22745634, 3);
INSERT INTO turno VALUES (24, '2014-11-28', '15:45:00', 'Consulta ortodoncia', 22745634, 3);
INSERT INTO turno VALUES (25, '2017-12-27', '09:30:00', 'Limpieza general', 22745634, 3);
INSERT INTO turno VALUES (26, '2018-07-20', '09:30:00', 'Arreglo pieza 24', 28793654, 4);
INSERT INTO turno VALUES (27, '2019-11-15', '16:45:00', 'Cementar corona 24', 31998654, 6);
INSERT INTO turno VALUES (28, '2013-12-17', '09:30:00', 'Limpieza general', 22745634, 3);
INSERT INTO turno VALUES (29, '2018-10-25', '10:00:00', 'Extraccion pieza 5', 28785694, 6);
INSERT INTO turno VALUES (30, '2017-11-15', '11:30:00', 'Consulta Protesis', 34222111, 5);
INSERT INTO turno VALUES (31, '2018-10-20', '09:30:00', 'Arreglo pieza 20 y 22', 28793654, 4);
INSERT INTO turno VALUES (32, '2016-05-21', '13:30:00', 'Extraccion pieza 13', 29887765, 4);
INSERT INTO turno VALUES (33, '2016-08-22', '12:45:00', 'Colocacion Perno pieza 20', 29887765, 4);

	/* AGREGAR PRESTACIONES */

INSERT INTO prestacion VALUES (1, 'Extraccion');
INSERT INTO prestacion VALUES (3, 'Limpieza');
INSERT INTO prestacion VALUES (4, 'Arreglo');
INSERT INTO prestacion VALUES (5, 'Perno');
INSERT INTO prestacion VALUES (6, 'Corona');
INSERT INTO prestacion VALUES (7, 'Implante');
INSERT INTO prestacion VALUES (8, 'Protesis');
INSERT INTO prestacion VALUES (9, 'Ortodoncia');
INSERT INTO prestacion VALUES (10, 'Consulta general');
INSERT INTO prestacion VALUES (11, 'Cirugia');
INSERT INTO prestacion VALUES (12, 'Blanqueamiento');

	/* AGREGAR TURNOS Y PRESTACIONES */

INSERT INTO turno_prestacion VALUES (1,10);
INSERT INTO turno_prestacion VALUES (2,11);
INSERT INTO turno_prestacion VALUES (3,1);
INSERT INTO turno_prestacion VALUES (4,8);
INSERT INTO turno_prestacion VALUES (5,9);
INSERT INTO turno_prestacion VALUES (8,4);
INSERT INTO turno_prestacion VALUES (9,9);
INSERT INTO turno_prestacion VALUES (10,10);
