SELECT 
	month(vista_alumnos_activos.Fecha_Nacimiento) as mes, 
	DAY(vista_alumnos_activos.Fecha_Nacimiento) as dia,
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	Curso.Curso
FROM Insc_Alum_Curso INNER JOIN vista_alumnos_activos ON Insc_Alum_Curso.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
where 
	Insc_Alum_Curso.Curso_Id_Curso BETWEEN 10101 and 40403
	AND Insc_Alum_Curso.SY_Id_SY = 4
order by 
	month(vista_alumnos_activos.Fecha_Nacimiento), DAY(vista_alumnos_activos.Fecha_Nacimiento) 