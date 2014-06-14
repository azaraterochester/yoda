SELECT importacion_cartera.valor,
	importacion_cartera.concepto, 
	importacion_cartera.mensualidad, 
	importacion_cartera.codigo, 
	importacion_cartera.alumno,
	cartera_codigo_mes(importacion_cartera.codigo,importacion_cartera.mensualidad) as saldo_mes
FROM importacion_cartera
WHERE importacion_cartera.codigo = 09129
