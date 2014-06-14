SELECT DISTINCT
	PERSONA.Id_Persona as idpersona,
	educom.id_educom as ideducom,
	PERSONA.Codigo AS codalumno, 
	costos.codigo AS concep, 
	costos.valor as valornominal,
	educom.comentario as comentario,
	costos.nombre_producto AS nconcep, 
	insc_alum_costo.valor_final_descuento AS valor, 
	insc_persona_edu_com.descuento as descuento,
	insc_alum_costo.valor_final_descuento - insc_persona_edu_com.descuento AS valorfinal,
	DATE_FORMAT(insc_alum_costo.fecha_inicio,'%d/%m/%Y') AS fechaini, 
	DATE_FORMAT(insc_alum_costo.fecha_fin,'%d/%m/%Y') AS fechafin, 
	insc_alum_costo.observacion,
	insc_persona_edu_com.plazo,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2,
	tipo_pago.tipo_pago,
	insc_persona_edu_com.activo_retirado,
	educom.tipo_educom, 
	educom.tarifa_anticipado
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN insc_persona_edu_com on insc_persona_edu_com.persona_id_persona = PERSONA.Id_Persona
	 INNER JOIN tipo_pago on tipo_pago.id_tipo_pago = insc_persona_edu_com.tipo_pago_id_tipo_pago
	 INNER JOIN educom on educom.id_educom = insc_persona_edu_com.educom_id_educom and educom.costo_id_costo = costos.id_costo
WHERE insc_alum_costo.inscrito = 1
and insc_alum_costo.SY_Id_SY = 4
and costos.tipo_costo = 2
AND educom.comentario = 'SEMESTRE'
and (educom.id_educom >= 44 AND educom.id_educom <= 52 OR educom.id_educom >= 54)
/*and educom.activo_retirado = 1*/
and insc_persona_edu_com.activo_retirado = 1
/*and educom.tipo_educom <> 'EAD'*/
/*and insc_alum_costo.observacion = 'mensual'*/
ORDER BY tipo_pago.tipo_pago, costos.nombre_producto ASC, codalumno ASC
