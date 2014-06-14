SELECT DISTINCT 
PERSONA.Codigo,
	Nivel.Nivel,
	Grado.Grado,
	Curso.Id_Curso,
	Curso.Curso,
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2,
	PERSONA.No_Documento,
tiene_costo_inscrito(PERSONA.Id_Persona,4,"0021") as 'ALMUERZO',
tiene_costo_inscrito(PERSONA.Id_Persona,4,"0022") AS 'MEDIAS NUEVES',
tiene_costo_inscrito(PERSONA.Id_Persona,4,"0023") AS 'TRANSPORTE',
tiene_costo_inscrito(PERSONA.Id_Persona,4,"0011") AS 'SEGURO_ACCIDENTES',
tiene_costo_inscrito(PERSONA.Id_Persona,4,"0012") AS 'SEGURO_VIDA_EDUCATIVO'
FROM Curso INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Grado on Curso.Grado_Id_Grado = Grado.Id_Grado
	 INNER JOIN Nivel ON Grado.Nivel_Id_Nivel = Nivel.Id_Nivel
WHERE
Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403 and
Insc_Alum_Curso.SY_Id_SY = 4 and
PERSONA.Activo_Retirado = 1 and
PERSONA.matriculado = 1
ORDER BY
Curso.Id_Curso, PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2