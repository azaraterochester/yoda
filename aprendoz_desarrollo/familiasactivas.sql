SELECT DISTINCT Grupo_Familiar.Grupo_Familiar, 
	Grupo_Familiar.ID_Grupo_Familiar, 
	Insc_Alum_Curso.SY_Id_SY, 
	PERSONA.Activo_Retirado
FROM Insc_Alum_Curso INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Grupo_Familiar ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = Grupo_Familiar.ID_Grupo_Familiar
WHERE Insc_Alum_Curso.SY_Id_SY = 3 and PERSONA.Activo_Retirado = 1