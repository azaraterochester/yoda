SELECT PERSONA.Codigo, 
	G.Grado, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	familiar.Apellido1, 
	familiar.Apellido2, 
	familiar.Nombre1, 
	familiar.Nombre2, 
	familiar.email, 
	familiar.Telefono, 
	familiar.Telefono2, 
	familiar.Celular, 
	familiar.Cargo, 
	familiar.Empresa,
	matriculado_codigo(persona.Codigo,5)
FROM Insc_Alum_Curso IAC INNER JOIN Curso C ON IAC.Curso_Id_Curso = C.Id_Curso
	 INNER JOIN Grado G ON C.Grado_Id_Grado = G.Id_Grado
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = IAC.Persona_Id_Persona
	 INNER JOIN insc_persona_grupo_familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN PERSONA familiar ON familiar.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
WHERE IAC.SY_Id_SY = 5 
and IAC.Curso_Id_Curso < 10015
and (insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 2 or insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 2)
AND PERSONA.Activo_Retirado = 1
and matriculado_codigo(persona.Codigo,5) = 0
ORDER BY PERSONA.Codigo ASC