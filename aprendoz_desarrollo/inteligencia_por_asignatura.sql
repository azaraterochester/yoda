SELECT count(*), 
	asignatura.Id_Asignatura, 
	asignatura.Asignatura, 
	Inteligencia.Inteligencia
FROM Unidad INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Subtopico ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN Aprendizaje ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN Inteligencia ON Inteligencia.Id_Inteligencia = Aprendizaje.Inteligencia_Id_Inteligencia
WHERE Asignatura.Asignatura like '%DESARROLLO%' and Asignatura.SY_Id_SY = 3
GROUP BY Asignatura.Asignatura, Inteligencia.Id_Inteligencia
ORDER BY asignatura.Id_Asignatura ASC,  Inteligencia.Id_Inteligencia ASC