SELECT CONCAT("2",numero_SY_factura(importacion_cartera.numero_mes),numero_mes_factura(importacion_cartera.numero_mes),PERSONA.Codigo),
	PERSONA.No_Documento, 
	importacion_cartera.valor, 
	importacion_cartera.concepto,
	"2012/01/10" as "Fecha_Limite"
FROM importacion_cartera INNER JOIN PERSONA ON importacion_cartera.codigo = PERSONA.Codigo
WHERE PERSONA.Codigo >= 12000
and PERSONA.Codigo <= 13000