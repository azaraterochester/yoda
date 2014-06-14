SELECT DISTINCT
	PERSONA.Id_Persona as idpersona,
	PERSONA.Codigo AS codalumno, 
	costos.codigo AS concep, 
	costos.nombre_producto AS nconcep, 
	insc_alum_costo.valor_final_descuento AS valor, 
	insc_persona_edu_com.descuento as descuento,
	insc_alum_costo.descuento_porcentaje AS pordcto, 
	insc_alum_costo.descuento_valor AS valdcto, 
	insc_alum_costo.valor_final_descuento AS valorf,
	DATE_FORMAT(insc_alum_costo.fecha_inicio,'%d/%m/%Y') AS fechaini, 
	DATE_FORMAT(insc_alum_costo.fecha_fin,'%d/%m/%Y') AS fechafin, 
	insc_alum_costo.observacion, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2,
	tipo_pago.tipo_pago
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN insc_persona_edu_com on insc_persona_edu_com.persona_id_persona = PERSONA.Id_Persona
	 INNER JOIN tipo_pago on tipo_pago.id_tipo_pago = insc_persona_edu_com.tipo_pago_id_tipo_pago
	 INNER JOIN educom on educom.id_educom = insc_persona_edu_com.educom_id_educom and educom.costo_id_costo = costos.id_costo
WHERE insc_alum_costo.inscrito = 1
and insc_alum_costo.SY_Id_SY = 4
and costos.id_costo >= 2057 and costos.id_costo <= 20107
ORDER BY costos.nombre_producto ASC, codalumno ASC
