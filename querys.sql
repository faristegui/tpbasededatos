#Traer los últimos 10 turnos realizados por un medico con su paciente y la obra social que atendió.

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
