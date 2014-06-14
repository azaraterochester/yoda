SELECT (SELECT importacion_cartera.valor from importacion_cartera where importacion_cartera.codigo = '11162' ) as valor, 
	(SELECT importacion_cartera.concepto from importacion_cartera where importacion_cartera.codigo = '11162' ) as concepto, 
	(SELECT importacion_cartera.mensualidad from importacion_cartera where importacion_cartera.codigo = '11162' ) as mensualidad, 
	(SELECT importacion_cartera.codigo from importacion_cartera where importacion_cartera.codigo = '11162' ) as codigo, 
	(SELECT importacion_cartera.alumno from importacion_cartera where importacion_cartera.codigo = '11162' ) as alumno, 
	(SELECT importacion_cartera.numero_mes from importacion_cartera where importacion_cartera.codigo = '11162' ) as numero_mes, 
	cartera_codigo_mes('11162',(SELECT importacion_cartera.mensualidad from importacion_cartera where importacion_cartera.codigo = '11162' )) AS saldo_mes,
	calcula_valor_recargo_mensualidades((SELECT importacion_cartera.numero_mes from importacion_cartera where importacion_cartera.codigo = '11162' )) AS factor_recargo,
	(cartera_codigo_mes('11162',(SELECT importacion_cartera.mensualidad from importacion_cartera where importacion_cartera.codigo = '11162' )) * ( 1 + calcula_valor_recargo_mensualidades((SELECT importacion_cartera.numero_mes from importacion_cartera where importacion_cartera.codigo = '11162' )))) / numerodeconceptosmensuales('11162',(SELECT importacion_cartera.numero_mes from importacion_cartera where importacion_cartera.codigo = '11162' )) AS totaldeuda,
	PERSONA.Direccion_Residencia,
	PERSONA.Telefono,
	PERSONA.Telefono2,
	PERSONA.Municipio,
	PERSONA.Barrio,
	PERSONA.Departamento,
	ultimo_mes_facturado(),
	Curso.Curso,
	a_getMonth() as get_mes,
	proximafechadepago() as fecha_pago
FROM PERSONA INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
WHERE PERSONA.codigo = '11162' AND Curso.Id_Curso >= 10101 and Curso.Id_Curso <= 40403 AND Insc_Alum_Curso.SY_Id_SY = sy_actual()
ORDER BY Curso.Id_Curso, PERSONA.Apellido1, PERSONA.Apellido2, PERSONA.Nombre1, PERSONA.Nombre2 ASC