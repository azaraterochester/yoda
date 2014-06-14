SELECT insc_alum_costo.Persona_Id_Persona, 
	count(costos.codigo), 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2
FROM insc_alum_costo INNER JOIN costos ON insc_alum_costo.costo_Id_costo = costos.id_costo
	 INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
GROUP BY insc_alum_costo.Persona_Id_Persona