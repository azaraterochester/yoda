SELECT DISTINCT PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Fecha_Nacimiento, 
	Curso.Curso, 
	costos.nombre_producto, 
	insc_alum_costo.valor_final_descuento,
	matricula.fecha_matricula
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN matricula ON matricula.Persona_Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
WHERE Insc_Alum_Curso.Curso_Id_Curso BETWEEN 10101 and 40403
AND Insc_Alum_Curso.SY_Id_SY = 4
and insc_alum_costo.SY_Id_SY = 4
and costos.codigo = '0011'
and matricula.SY_Id_SY = 4
and PERSONA.Activo_Retirado = 1
AND insc_alum_costo.valor_final_descuento <> 0
and insc_alum_costo.inscrito = 1
GROUP BY PERSONA.Codigo
ORDER BY matricula.fecha_matricula