SELECT PERSONA.Codigo as codalumno, 
	costos.codigo as concep, 
	costos.nombre_producto as nconcep, 
	costos.valor as valor, 
	insc_alum_costo.descuento_porcentaje as pordcto, 
	insc_alum_costo.descuento_valor as valdcto, 
	insc_alum_costo.valor_final_descuento as valorf, 
	DATE_FORMAT(insc_alum_costo.fecha_inicio,'%d/%m/%Y') as fechaini,
	DATE_FORMAT(insc_alum_costo.fecha_fin,'%d/%m/%Y') as fechafin,
	insc_alum_costo.observacion as observacion
FROM PERSONA INNER JOIN insc_alum_costo ON PERSONA.Id_Persona = insc_alum_costo.Persona_Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN matricula on matricula.Persona_Id_Persona = persona.Id_Persona and matricula.SY_Id_SY = insc_alum_costo.SY_Id_SY
WHERE
persona.Activo_Retirado = 1 and
insc_alum_costo.inscrito = 1 and
insc_alum_costo.SY_Id_SY = 5 AND
LEFT(PERSONA.Codigo,2) = 14 AND
costos.codigo <> 9999 and
costos.anual = 0
order by persona.Codigo