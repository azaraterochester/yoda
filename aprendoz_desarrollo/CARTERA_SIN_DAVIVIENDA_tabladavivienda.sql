SELECT importacion_cartera_copy.*
FROM davivienda INNER JOIN importacion_cartera_copy ON davivienda.codigo = importacion_cartera_copy.codigo
WHERE davivienda.facturadavivienda = 0