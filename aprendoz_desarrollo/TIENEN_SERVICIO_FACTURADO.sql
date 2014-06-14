SELECT PERSONA.Codigo, 
	Curso.Curso, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Tipo_Documento, 
	PERSONA.No_Documento, 
	tiene_costo_inscrito_facturacion(PERSONA.Codigo,"ALMUERZO") AS F_ALMUERZO, 
	tiene_costo_inscrito(PERSONA.Id_Persona,3,"0021") AS ALMUERZO, 
	tiene_costo_inscrito_facturacion(PERSONA.Codigo,"MEDIAS NUEVES") AS F_MEDIAS_NUEVES, 
	tiene_costo_inscrito(PERSONA.Id_Persona,3,"0022") AS MEDIAS_NUEVES, 
	tiene_costo_inscrito_facturacion(PERSONA.Codigo,"TRANSPORTE") AS F_TRANSPORTE, 
	tiene_costo_inscrito(PERSONA.Id_Persona,3,"0023") AS TRANSPORTE, 
	tiene_costo_inscrito(PERSONA.Id_Persona,3,"0011") AS SEGURO_ACCIDENTES, 
	tiene_costo_inscrito(PERSONA.Id_Persona,3,"0012") AS SEGURO_VIDA_EDUCATIVO, 
	PERSONA.EPS, 
	PERSONA.Tipo_Sangre, 
	SY.School_year
FROM Curso INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN SY ON SY.Id_SY = Insc_Alum_Curso.SY_Id_SY
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
WHERE Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403 and
Insc_Alum_Curso.SY_Id_SY = 3
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC