SELECT DISTINCT
	importacion_cartera.codigo,
	importacion_cartera.alumno,
	importacion_cartera.mensualidad,
	(cartera_codigo_mes(importacion_cartera.codigo,importacion_cartera.mensualidad) * ( 1 + calcula_valor_recargo_mensualidades(importacion_cartera.numero_mes)))  AS totaldeuda,
	Curso.Curso
FROM PERSONA INNER JOIN importacion_cartera ON PERSONA.Codigo = importacion_cartera.codigo
	 INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
WHERE Curso.Id_Curso >= 10101 and Curso.Id_Curso <= 40403 AND Insc_Alum_Curso.SY_Id_SY = 3 
/*and PERSONA.Activo_Retirado = 1 */
and importacion_cartera.valor >= 10
ORDER BY PERSONA.Codigo, PERSONA.Apellido1, PERSONA.Apellido2, PERSONA.Nombre1, PERSONA.Nombre2 ASC