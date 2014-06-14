SELECT Curso.Curso, 
	Grupo_Familiar.Grupo_Familiar, 
	alum.Codigo, 
	CONCAT(alum.Apellido1," ",alum.Apellido2," ",alum.Nombre1," ",alum.Nombre2) AS NOMBRE_ALUMNO, 
	padre.Telefono,
	padre.Telefono2,
	padre.Telefono_Oficina,
	padre.Celular,
	padre.email,
	CONCAT(padre.Apellido1," ",padre.Apellido2," ",padre.Nombre1," ",padre.Nombre2) AS NOMBRE_PADRE, 
	madre.Telefono,
	madre.Telefono2,
	madre.Telefono_Oficina,
	madre.Celular,
	madre.email,
	CONCAT(madre.Apellido1," ",madre.Apellido2," ",madre.Nombre1," ",madre.Nombre2) AS NOMBRE_MADRE
FROM Insc_Alum_Curso Insc_Alum_Curso INNER JOIN PERSONA alum ON Insc_Alum_Curso.Persona_Id_Persona = alum.Id_Persona
	 INNER JOIN Grupo_Familiar Grupo_Familiar ON alum.Grupo_Familiar_ID_Grupo_Familiar = Grupo_Familiar.ID_Grupo_Familiar
	 INNER JOIN persona padre ON alum.Grupo_Familiar_ID_Grupo_Familiar = padre.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN persona madre ON alum.Grupo_Familiar_ID_Grupo_Familiar = madre.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN Tipo_Persona Tipo_Persona_A ON alum.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_A.Id_Tipo_Persona
	 INNER JOIN Tipo_Persona Tipo_Persona ON madre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona.Id_Tipo_Persona
	 INNER JOIN Tipo_Persona Tipo_Persona_B ON padre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_B.Id_Tipo_Persona
	 INNER JOIN Curso Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
WHERE (padre.Tipo_Persona_Id_Tipo_Persona = 2 OR padre.Tipo_Persona_Id_Tipo_Persona = 4 OR padre.Tipo_Persona_Id_Tipo_Persona = 11 OR padre.Tipo_Persona_Id_Tipo_Persona = 10)
	  AND (madre.Tipo_Persona_Id_Tipo_Persona = 12 OR madre.Tipo_Persona_Id_Tipo_Persona = 4 OR madre.Tipo_Persona_Id_Tipo_Persona = 10 OR madre.Tipo_Persona_Id_Tipo_Persona = 11)
      AND alum.Tipo_Persona_Id_Tipo_Persona = 1
      AND Insc_Alum_Curso.SY_Id_SY = 4
	  AND Curso.Id_Curso >= 10101 and Curso.Id_Curso <= 40403 
	  AND alum.Activo_Retirado = 1 and alum.matriculado = 1
ORDER BY Curso.Id_Curso ASC, alum.Apellido1 ASC, alum.Apellido2 ASC, alum.Nombre1 ASC, alum.Nombre2 ASC