SELECT DISTINCT Curso.Curso,
alum.Codigo as codigo,
	alum.Apellido1,
	alum.Apellido2,
	alum.Nombre1,
	alum.Nombre2,	Tipo_Persona_B.Tipo_Persona AS Tipo_Persona_B_Tipo_Persona, 	padre.Apellido1,
	padre.Apellido2,
	padre.Nombre1,
	padre.Nombre2,
	padre.email AS emailPadre,
	padre.Telefono AS TEL1,
	padre.Telefono2 AS TEL2,
	padre.Telefono_Oficina AS TELOFI,
	padre.Celular AS CELU,
	Tipo_Persona_A.Tipo_Persona AS Tipo_Persona_Tipo_Persona, 	alum.matriculado AS MATRICULADOFROM Insc_Alum_Curso Insc_Alum_Curso INNER JOIN PERSONA alum ON Insc_Alum_Curso.Persona_Id_Persona = alum.Id_Persona	 INNER JOIN Grupo_Familiar Grupo_Familiar ON alum.Grupo_Familiar_ID_Grupo_Familiar = Grupo_Familiar.ID_Grupo_Familiar
	 INNER JOIN Tipo_Persona Tipo_Persona_A ON alum.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_A.Id_Tipo_Persona	 INNER JOIN Curso Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso     INNER JOIN persona padre ON alum.Grupo_Familiar_ID_Grupo_Familiar = padre.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN Tipo_Persona Tipo_Persona_B ON padre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_B.Id_Tipo_PersonaWHERE (padre.Tipo_Persona_Id_Tipo_Persona = 12 or padre.Tipo_Persona_Id_Tipo_Persona = 10 or padre.Tipo_Persona_Id_Tipo_Persona = 4 or padre.Tipo_Persona_Id_Tipo_Persona = 8) AND alum.Tipo_Persona_Id_Tipo_Persona = 1 AND Insc_Alum_Curso.SY_Id_SY = 3 AND Curso.Id_Curso >= 10101 
 AND Curso.Id_Curso <= 40403 AND alum.`Tipo_Persona_Id_Tipo_Persona` = 1
 AND alum.Activo_Retirado = 1
GROUP BY alum.CodigoORDER BY Curso.Id_Curso ASC, alum.Apellido1 ASC, alum.Apellido2 ASC, alum.Nombre1 ASC, alum.Nombre2 ASC