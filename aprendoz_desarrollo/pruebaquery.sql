SELECT a_getMonth() AS get_mes, 
	proximafechadepago() AS fecha_pago, 
	a_getMonth() AS MES, 
	PERSONA.Direccion_Residencia, 
	PERSONA.Telefono, 
	PERSONA.Telefono2, 
	PERSONA.Municipio, 
	PERSONA.Barrio, 
	PERSONA.Departamento, 
	PERSONA.Id_Persona AS PERSONA_Id_Persona, 
	ultimo_mes_facturado(),
	saldo_mes_anterior(importacion_cartera.codigo,sy_actual(),ultimo_mes_facturado()) as saldoanterior,
cartera_codigo_numero_mes(importacion_cartera.codigo,importacion_cartera.numero_mes) as saldomesactual
FROM PERSONA INNER JOIN davivienda ON PERSONA.Codigo = davivienda.codigo
	 INNER JOIN importacion_cartera ON importacion_cartera.codigo = davivienda.codigo
WHERE davivienda.facturadavivienda = 0