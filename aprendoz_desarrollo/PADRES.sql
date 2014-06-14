SELECT DISTINCT 
PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.No_Documento, 
	PERSONA.Codigo, 
	Grado.Grado
FROM 
Grado INNER JOIN 
Curso ON Grado.Id_Grado = Curso.Grado_Id_Grado INNER JOIN 
Insc_Alum_Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso INNER JOIN 
PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona RIGHT OUTER JOIN
PERSONA padre ON PERSONA.Grupo_Familiar_ID_Grupo_Familiar = padre.Grupo_Familiar_ID_Grupo_Familiar
WHERE 
(
padre.Tipo_Persona_Id_Tipo_Persona = 2 or
padre.Tipo_Persona_Id_Tipo_Persona = 4 or 
padre.Tipo_Persona_Id_Tipo_Persona = 8 or 
padre.Tipo_Persona_Id_Tipo_Persona = 6 or
padre.Tipo_Persona_Id_Tipo_Persona = 7 
) and

Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403 and
Insc_Alum_Curso.SY_Id_SY = 3 and
PERSONA.Activo_Retirado = 1
ORDER BY Curso.Id_Curso ASC, PERSONA.Apellido1 ASC, PERSONA.Apellido2 ASC, PERSONA.Nombre1 ASC, PERSONA.Nombre2 ASC