SELECT DISTINCT PERSONA.Codigo as codalumno, 
	costos.codigo as concep, 
	costos.nombre_producto as nconcep, 
	insc_alum_costo.valor_final_descuento as valor, 
	insc_alum_costo.descuento_porcentaje as pordcto, 
	insc_alum_costo.descuento_valor as valdcto, 
	insc_alum_costo.valor_final_descuento as valorf, 
	DATE_FORMAT(insc_alum_costo.fecha_inicio,'%d/%m/%Y') as fechaini,
	DATE_FORMAT(insc_alum_costo.fecha_fin,'%d/%m/%Y') as fechafin,
	insc_alum_costo.observacion,
	insc_persona_edu_com.fecha_creacion
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN insc_persona_edu_com on insc_persona_edu_com.persona_id_persona = insc_alum_costo.Persona_Id_Persona	 
WHERE
	insc_alum_costo.inscrito = 1
and insc_alum_costo.SY_Id_SY = 4
and costos.tipo_costo = 2
ORDER BY costos.anual, persona.Codigo