SELECT count(*), 
	asignatura.Id_Asignatura, 
	asignatura.Asignatura,
	Dimension_Curricular.Dimension_Curricular
FROM Unidad INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Subtopico ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN Aprendizaje ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Dimension_Curricular ON Dimension_Curricular.Id_Dimension = Aprendizaje.Dimension_Curricular_Id_Dimension
WHERE Asignatura.Asignatura like '%DESARROLLO%' and Asignatura.SY_Id_SY = 3
GROUP BY Asignatura.Asignatura, Dimension_Curricular.Id_Dimension
ORDER BY asignatura.Id_Asignatura ASC, Dimension_Curricular.Id_Dimension ASC