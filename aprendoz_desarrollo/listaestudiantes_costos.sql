SELECT Nivel.Nivel, 
	Grado.Grado, 
	Curso.Curso, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Codigo, 
	PERSONA.Activo_Retirado, 
	PERSONA.No_Plaqueta, 
	insc_alum_costo.costo_Id_costo, 
	insc_alum_costo.inscrito, 
	insc_alum_costo.valor_final_descuento, 
	costos.nombre_producto, 
	costos.anual
FROM PERSONA INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
	 INNER JOIN Grado ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Nivel ON Nivel.Id_Nivel = Grado.Nivel_Id_Nivel
	 INNER JOIN insc_alum_costo ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
WHERE Insc_Alum_Curso.SY_Id_SY = 3 and
Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403 and
insc_alum_costo.inscrito = 1 and
costos.anual = 0
AND PERSONA.Activo_Retirado = 1 AND PERSONA.matriculado = 1
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC