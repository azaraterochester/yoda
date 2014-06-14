SELECT Grupo_Familiar.Grupo_Familiar, 
	Tipo_Persona.Tipo_Persona, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.email, 
	PERSONA.Telefono, 
	PERSONA.Telefono2, 
	PERSONA.Direccion_Residencia, 
	curso_actual(PERSONA.Id_Persona,3) as curso,
	curso_actual(PERSONA.Id_Persona,4) as enprejardin,
	(SELECT COUNT(*) FROM insc_persona_grupo_familiar ipg2 where ipg2.Grupo_familiar_Id_Grupo_Familiar = ipg.Grupo_Familiar_Id_Grupo_Familiar and ipg2.Tipo_Persona_Id_Tipo_Persona = 1) AS numeroestudiantes
FROM Grupo_Familiar INNER JOIN insc_persona_grupo_familiar ipg ON Grupo_Familiar.ID_Grupo_Familiar = ipg.Grupo_familiar_Id_Grupo_Familiar
	 INNER JOIN Tipo_Persona ON ipg.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona.Id_Tipo_Persona
	 INNER JOIN PERSONA ON ipg.Persona_Id_Persona = PERSONA.Id_Persona
WHERE grupo_familiar_prejardin(Grupo_Familiar.ID_Grupo_Familiar) = 1 and (curso_actual(PERSONA.Id_Persona,3) = 0 OR curso_actual(PERSONA.Id_Persona,3) >= 10101 and curso_actual(PERSONA.Id_Persona,3) <= 40403 )