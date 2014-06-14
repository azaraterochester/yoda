select exists ( 
	SELECT * FROM 	insc_persona_grupo_familiar 
					inner join PERSONA on insc_persona_grupo_familiar.Persona_Id_Persona = PERSONA.Id_Persona 
					WHERE insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 1 
					and PERSONA.Codigo >= 13000 
					and PERSONA.Codigo <= 13999 
					AND insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar = 90 )