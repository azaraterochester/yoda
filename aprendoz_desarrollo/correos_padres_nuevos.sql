SELECT PERSONA.Parentesco, 
	PERSONA.email, 
	PERSONA.Celular
FROM PERSONA INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN vista_alumnos_activos_prejardin_nuevos ON vista_alumnos_activos_prejardin_nuevos.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
WHERE PERSONA.Tipo_Persona_Id_Tipo_Persona = 2 or PERSONA.Tipo_Persona_Id_Tipo_Persona = 12 