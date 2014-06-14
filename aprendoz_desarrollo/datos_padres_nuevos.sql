SELECT vista_alumnos_activos_prejardin_nuevos.School_year AS periodoescolar, 
	vista_alumnos_activos_prejardin_nuevos.Nivel, 
	vista_alumnos_activos_prejardin_nuevos.Grado, 
	vista_alumnos_activos_prejardin_nuevos.Curso, 
	vista_alumnos_activos_prejardin_nuevos.Codigo, 
	vista_alumnos_activos_prejardin_nuevos.Apellido1, 
	vista_alumnos_activos_prejardin_nuevos.Apellido2, 
	vista_alumnos_activos_prejardin_nuevos.Nombre1, 
	vista_alumnos_activos_prejardin_nuevos.Nombre2, 
	vista_alumnos_activos_prejardin_nuevos.Id_Persona AS idpersona, 
	vista_alumnos_activos_prejardin_nuevos.No_Documento AS numerodocumento, 
	vista_alumnos_activos_prejardin_nuevos.Tipo_Documento AS tipodocumento, 
	PERSONA.Parentesco, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.email, 
	matricula.fecha_matricula AS fecha, 
	PERSONA.Telefono AS tel1, 
	PERSONA.Telefono2 AS tel2, 
	PERSONA.Celular, 
	PERSONA.Tipo_Documento, 
	PERSONA.No_Documento
FROM PERSONA INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN matricula ON matricula.Persona_Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN vista_alumnos_activos_prejardin_nuevos ON vista_alumnos_activos_prejardin_nuevos.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
WHERE PERSONA.Tipo_Persona_Id_Tipo_Persona = 2 or PERSONA.Tipo_Persona_Id_Tipo_Persona = 12 and matricula.SY_Id_SY = 4 AND PERSONA.Activo_Retirado = 1 AND PERSONA.matriculado = 1