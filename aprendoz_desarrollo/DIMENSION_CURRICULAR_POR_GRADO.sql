SELECT DISTINCT
	Grado.Grado, 
	Dimension_Curricular.Dimension_Curricular,
	COUNT(Dimension_Curricular.Dimension_Curricular)/a_aprendizajes_total_grado(Grado.Id_Grado,3) as porcentajeporgrado,
	COUNT(Dimension_Curricular.Dimension_Curricular)/a_aprendizajes_total(3) as porcentajetotal
FROM asignatura INNER JOIN Grado ON asignatura.Grado_Id_Grado = Grado.Id_Grado
	 INNER JOIN Unidad ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Subtopico ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN Aprendizaje ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Dimension_Curricular ON Dimension_Curricular.Id_Dimension = Aprendizaje.Dimension_Curricular_Id_Dimension
WHERE Grado.Id_Grado >= 101 and Grado.Id_Grado <= 404 and asignatura.SY_Id_SY = 3
group by Grado.Id_Grado, Dimension_Curricular.Id_Dimension
ORDER BY Grado.Id_Grado ASC, Dimension_Curricular.Id_Dimension ASC
