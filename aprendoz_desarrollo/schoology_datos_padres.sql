SELECT 
	grado.Grado,
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre_LDAP, 
	vista_alumnos_activos.email, 
	vista_alumnos_activos.Codigo, 
	vista_alumnos_activos.Clave, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre_LDAP, 
	PERSONA.email, 
	PERSONA.Clave
FROM PERSONA INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN matricula ON matricula.Persona_Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN curso on curso.Id_Curso = matricula.Curso_Id_Curso
	 INNER JOIN grado on grado.Id_Grado = curso.Grado_Id_Grado
	 INNER JOIN Grupo_Familiar ON Grupo_Familiar.ID_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN vista_alumnos_activos ON vista_alumnos_activos.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN Tipo_Persona ON Tipo_Persona.Id_Tipo_Persona = PERSONA.Tipo_Persona_Id_Tipo_Persona
WHERE (PERSONA.Tipo_Persona_Id_Tipo_Persona = 2 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 12 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 10 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 4 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 6 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 8 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 7) 
	and matricula.SY_Id_SY = 5