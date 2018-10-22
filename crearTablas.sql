DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS medico;
DROP TABLE IF EXISTS turno;
DROP TABLE IF EXISTS plan;
DROP TABLE IF EXISTS cobertura;
DROP TABLE IF EXISTS prestacion;
DROP TABLE IF EXISTS turno_prestacion;
DROP TABLE IF EXISTS atencion_turno;
DROP TABLE IF EXISTS realiza_prestacion;
DROP TABLE IF EXISTS plan_prestacion;
DROP TABLE IF EXISTS paciente_plan;
DROP TABLE IF EXISTS fichado_paciente;

create table paciente(nroDoc INT NOT NULL, nombre VARCHAR(50), apellido VARCHAR(50), tipoDoc VARCHAR(10),
fechaNac DATE, email VARCHAR(50), telefono VARCHAR(20), lugarNac VARCHAR(50),
CONSTRAINT PK_paciente PRIMARY KEY (nroDoc));

create table medico(nroDoc INT NOT NULL, nombre VARCHAR(50), apellido VARCHAR(50), tipoDoc VARCHAR(10),
fechaNac DATE, email VARCHAR(50), telefono VARCHAR(20), lugarNac VARCHAR(50), matricula INT,
CONSTRAINT PK_medico PRIMARY KEY (nroDoc));

create table turno(idTurno INT NOT NULL, fecha DATE, hora TIME, descripcion VARCHAR(50), nroDoc INT, idPlan INT,
CONSTRAINT PK_turno PRIMARY KEY (idTurno));

create table plan(idPlan INT NOT NULL, nombre VARCHAR(50), idCobertura INT,
CONSTRAINT PK_plan PRIMARY KEY (idPlan));

create table cobertura(idCobertura INT NOT NULL, nombre VARCHAR(50), tipoCobertura VARCHAR(50),
CONSTRAINT PK_cobertura PRIMARY KEY (idCobertura));

create table prestacion(idPrestacion INT NOT NULL, nombre VARCHAR(50),
CONSTRAINT PK_prestacion PRIMARY KEY (idPrestacion));

create table turno_prestacion(idTurno INT NOT NULL, idPrestacion INT,
CONSTRAINT PK_turnoPrestacion PRIMARY KEY (idTurno,idPrestacion));

create table atencion_turno(nroDoc INT, idTurno INT,
CONSTRAINT PK_atencionTurno PRIMARY KEY (nroDoc));

create table realiza_prestacion(nroDoc INT, idPrestacion INT, observaciones VARCHAR(100),
CONSTRAINT PK_realizaPrestacion PRIMARY KEY (nroDoc, idPrestacion));

create table plan_prestacion(idPlan INT, idPrestacion INT,
CONSTRAINT PK_planPrestacion PRIMARY KEY (idPlan, idPrestacion));

create table paciente_plan(nroDoc INT, idPlan INT,
CONSTRAINT PK_pacientePlan PRIMARY KEY (nroDoc, idPlan));

create table fichado_paciente(nroDoc INT, nroDocMedico INT,
CONSTRAINT PK_ficha PRIMARY KEY (nroDoc, nroDocMedico));



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
