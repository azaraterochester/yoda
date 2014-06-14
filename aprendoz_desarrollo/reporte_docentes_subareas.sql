SELECT COUNT(eje1.Id_Eje), eje1.Id_Eje, eje1.Eje_Tematico
FROM Grado INNER JOIN asignatura ON Grado.Id_Grado = asignatura.Grado_Id_Grado
	 INNER JOIN Unidad ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Subtopico ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN Aprendizaje ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 LEFT OUTER JOIN Eje eje1 ON Aprendizaje.Eje_Id_Eje = eje1.Id_Eje
	 LEFT OUTER JOIN Subarea Subarea1 ON asignatura.Id_Subarea1 = Subarea1.Id_Subarea
	 LEFT OUTER JOIN Subarea Subarea2 ON asignatura.Id_Subarea2 = Subarea2.Id_Subarea
	 LEFT OUTER JOIN Subarea Subarea3 ON asignatura.Id_Subarea3 = Subarea3.Id_Subarea
	 LEFT OUTER JOIN Eje eje2 ON Aprendizaje.eje2_id_eje = eje2.Id_Eje
	 LEFT OUTER JOIN Eje eje3 ON Aprendizaje.eje3_id_eje = eje3.Id_Eje
WHERE (Subarea1.Id_Subarea = 5 OR Subarea2.Id_Subarea = 5 OR Subarea3.Id_Subarea = 5)
and (eje1.Id_Eje = 35 or eje2.Id_Eje = 35 or eje3.Id_Eje = 35)
and asignatura.SY_Id_SY = 3
/*GROUP BY eje1.Id_Eje*/