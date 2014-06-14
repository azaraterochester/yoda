SELECT vista_alumnos_activos.Codigo, 
	costos.nombre_producto, 
	costos.valor, 
	insc_alum_costo.descuento_porcentaje, 
	insc_alum_costo.descuento_valor, 
	insc_alum_costo.valor_final_descuento,
	insc_alum_costo.fecha_inicio,
	insc_alum_costo.fecha_fin
FROM insc_alum_costo INNER JOIN vista_alumnos_activos ON insc_alum_costo.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
WHERE 
insc_alum_costo.SY_Id_SY = 4 
and  insc_alum_costo.inscrito = 1 
AND costos.anual = 0 

ORDER BY vista_alumnos_activos.Codigo