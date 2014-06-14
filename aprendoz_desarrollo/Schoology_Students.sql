SELECT DISTINCT 
	PERSONA.Nombre1 as First_Name,
	PERSONA.Nombre1 as First_Name_Preferred,
	PERSONA.Nombre2 as Middle_Name, 
	CONCAT(PERSONA.Apellido1," ",PERSONA.Apellido2) AS Last_Name, 
	"" as Name_Prefix,
	"" as Position_Job_Title,
	PERSONA.Nombre_LDAP as Username, 
	PERSONA.email as Email, 
	PERSONA.Id_Persona as User_Inique_Id, 
	PERSONA.Clave as Password, 
	PERSONA.Sexo as Gender,
	"2014" as Grad_Year,
	"261783" as Role,
	"HighSchool 2" as School_Building
FROM Insc_Alum_Curso INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Insc_Alum_Asig ON Insc_Alum_Asig.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN asignatura ON asignatura.Id_Asignatura = Insc_Alum_Asig.Asignatura_Id_Asignatura
WHERE Insc_Alum_Curso.SY_Id_SY = 4
and asignatura.Id_Asignatura = 440434