SELECT importacion_cartera.codigo, 
	importacion_cartera.mensualidad, 
	importacion_cartera.concepto, 
	importacion_cartera.valor, 
	importacion_cartera.alumno, 
	importacion_cartera.curso, 
	importacion_cartera.numero_mes
FROM davivienda INNER JOIN importacion_cartera ON davivienda.codigo = importacion_cartera.codigo
WHERE davivienda.facturadavivienda = 0