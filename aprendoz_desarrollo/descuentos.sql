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
FROM tabla_descuentos INNER JOIN PERSONA on tabla_descuentos.codigo = PERSONA.Codigo inner join insc_alum_costo ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
WHERE
	(select max(costos.codigo) from costos where costos.id_costo = insc_alum_costo.costo_id_costo) = tabla_descuentos.concepto
and tabla_descuentos.pordcto <> insc_alum_costo.descuento_porcentaje
and insc_alum_costo.SY_Id_SY = 5
