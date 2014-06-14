SELECT Grado.Grado, 
	asignatura.Asignatura, 
	Area.Area, 
	Subarea.Subarea, 
	Unidad.Unidad, 
	Unidad.Fecha_Inicio, 
	Unidad.Fecha_Fin, 
	Subtopico.Subtopico, 
	Subtopico.Fecha_inicio, 
	Subtopico.Fecha_Fin, 
	Aprendizaje.Aprendizaje, 
	Aprendizaje.Fecha_Esperada, 
	Aprendizaje.Peso, 
	Nivel_Esperado.Nivel_Esperado, 
	Dimension_Curricular.Dimension_Curricular, 
	Eje.Eje_Tematico, 
	Dimension_Comprension.Dimension_Comprension, 
	Inteligencia.Inteligencia
FROM asignatura INNER JOIN Subarea ON Subarea.Id_Subarea = asignatura.Id_Subarea1
	 INNER JOIN Area ON Area.Id_Area = asignatura.Id_Area1
	 INNER JOIN Grado ON asignatura.Grado_Id_Grado = Grado.Id_Grado
	 INNER JOIN Unidad ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Subtopico ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN Aprendizaje ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Dimension_Comprension ON Aprendizaje.Dimension_Comprension_Id_Dimension = Dimension_Comprension.Id_Dimension
	 INNER JOIN Inteligencia ON Aprendizaje.Inteligencia_Id_Inteligencia = Inteligencia.Id_Inteligencia
	 INNER JOIN Eje ON Aprendizaje.Eje_Id_Eje = Eje.Id_Eje
	 INNER JOIN Dimension_Curricular ON Dimension_Curricular.Id_Dimension = Aprendizaje.Dimension_Curricular_Id_Dimension
	 INNER JOIN Nivel_Esperado ON Aprendizaje.Nivel_Esperado_Id_Nivel_Esperado = Nivel_Esperado.Id_Nivel_Esperado
WHERE asignatura.SY_Id_SY = 3
and asignatura.Asignatura like "%COLOMBIA%"