SELECT PERSONA.Codigo, 
	PERSONA.Tipo_Documento, 
	PERSONA.No_Documento, 
	Curso.Curso, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	tiene_costo_inscrito(PERSONA.Id_Persona,3,"0011") AS `SEGURO DE ACCIDENTES`, 
	tiene_costo_inscrito(PERSONA.Id_Persona,3,"0012") AS `SEGURO DE VIDA EDUCATIVO`
FROM Curso INNER JOIN Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
WHERE Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403 and
Insc_Alum_Curso.SY_Id_SY = 3 and
PERSONA.Activo_Retirado = 1 and
PERSONA.matriculado = 1
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC