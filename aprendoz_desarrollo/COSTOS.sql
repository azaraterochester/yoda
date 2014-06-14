SELECT costos.valor, 
	insc_alum_costo.descuento_porcentaje, 
	insc_alum_costo.descuento_valor, 
	insc_alum_costo.valor_final_descuento
FROM costos INNER JOIN insc_alum_costo ON costos.id_costo = insc_alum_costo.costo_Id_costo
	WHERE insc_alum_costo.SY_Id_SY = 4
    and costos.nombre_producto like '%MATR%'
	and insc_alum_costo.Persona_Id_Persona = 195