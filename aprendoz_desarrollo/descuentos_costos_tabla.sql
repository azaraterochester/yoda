SELECT distinct
	/*ta.codigo, 
	ta.concepto, 
	ta.nnombre, 
	ta.nconcepto, 
	ta.valor, 
	ta.pordcto, 
	ta.valdcto,*/
	persona.Codigo,
	persona.Id_Persona,
	persona.Apellido1,
	persona.Apellido2,
	persona.Nombre1,
	persona.Nombre2,
	insc_alum_costo.costo_Id_costo,
	insc_alum_costo.descuento_porcentaje, 
	ta.pordcto,
	log_matriculas_acciones_usuarios.usuario,
	log_matriculas_acciones_usuarios.accion_realizada
FROM insc_alum_costo inner join PERSONA 
	ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
    inner join costos 
		on insc_alum_costo.costo_Id_costo = costos.id_costo
	inner join log_matriculas_acciones_usuarios 
		on log_matriculas_acciones_usuarios.accion_realizada 
			like CONCAT('%',persona.Id_Persona,'%') 
		and log_matriculas_acciones_usuarios.accion_realizada 
			like CONCAT('%',costos.nombre_producto,'%')
	 left join (select tabla_descuentos.codigo, tabla_descuentos.pordcto 
			from tabla_descuentos) as ta ON ta.codigo = PERSONA.Codigo
WHERE
	/*(select max(costos.codigo) 
	from costos where costos.id_costo = insc_alum_costo.costo_id_costo) 
	= ta.concepto and  ta.pordcto <> insc_alum_costo.descuento_porcentaje and*/
insc_alum_costo.SY_Id_SY = 5
and ta.pordcto is null 
and insc_alum_costo.descuento_porcentaje > 0