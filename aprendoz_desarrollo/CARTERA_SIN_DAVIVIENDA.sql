SELECT importacion_cartera_copy.id_importacion_cartera, 
	importacion_cartera_copy.codigo, 
	importacion_cartera_copy.mensualidad, 
	importacion_cartera_copy.concepto, 
	importacion_cartera_copy.valor, 
	importacion_cartera_copy.alumno, 
	importacion_cartera_copy.curso, 
	importacion_cartera_copy.numero_mes
FROM importacion_cartera_copy
	where factura_por_davivienda(importacion_cartera_copy.codigo) = 0