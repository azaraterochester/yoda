SELECT vista_alumnos_activos.Nivel, 
	vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2
FROM vista_alumnos_activos
where tiene_costo_inscrito(vista_alumnos_activos.Id_Persona,4,'0021') = 1