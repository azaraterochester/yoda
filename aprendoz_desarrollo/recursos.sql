SELECT Grado.Grado, 
	Subarea.Subarea, 
	Area.Area, 
	asignatura.Asignatura, 
	Unidad.Unidad, 
	Unidad.Fecha_Inicio, 
	Unidad.Fecha_Fin, 
	Subtopico.Subtopico, 
	Subtopico.Fecha_inicio, 
	Subtopico.Fecha_Fin, 
	Recurso.Recurso, 
	Recurso.Documento, 
	Recurso.Ubicacion
FROM Grado INNER JOIN asignatura ON Grado.Id_Grado = asignatura.Grado_Id_Grado
	 INNER JOIN Unidad ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Subarea ON Subarea.Id_Subarea = asignatura.Id_Subarea1
	 INNER JOIN Area ON Area.Id_Area = asignatura.Id_Area1
	 INNER JOIN Subtopico ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN Recurso ON Recurso.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
WHERE asignatura.SY_Id_SY = 3
and asignatura.Asignatura like "%DESARROLLO%"