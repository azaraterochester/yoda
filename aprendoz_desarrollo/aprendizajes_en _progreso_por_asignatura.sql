SELECT COUNT(*) 
FROM Aprendizaje INNER JOIN Subtopico ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Unidad ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
where asignatura.Id_Asignatura = 310102 and aprendizaje_en_progreso(Aprendizaje.Id_Aprendizaje) = 1