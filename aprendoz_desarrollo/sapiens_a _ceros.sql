SELECT PERSONA.Codigo as codalumno, 
	costos.codigo as concep, 
	costos.nombre_producto as nconcep, 
	0 as valor, 
	0 as pordcto, 
	0 as valdcto, 
	0 as valorf, 
	'' as fechaini,
	'' as fechafin,
	insc_alum_costo.observacion
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN matricula on matricula.Persona_Id_Persona = insc_alum_costo.Persona_Id_Persona
ORDER BY costos.anual, persona.Codigo
