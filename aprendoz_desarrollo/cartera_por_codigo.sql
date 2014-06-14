SELECT importacion_cartera.mensualidad,
	importacion_cartera.codigo,
	importacion_cartera.concepto, 
	SUM(importacion_cartera.valor)
FROM importacion_cartera
GROUP BY importacion_cartera.mensualidad, importacion_cartera.codigo
ORDER BY importacion_cartera.mensualidad
