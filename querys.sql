/* 1- Consultar los turnos disponibles de X médico, con una desde-hasta fecha y una prestacion determinada.*/

SELECT CONCAT(m.nombre, ' ' , m.apellido) as medico, am.fecha as dia, CONCAT(am.horaDesde, '-' , am.horaHasta) as hora_turno
FROM medico m, agenda_medico am, realiza_prestacion rp, prestacion p
WHERE m.nombre = 'Matias'
AND m.apellido = 'Almeyda'
AND m.nroDoc = am.nroDoc
AND am.fecha > '2018-02-04'
AND am.fecha < '2018-03-10'
AND rp.idPrestacion = p.idPrestacion
AND p.nombre = 'Protesis';


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

/* 3- Para cada año, devolver el plan que más cantidad de turnos tuvo asignados */

SELECT w.anio, p.nombre
FROM turno_anio AS w JOIN plan p ON p.idplan = w.idplan
GROUP BY w.anio, w.idplan,p.nombre
HAVING COUNT(idturno) >= (
	SELECT max(cantidad) FROM (
		SELECT anio, idplan, COUNT(idturno) AS cantidad FROM turno_anio
		GROUP BY anio, idplan
	) AS t WHERE t.anio = w.anio
)
ORDER BY w.anio;