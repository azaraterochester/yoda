SELECT DISTINCT 
	PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar, 
	padre.Apellido1, 
	padre.Apellido2, 
	padre.Nombre1, 
	padre.Nombre2, 
	padre.email
FROM PERSONA INNER JOIN insc_alum_costo ON PERSONA.Id_Persona = insc_alum_costo.Persona_Id_Persona
	 INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN PERSONA padre ON insc_persona_grupo_familiar.Persona_Id_Persona = padre.Id_Persona
WHERE ((select curso_actual(insc_alum_costo.Persona_Id_Persona,3)) BETWEEN 10301 AND 40303) AND ((SELECT codigo(insc_alum_costo.Persona_Id_Persona)) BETWEEN 12000 AND 13999) AND insc_alum_costo.SY_Id_SY = 4
AND insc_alum_costo.Persona_Id_Persona and insc_alum_costo.Persona_Id_Persona <> 1066881 and insc_alum_costo.Persona_Id_Persona <> 1066868
AND insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 12
ORDER BY PERSONA.Apellido1