SELECT alum.Codigo, 
	CONCAT(alum.Nombre1," ",alum.Nombre2," ",alum.Apellido1," ",alum.Apellido2) AS NOMBRE_ALUMNO, 
	Curso.Curso, 
	alum.Telefono, 
	CONCAT(madre.Nombre1," ",madre.Nombre2," ",madre.Apellido1," ",madre.Apellido2) AS NOMBRE_madre, 
	madre.Tipo_Documento AS TipoDocumentomadre, 
	madre.No_Documento AS NoDOCUMENTOmadre, 
	madre.Celular AS CELULAR_madre, 
	madre.email AS CORREO_madre, 
	madre.Telefono, 
	madre.Telefono2, 
	factura_por_davivienda(alum.Codigo) AS vapordavivienda, 
	importacion_davivienda.tarjeta, 
	importacion_davivienda.fecha_creacion, 
	importacion_davivienda.numeroidentificacion
FROM Insc_Alum_Curso Insc_Alum_Curso INNER JOIN PERSONA alum ON Insc_Alum_Curso.Persona_Id_Persona = alum.Id_Persona
	 LEFT OUTER JOIN Curso Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
	 LEFT OUTER JOIN persona madre ON alum.Grupo_Familiar_ID_Grupo_Familiar = madre.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN importacion_davivienda ON importacion_davivienda.numeroidentificacion = madre.No_Documento
	 LEFT OUTER JOIN Tipo_Persona Tipo_Persona_A ON alum.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_A.Id_Tipo_Persona
	 LEFT OUTER JOIN Tipo_Persona Tipo_Persona_B ON madre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_B.Id_Tipo_Persona
WHERE (madre.Tipo_Persona_Id_Tipo_Persona = 2 OR madre.Tipo_Persona_Id_Tipo_Persona = 4 OR madre.Tipo_Persona_Id_Tipo_Persona = 11 OR madre.Tipo_Persona_Id_Tipo_Persona = 10)
      AND alum.Tipo_Persona_Id_Tipo_Persona = 1
      AND Insc_Alum_Curso.SY_Id_SY = 3
	  AND Curso.Id_Curso >= 10101 and Curso.Id_Curso <= 40403 
	  AND alum.Activo_Retirado = 1 and alum.matriculado = 1
GROUP BY alum.Codigo
ORDER BY Curso.Id_Curso ASC, alum.Apellido1 ASC, alum.Apellido2 ASC, alum.Nombre1 ASC, alum.Nombre2 ASC
