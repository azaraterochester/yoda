SELECT 
	PERSONA.Id_Persona,
	PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	costos.nombre_producto, 
	insc_alum_costo.valor_final_descuento
FROM costos INNER JOIN insc_alum_costo ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = insc_alum_costo.Persona_Id_Persona
WHERE insc_alum_costo.SY_Id_SY = 5
and costos.nombre_producto like '%MAT%'