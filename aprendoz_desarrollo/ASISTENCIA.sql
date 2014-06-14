SELECT DISTINCT sesion.fecha, 
Nivel.Id_Nivel AS Nivel_Id_Nivel, 
	Nivel.Nivel AS Nivel_Nivel, 
	Grado.Grado, 
	Curso.Curso, 
	PERSONA.Id_Persona,
	tipo_asistencia.tipo, 
	SUM(1) AS conteo
FROM sesion sesion INNER JOIN asistencia asistencia ON sesion.id_sesion = asistencia.sesion_id_sesion
	 INNER JOIN asignatura asignatura ON sesion.asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN Grado Grado ON asignatura.Grado_Id_Grado = Grado.Id_Grado
	 INNER JOIN Curso Curso ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Nivel Nivel ON Grado.Nivel_Id_Nivel = Nivel.Id_Nivel
	 INNER JOIN Insc_Alum_Curso Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona AND asistencia.PERSONA_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN tipo_asistencia tipo_asistencia ON asistencia.tipo_asistencia_id_tipo = tipo_asistencia.id_tipo
WHERE tipo_asistencia.id_tipo = 2
     and sesion.fecha >= '2012-09-01'
     and sesion.fecha <= curdate()
     and Insc_Alum_Curso.Curso_Id_Curso >= 10101
     and Insc_Alum_Curso.Curso_Id_Curso <= 40403
     and Insc_Alum_Curso.SY_Id_SY = 3
GROUP BY sesion.fecha, Nivel.Id_Nivel, Grado.Id_Grado, Curso.Id_Curso
ORDER BY sesion.fecha ASC, Nivel.Id_Nivel, Grado.Id_Grado, Curso.Id_Curso, PERSONA.Id_Persona