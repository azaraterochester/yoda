SELECT 
	Grado.Grado, 
	Nivel.Nivel,
	a.Asignatura, 
	P.Apellido1, 
	P.Apellido2, 
	P.Nombre1, 
	P.Nombre2
FROM Insc_Curso_Asig ICA INNER JOIN PERSONA P ON P.Id_Persona = ICA.Persona_Id_Persona
	 INNER JOIN asignatura a ON a.Id_Asignatura = ICA.Asignatura_Id_Asignatura
	 INNER JOIN Grado ON Grado.Id_Grado = a.Grado_Id_Grado
	 INNER JOIN Nivel ON Nivel.Id_Nivel = Grado.Nivel_Id_Nivel
WHERE ICA.Periodo_Id_Periodo = 10 and exists (select * from horario h where h.asignatura_id_asignatura = ICA.Asignatura_Id_Asignatura) 
 = 0
ORDER BY Grado.Id_Grado, ICA.Asignatura_Id_Asignatura ASC