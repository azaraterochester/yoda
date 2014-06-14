SELECT Grado.Grado, 
	Curso.Curso AS Curso_Curso, 
	PERSONA.Apellido1 AS PERSONA_Apellido1, 
	PERSONA.Apellido2 AS PERSONA_Apellido2, 
	PERSONA.Nombre1 AS PERSONA_Nombre1, 
	PERSONA.Nombre2 AS PERSONA_Nombre2, 
	PERSONA.Id_Persona AS PERSONA_Id_Persona, 
	PERSONA.Codigo AS PERSONA_Codigo, 
	insc_alum_costo.valor_final_descuento AS insc_alum_costo_valor_final_descuento, 
	insc_alum_costo.descuento_valor AS insc_alum_costo_descuento_valor, 
	insc_alum_costo.descuento_porcentaje AS insc_alum_costo_descuento_porcentaje, 
	matricula.fecha_matricula AS matricula_fecha_matricula, 
	SY.School_year AS SY, 
	PERSONA.Activo_Retirado AS PERSONA_Activo_Retirado, 
	SY.Id_SY AS SY_Id_SY, 
	costos.nombre_producto
FROM PERSONA PERSONA INNER JOIN insc_alum_costo insc_alum_costo ON PERSONA.Id_Persona = insc_alum_costo.Persona_Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN matricula matricula ON PERSONA.Id_Persona = matricula.Persona_Id_Persona
	 INNER JOIN SY SY ON insc_alum_costo.SY_Id_SY = SY.Id_SY
	 INNER JOIN Insc_Alum_Curso ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Curso Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN Grado ON Grado.Id_Grado = Curso.Grado_Id_Grado
WHERE 
	costos.anual = 0 and
	insc_alum_costo.inscrito = 1 and
    PERSONA.matriculado = 1
    and PERSONA.`Activo_Retirado` = 1
    and SY.`Id_SY`= 4
	and Insc_Alum_Curso.SY_Id_SY = 4
	and Insc_Alum_Curso.Curso_Id_Curso BETWEEN 10101 and 40403
	and matricula.SY_Id_SY = 4