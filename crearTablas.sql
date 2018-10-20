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