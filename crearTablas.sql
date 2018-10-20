DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS medico;
DROP TABLE IF EXISTS turno;
DROP TABLE IF EXISTS plan;
DROP TABLE IF EXISTS cobertura;
DROP TABLE IF EXISTS prestacion;
DROP TABLE IF EXISTS turno_prestacion;
DROP TABLE IF EXISTS atencion_turno;

create table paciente(nroDoc INT, nombre VARCHAR(50), apellido VARCHAR(50), tipoDoc VARCHAR(10),
fechaNac DATE, email VARCHAR(50), telefono VARCHAR(20), lugarNac VARCHAR(50));

create table medico(nroDoc INT, nombre VARCHAR(50), apellido VARCHAR(50), tipoDoc VARCHAR(10),
fechaNac DATE, email VARCHAR(50), telefono VARCHAR(20), lugarNac VARCHAR(50), matricula INT);

create table turno(idTurno INTEGER, fecha DATE, hora TIME, descripcion VARCHAR(50), nroDoc INT, idPlan INT);

create table plan(idPlan INT, nombre VARCHAR(50), idCobertura INT);

create table cobertura(idCobertura INT, nombre VARCHAR(50), tipoCobertura VARCHAR(50));

create table prestacion(idPrestacion INT, nombre VARCHAR(50));

create table turno_prestacion(idTurno INT, idPrestacion INT);

create table atencion_turno(nroDoc INT, idTurno INT);

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




