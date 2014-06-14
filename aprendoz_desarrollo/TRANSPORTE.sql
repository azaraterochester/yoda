SELECT vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2,
	tiene_costo_inscrito_NOMBRE(vista_alumnos_activos.Id_Persona,4,'TRANSPORTE COMPLETO') as transportecompleto,
	tiene_costo_inscrito_NOMBRE(vista_alumnos_activos.Id_Persona,4,'TRANSPORTE MEDIO') as transportecompleto
FROM vista_alumnos_activos