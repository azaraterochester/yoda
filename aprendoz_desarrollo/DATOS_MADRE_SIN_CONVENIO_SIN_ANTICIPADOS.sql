SELECT DISTINCT  alum.Codigo, 
	CONCAT(alum.Nombre1," ",alum.Nombre2," ",alum.Apellido1," ",alum.Apellido2) AS NOMBRE_ALUMNO, 
	Curso.Curso, 
	CONCAT(padre.Nombre1," ",padre.Nombre2," ",padre.Apellido1," ",padre.Apellido2) AS NOMBRE_PADRE, 
	padre.Tipo_Documento, 
	padre.No_Documento, 
	padre.email, 
	padre.Telefono, 
	padre.Telefono2, 
	padre.Celular
FROM Grado INNER JOIN Curso ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA alum ON Insc_Alum_Curso.Persona_Id_Persona = alum.Id_Persona
	 INNER JOIN Grupo_Familiar Grupo_Familiar ON alum.Grupo_Familiar_ID_Grupo_Familiar = Grupo_Familiar.ID_Grupo_Familiar
	 LEFT OUTER JOIN persona padre ON alum.Grupo_Familiar_ID_Grupo_Familiar = padre.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN Tipo_Persona Tipo_Persona_A ON alum.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_A.Id_Tipo_Persona
	 INNER JOIN Tipo_Persona Tipo_Persona_B ON padre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_B.Id_Tipo_Persona
	 INNER JOIN davivienda ON alum.Codigo = davivienda.codigo
WHERE 
(padre.Tipo_Persona_Id_Tipo_Persona = 12 OR padre.Tipo_Persona_Id_Tipo_Persona = 4 OR padre.Tipo_Persona_Id_Tipo_Persona = 11 OR padre.Tipo_Persona_Id_Tipo_Persona = 10) AND alum.Tipo_Persona_Id_Tipo_Persona = 1 and
	Curso.Id_Curso >= 10101 and
	Curso.Id_Curso <= 40403 and
	Insc_Alum_Curso.SY_Id_SY = 3 and
	alum.Activo_Retirado = 1 AND
	alum.matriculado = 1 and
	(davivienda.facturadavivienda = 0) AND (SELECT EXISTS(SELECT * FROM anticipos where anticipos.codigo = alum.Codigo) = 0)
GROUP BY alum.Codigo
ORDER BY Curso.Id_Curso ASC, alum.Apellido1 ASC, alum.Apellido2 ASC, alum.Nombre1 ASC, alum.Nombre2 ASC