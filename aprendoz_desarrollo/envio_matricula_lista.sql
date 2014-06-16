SELECT 
	PERSONA.email
FROM PERSONA INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN matricula ON matricula.Persona_Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN Grupo_Familiar ON Grupo_Familiar.ID_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN vista_alumnos_activos ON vista_alumnos_activos.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN Tipo_Persona ON Tipo_Persona.Id_Tipo_Persona = PERSONA.Tipo_Persona_Id_Tipo_Persona
	 INNER JOIN	Promocion on Promocion.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
WHERE (PERSONA.Tipo_Persona_Id_Tipo_Persona = 13)
	and promocion.SY_Id_Sy = 4
	and promocion.autorizado_academico = 1
	and promocion.autorizado_cra = 1
	and promocion.autorizado_financiera = 1
	/*and promocion.aprobado = 0*/
	and matricula.SY_Id_SY = 4