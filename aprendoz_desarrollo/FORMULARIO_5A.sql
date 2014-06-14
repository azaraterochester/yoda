SELECT 
	1 as JORNADA,
	1 AS 'CARÁCTER',
	'05' AS 'ESPECIALIDAD',
	GRADO_F5A(Insc_Alum_Curso.Curso_Id_Curso),
	Grado.Grado,
	1 AS 'METODOLOGÍA',
    RIGHT(CURSO.Curso,1) AS GRUPO,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2,
	PERSONA.Tipo_Documento,
	PERSONA.No_Documento,
	PERSONA.Lugar_Expedicion_Municipio,
	PERSONA.Lugar_Expedicion_Departamento,
	PERSONA.Municipio,
	PERSONA.Departamento,
	PERSONA.Lugar_Nacimiento_Municipio,
	PERSONA.Lugar_Nacimiento_Departamento,
	PERSONA.Nacionalidad,
	PERSONA.Fecha_Nacimiento,
	PERSONA.Sexo,
	PERSONA.Barrio,
	5 as 'ESTRATO',
	'9' AS 'SISBEN',
	'S' AS 'PROV. SECTOR PRIVADO',
	'9' AS 'COND. ALUM AÑO ANT',
	' ' AS 'ZONAL',
	repite_grado(PERSONA.Id_Persona,Insc_Alum_Curso.SY_Id_SY) as 'REPITENTE',
	'N' AS 'NUEVO',
	'1' AS 'SIT ACAD ALUM AÑO ANT',
	'9' AS 'CON ALUM AÑO ANT',
	'1' AS 'ZON ALUM'
FROM Grado INNER JOIN Curso ON Grado.Id_Grado = Curso.Grado_Id_Grado
	 INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
WHERE Curso.Id_Curso >= 10101 and
	Curso.Id_Curso <= 40403 and
	Insc_Alum_Curso.SY_Id_SY = 3 and
	PERSONA.Activo_Retirado = 1 AND
	PERSONA.matriculado = 1 /*AND
	PERSONA.Apellido1 = "MÉNDEZ"*/
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC