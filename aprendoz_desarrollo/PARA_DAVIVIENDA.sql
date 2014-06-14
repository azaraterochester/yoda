SELECT vista_alumnos_activos.School_year AS periodoescolar, 
	vista_alumnos_activos.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.email, 
	PERSONA.Tipo_Documento, 
	PERSONA.No_Documento,
	PERSONA.Parentesco,
	Grupo_Familiar.Grupo_Familiar, 
	Tipo_Persona.Tipo_Persona,
	valor_mensualidad(vista_alumnos_activos.Id_Persona,4)
FROM PERSONA INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN matricula ON matricula.Persona_Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN Grupo_Familiar ON Grupo_Familiar.ID_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN vista_alumnos_activos ON vista_alumnos_activos.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN Tipo_Persona ON Tipo_Persona.Id_Tipo_Persona = PERSONA.Tipo_Persona_Id_Tipo_Persona
WHERE (PERSONA.Tipo_Persona_Id_Tipo_Persona = 2 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 12 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 3
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 10 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 4 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 6 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 8 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 7) 
	and matricula.SY_Id_SY = 4