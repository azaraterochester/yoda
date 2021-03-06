SELECT PERSONA.Codigo, 
	calcula_valor_mensualidades_numeros_estudiante(PERSONA.Id_Persona,3), 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Telefono, 
	Curso.Curso, 
	importacion_cartera.mensualidad, 
	importacion_cartera.concepto, 
	importacion_cartera.valor, 
	importacion_cartera.numero_mes
FROM Nivel INNER JOIN Grado ON Nivel.Id_Nivel = Grado.Nivel_Id_Nivel
	 INNER JOIN Curso ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN importacion_cartera ON importacion_cartera.codigo = PERSONA.Codigo
WHERE Curso.Id_Curso >= 10101 AND
Curso.Id_Curso <= 40403 AND
Insc_Alum_Curso.SY_Id_SY = 3
AND PERSONA.Activo_Retirado = 1
AND PERSONA.matriculado = 1
ORDER BY PERSONA.Codigo ASC