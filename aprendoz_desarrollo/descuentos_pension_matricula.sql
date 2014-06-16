SELECT PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	insc_alum_costo.descuento_porcentaje, 
	insc_alum_costo.descuento_valor, 
	insc_alum_costo.valor_final_descuento, 
	costos.nombre_producto
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
WHERE insc_alum_costo.SY_Id_SY = 5 and (costos.codigo = '0019' or costos.codigo like '%0001%') and insc_alum_costo.descuento_porcentaje > 0
ORDER BY PERSONA.Codigo