SELECT
	alum.Codigo, 
	CONCAT(alum.Nombre1," ",alum.Nombre2," ",alum.Apellido1," ",alum.Apellido2) AS NOMBRE_ALUMNO, 
	Curso.Curso, 
	alum.Telefono, 
	CONCAT(padre.Nombre1," ",padre.Nombre2," ",padre.Apellido1," ",padre.Apellido2) AS NOMBRE_PADRE, 
	padre.Tipo_Documento AS TipoDocumentoPadre, 
	padre.No_Documento AS NoDOCUMENTOPADRE, 
	padre.Celular AS CELULAR_PADRE, 
	padre.email AS CORREO_PADRE, 
	padre.Telefono, 
	padre.Telefono2,
	CONCAT(madre.Nombre1," ",madre.Nombre2," ",madre.Apellido1," ",madre.Apellido2) AS NOMBRE_MADRE, 
	madre.Celular AS CELULAR_MADRE, 
	madre.email AS CORREO_MADRE, 
	madre.Tipo_Documento, 
	madre.No_Documento, 
	madre.Telefono, 
	madre.Telefono2, 
	CONCAT(alum.Nombre1," ",alum.Nombre2) AS ALUMNO, 
	CONCAT(padre.Nombre1," ",padre.Nombre2) AS PADRE, 
	CONCAT(madre.Nombre1," ",madre.Nombre2) AS MADRE, 
	factura_por_davivienda(alum.Codigo) AS vapordavivienda, 
	cartera_codigo_numero_mes(alum.Codigo,6) as estaencarteraefebrero
FROM Insc_Alum_Curso Insc_Alum_Curso INNER JOIN PERSONA alum ON Insc_Alum_Curso.Persona_Id_Persona = alum.Id_Persona
	 LEFT OUTER JOIN persona padre ON alum.Grupo_Familiar_ID_Grupo_Familiar = padre.Grupo_Familiar_ID_Grupo_Familiar
	 LEFT OUTER JOIN persona madre ON alum.Grupo_Familiar_ID_Grupo_Familiar = madre.Grupo_Familiar_ID_Grupo_Familiar
	 LEFT OUTER JOIN Tipo_Persona Tipo_Persona_A ON alum.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_A.Id_Tipo_Persona
	 LEFT OUTER JOIN Tipo_Persona Tipo_Persona ON madre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona.Id_Tipo_Persona
	 LEFT OUTER JOIN Tipo_Persona Tipo_Persona_B ON padre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_B.Id_Tipo_Persona
	 LEFT OUTER JOIN Curso Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
WHERE (padre.Tipo_Persona_Id_Tipo_Persona = 2 OR padre.Tipo_Persona_Id_Tipo_Persona = 4 OR padre.Tipo_Persona_Id_Tipo_Persona = 11 OR padre.Tipo_Persona_Id_Tipo_Persona = 10)
	  AND (madre.Tipo_Persona_Id_Tipo_Persona = 12 OR madre.Tipo_Persona_Id_Tipo_Persona = 4 OR madre.Tipo_Persona_Id_Tipo_Persona = 10 OR madre.Tipo_Persona_Id_Tipo_Persona = 11)
      AND alum.Tipo_Persona_Id_Tipo_Persona = 1
      AND Insc_Alum_Curso.SY_Id_SY = 3
	  AND Curso.Id_Curso >= 10101 and Curso.Id_Curso <= 40403 
	  AND alum.Activo_Retirado = 1 and alum.matriculado = 1
GROUP BY alum.Codigo
ORDER BY Curso.Id_Curso ASC, alum.Apellido1 ASC, alum.Apellido2 ASC, alum.Nombre1 ASC, alum.Nombre2 ASC
