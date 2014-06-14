SELECT importacion_cartera.valor as valor,
	importacion_cartera.concepto as concepto,
	importacion_cartera.mensualidad as mensualidad,
	importacion_cartera.codigo as codigo,
	importacion_cartera.alumno as alumno,
	importacion_cartera.numero_mes as mes,
	cartera_codigo_mes(importacion_cartera.codigo,importacion_cartera.mensualidad) AS saldo_mes,
	calcula_valor_recargo_mensualidades(importacion_cartera.numero_mes) AS factor_recargo,
	(cartera_codigo_mes(importacion_cartera.codigo,importacion_cartera.mensualidad) * ( 1 + calcula_valor_recargo_mensualidades(importacion_cartera.numero_mes))) / numerodeconceptosmensuales(importacion_cartera.codigo,importacion_cartera.numero_mes) AS totaldeuda,
	PERSONA.Direccion_Residencia,
	PERSONA.Telefono,
	PERSONA.Telefono2,
	PERSONA.Municipio,
	PERSONA.Barrio,
	PERSONA.Departamento,
	ultimo_mes_facturado(),
	a_getMonth() as get_mes,
	proximafechadepago() as fecha_pago
	FROM PERSONA LEFT JOIN importacion_cartera ON PERSONA.Codigo = importacion_cartera.codigo
WHERE importacion_cartera.codigo = '11162'
ORDER BY importacion_cartera.numero_mes, PERSONA.Apellido1, PERSONA.Apellido2, PERSONA.Nombre1, PERSONA.Nombre2 ASC