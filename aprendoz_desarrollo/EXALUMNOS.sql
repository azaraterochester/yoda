SELECT vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	vista_alumnos_activos.Curso, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2
FROM insc_alum_costo INNER JOIN vista_alumnos_activos ON insc_alum_costo.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
	 INNER JOIN insc_persona_grupo_familiar ON insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar = vista_alumnos_activos.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
WHERE insc_alum_costo.descuento_porcentaje = 10 and insc_alum_costo.SY_Id_SY = 4 and (costos.codigo = '0001' or costos.codigo = '0001A')
and (PERSONA.Tipo_Persona_Id_Tipo_Persona = 2 or PERSONA.Tipo_Persona_Id_Tipo_Persona = 12) ORDER BY vista_alumnos_activos.Codigo