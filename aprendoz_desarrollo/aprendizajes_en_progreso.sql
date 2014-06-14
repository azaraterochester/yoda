SELECT 
	count(calificacion_final.Persona_Id_Persona) / 
	(
		SELECT COUNT(*) FROM Insc_Alum_Asig ias inner join asignatura a 
		on ias.Asignatura_Id_Asignatura = a.Id_Asignatura 
		where ias.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
		and a.SY_Id_SY = sy_actual()
	)
/*	asignatura.Asignatura, 
	
	Aprendizaje.Aprendizaje, 
	Aprendizaje.Fecha_Esperada, 
	calificacion_final.calificacion, 
	calificacion_final.calificacion_num
*/
FROM Aprendizaje INNER JOIN Subtopico ON Aprendizaje.Subtopico_Id_Subtopico = Subtopico.Id_Subtopico
	 INNER JOIN calificacion_final ON calificacion_final.Aprendizaje_Id_Aprendizaje = Aprendizaje.Id_Aprendizaje
	 INNER JOIN Unidad ON Subtopico.Unidad_Id_Unidad = Unidad.Id_Unidad
	 INNER JOIN asignatura ON Unidad.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
WHERE 
/*and calificacion_final.Persona_Id_Persona = 1066202*/
 Aprendizaje.Id_Aprendizaje = 16573
ORDER BY calificacion_final.Persona_Id_Persona