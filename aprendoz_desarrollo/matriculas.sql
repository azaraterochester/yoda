SELECT PERSONA.Id_Persona, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Codigo, 
	Insc_Alum_Curso.Curso_Id_Curso, 
	Grado.Grado, 
	Curso.Curso, 
	sum(insc_alum_costo.valor_final_descuento)
FROM Insc_Alum_Curso INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN insc_alum_costo ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
	 INNER JOIN Grado ON Curso.Grado_Id_Grado = Grado.Id_Grado
WHERE 
Insc_Alum_Curso.SY_Id_SY = 4 and Insc_Alum_Curso.Curso_Id_Curso > 10100 and Insc_Alum_Curso.Curso_Id_Curso < 40403 and costos.anual = 1 and insc_alum_costo.SY_Id_SY = 4
GROUP BY Insc_Alum_Curso.Persona_Id_Persona
ORDER BY Insc_Alum_Curso.Persona_Id_Persona