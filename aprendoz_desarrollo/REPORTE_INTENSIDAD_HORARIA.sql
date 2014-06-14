SELECT vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	Area.Area, 
	a2.Area, 
	a3.Area, 
	sum(asignatura.ih_a1), 
	sum(asignatura.ih_a2), 
	sum(asignatura.ih_a3),
	sum(asignatura.ih_a1)+sum(asignatura.ih_a2)+sum(asignatura.ih_a3) AS intensidadhorariatotal
FROM Insc_Alum_Asig INNER JOIN asignatura ON Insc_Alum_Asig.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN vista_alumnos_activos ON vista_alumnos_activos.Id_Persona = Insc_Alum_Asig.Persona_Id_Persona
	 INNER JOIN SY ON asignatura.SY_Id_SY = SY.Id_SY
	 INNER JOIN Area ON asignatura.Id_Area1 = Area.Id_Area
	 LEFT OUTER JOIN Area a2 ON asignatura.Id_Area2 = a2.Id_Area
	 LEFT OUTER JOIN Area a3 ON asignatura.Id_Area3 = a3.Id_Area
WHERE asignatura.SY_Id_SY = 3
GROUP BY vista_alumnos_activos.Id_Persona
ORDER BY vista_alumnos_activos.Grado ASC, vista_alumnos_activos.Curso ASC, vista_alumnos_activos.Id_Persona ASC