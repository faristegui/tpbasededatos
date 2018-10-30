/* 1- Consultar los turnos disponibles de X médico con Y obra social (del cliente) y con una desde-hasta fecha.*/

SELECT CONCAT(m.nombre, ' ' , m.apellido) as medico, am
FROM medico m, agenda_medico am
WHERE m.nombre = 'Matias'
AND m.apellido = 'Almeyda';




/* 2- Traer los últimos 10 turnos realizados por un medico con su paciente y la obra social que atendió. */

SELECT CONCAT(m.nombre, ' ' , m.apellido) as medico, 
	CONCAT(p.nombre, ' ' , p.apellido) as paciente , pl.nombre as plan
FROM medico m, atencion_turno atur, turno t, paciente p, plan pl
WHERE m.nroDoc = atur.nroDoc
AND (SELECT m.nroDoc
	FROM medico m
	WHERE m.nombre = 'Veronica'
	AND m.apellido = 'Duran') = m.nroDoc
AND atur.idTurno = t.idTurno
AND t.nroDoc = p.nroDoc
AND t.idPlan = pl.idPlan
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;
