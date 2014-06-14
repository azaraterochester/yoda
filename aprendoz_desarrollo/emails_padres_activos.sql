SELECT vista_alumnos_activos.Curso as Curso, 
	vista_alumnos_activos.Id_Persona as Id, 
	vista_alumnos_activos.Apellido1 as Apellido1, 
	vista_alumnos_activos.Apellido2 as Apellido2, 
	vista_alumnos_activos.Nombre1 as Nombre1, 
	vista_alumnos_activos.Nombre2 as Nombre2, 
	PERSONA.Tipo_Persona_Id_Tipo_Persona AS Tipo_Persona_B_Tipo_Persona, 
	PERSONA.Apellido1 as Padre_Apellido1, 
	PERSONA.Apellido2 as Padre_Apellido2, 
	PERSONA.Nombre1 as Padre_Nombre1, 
	PERSONA.Nombre2 as Padre_Nombre2, 
	PERSONA.email as Email, 
	PERSONA.Telefono as TEL1, 
	PERSONA.Telefono2 as TEL2, 
	PERSONA.Telefono_Oficina AS TELOFI, 
	PERSONA.Celular AS CELU, 
	vista_alumnos_activos.Tipo_Persona_Id_Tipo_Persona as Tipo_Persona_Tipo_Persona, 
	vista_alumnos_activos.Codigo as codigo, 
	vista_alumnos_activos.Activo_Retirado as alum_matriculado
FROM insc_persona_grupo_familiar 
	INNER JOIN vista_alumnos_activos 
		ON insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar = vista_alumnos_activos.Grupo_Familiar_ID_Grupo_Familiar
	INNER JOIN PERSONA 
		ON PERSONA.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
WHERE
	insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 2