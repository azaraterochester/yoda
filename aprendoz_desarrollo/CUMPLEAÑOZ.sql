SELECT vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	month(vista_alumnos_activos.Fecha_Nacimiento) as mes,
	day(vista_alumnos_activos.Fecha_Nacimiento) as dia
FROM vista_alumnos_activos
where tiene_costo_inscrito(vista_alumnos_activos.Id_Persona,4,'0021') = 1
order by month(vista_alumnos_activos.Fecha_Nacimiento), day(vista_alumnos_activos.Fecha_Nacimiento)
