SELECT
	SY.School_year,
	Grado.Grado, 
	Curso.Curso, 
	Nivel.Nivel,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	asignatura.Asignatura,  
	esperados_fecha(asignatura.Id_Asignatura,'2014-05-06'), 
	calificados(Insc_Curso_Asig.Asignatura_Id_Asignatura,Insc_Curso_Asig.Curso_Id_Curso), 
	calificados(Insc_Curso_Asig.Asignatura_Id_Asignatura,Insc_Curso_Asig.Curso_Id_Curso)*100/esperados(asignatura.Id_Asignatura) AS porcentaje
FROM PERSONA INNER JOIN Insc_Curso_Asig ON PERSONA.Id_Persona = Insc_Curso_Asig.Persona_Id_Persona
	 INNER JOIN asignatura ON asignatura.Id_Asignatura = Insc_Curso_Asig.Asignatura_Id_Asignatura
	 INNER JOIN SY ON SY.Id_SY = asignatura.SY_Id_SY
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Curso_Asig.Curso_Id_Curso
	 INNER JOIN Grado ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Nivel ON Nivel.Id_Nivel = Grado.Nivel_Id_Nivel
WHERE 
asignatura.SY_Id_SY = 4 
and (PERSONA.Tipo_Persona_Id_Tipo_Persona = 4 or PERSONA.Tipo_Persona_Id_Tipo_Persona = 8) 
and persona.Activo_Retirado = 1
ORDER BY 
Nivel.Id_Nivel, 
Grado.Id_Grado, 
PERSONA.Apellido1, 
Curso.Id_Curso, 
Insc_Curso_Asig.Persona_Id_Persona ASC, 
asignatura.Grado_Id_Grado ASC, 
Insc_Curso_Asig.Curso_Id_Curso ASC