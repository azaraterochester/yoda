SELECT DISTINCT
 MONTH(CURDATE()) as month,
     YEAR(CURDATE()) as year,
	importacion_cartera.concepto,
	importacion_cartera.mensualidad,
	importacion_cartera.valor,
	importacion_cartera.codigo,
	importacion_cartera.alumno,
	PERSONA.Direccion_Residencia,
	PERSONA.Telefono,
	PERSONA.Telefono2,
	PERSONA.Municipio,
	PERSONA.Barrio,
	PERSONA.Departamento,
	ultimo_mes_facturado() as ultimomes,
	Curso.Curso,
	a_getMonth() as get_mes,
	proximafechadepago() as fecha_pago,
	a_getMonth() AS MES,
     PERSONA.`Id_Persona` AS PERSONA_Id_Persona
FROM PERSONA INNER JOIN importacion_cartera ON PERSONA.Codigo = importacion_cartera.codigo
	 INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
WHERE 
importacion_cartera.codigo = 21009 AND 
Curso.Id_Curso >= 10101 and 
Curso.Id_Curso <= 40403 AND 
Insc_Alum_Curso.SY_Id_SY = sy_actual() and
importacion_cartera.numero_mes = ultimo_mes_facturado()
ORDER BY Curso.Id_Curso, PERSONA.Apellido1, PERSONA.Apellido2, PERSONA.Nombre1, PERSONA.Nombre2 ASC