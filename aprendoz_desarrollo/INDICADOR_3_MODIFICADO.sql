SELECT Grado.Id_Grado, Grado.Grado, count(*), 
	estudiantes_por_grado(Grado.Id_Grado,iac.SY_Id_SY)
FROM Curso INNER JOIN Grado ON Curso.Grado_Id_Grado = Grado.Id_Grado
	 INNER JOIN Insc_Alum_Curso iac ON Curso.Id_Curso = iac.Curso_Id_Curso
	 INNER JOIN PERSONA ON iac.Persona_Id_Persona = PERSONA.Id_Persona
WHERE iac.SY_Id_SY = 3 and iac.Curso_Id_Curso >= 10101 and iac.Curso_Id_Curso <= 40403 and 
asignaturas_bajo_fecha(iac.Persona_Id_Persona,iac.SY_Id_SY,"2012-12-13") >= 2 
GROUP BY Grado.Id_Grado