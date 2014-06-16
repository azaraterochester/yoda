SELECT 
	vista_alumnos_activos.Id_Persona,
	vista_alumnos_activos.School_year AS periodoescolar, 
	vista_alumnos_activos.Nivel, 
	vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Codigo, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	vista_alumnos_activos.Id_Persona AS idpersona, 
	vista_alumnos_activos.No_Documento AS numerodocumento, 
	vista_alumnos_activos.Tipo_Documento AS tipodocumento, 
	vista_alumnos_activos.Hijo_de_Exalumno AS hijodeexalumno,
	vista_alumnos_activos.Fecha_Nacimiento as fechanacimientoalumno,
	Tipo_Persona.Tipo_Persona,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Tipo_Documento, 
	PERSONA.No_Documento, 
	PERSONA.Empresa,
	PERSONA.Cargo,
	PERSONA.Profesion,
	PERSONA.email, 
	PERSONA.Telefono AS tel1, 
	PERSONA.Telefono2 AS tel2, 
	PERSONA.Celular, 
	Grupo_Familiar.Grupo_Familiar,
	promocion.autorizado_academico,
	promocion.autorizado_cra,
	promocion.autorizado_financiera,
	promocion.aprobado
FROM PERSONA INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN matricula ON matricula.Persona_Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN Grupo_Familiar ON Grupo_Familiar.ID_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN vista_alumnos_activos ON vista_alumnos_activos.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN Tipo_Persona ON Tipo_Persona.Id_Tipo_Persona = PERSONA.Tipo_Persona_Id_Tipo_Persona
	 INNER JOIN	Promocion on Promocion.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
WHERE (PERSONA.Tipo_Persona_Id_Tipo_Persona = 2 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 12 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 10 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 4 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 6 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 8 
	or PERSONA.Tipo_Persona_Id_Tipo_Persona = 7)
	and promocion.SY_Id_Sy = 4
	and promocion.autorizado_academico = 1
	and promocion.autorizado_cra = 1
	and promocion.autorizado_financiera = 1
	/*and promocion.aprobado = 0*/
	and matricula.SY_Id_SY = 4