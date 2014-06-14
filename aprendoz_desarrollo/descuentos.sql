SELECT distinct
	tabla_descuentos.codigo, 
	tabla_descuentos.concepto, 
	tabla_descuentos.nnombre, 
	tabla_descuentos.nconcepto, 
	tabla_descuentos.valor, 
	tabla_descuentos.pordcto, 
	tabla_descuentos.valdcto,
	insc_alum_costo.costo_Id_costo,
	insc_alum_costo.descuento_porcentaje, 
	insc_alum_costo.descuento_valor, 
	insc_alum_costo.valor_final_descuento
FROM PERSONA INNER JOIN insc_alum_costo ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN tabla_descuentos ON tabla_descuentos.codigo = PERSONA.Codigo
WHERE
	(select max(costos.codigo) from costos where costos.id_costo = insc_alum_costo.costo_id_costo) = tabla_descuentos.concepto
