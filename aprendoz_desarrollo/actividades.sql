SELECT Grado.Grado, 
	asignatura.Asignatura, 
	Unidad.Unidad, 
	Unidad.Fecha_Inicio, 
	Unidad.Fecha_Fin, 
	Subtopico.Subtopico, 
	Subtopico.Fecha_inicio, 
	Subtopico.Fecha_Fin, 
	Actividad.Actividad, 
	Actividad.Fecha
FROM Actividad INNER JOIN Subtopico ON Actividad.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Unidad ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Grado ON Grado.Id_Grado = asignatura.Grado_Id_Grado
WHERE asignatura.SY_Id_SY = 3
and asignatura.Asignatura like "%DESARROLLO%"