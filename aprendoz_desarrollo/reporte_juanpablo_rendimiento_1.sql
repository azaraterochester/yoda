SELECT asignatura.Asignatura, 
logradosf_fecha(PERSONA.Id_Persona,asignatura.Id_Asignatura,cortes_anuales.fecha_fin)/esperados_fecha(asignatura.Id_Asignatura,cortes_anuales.fecha_fin)*100 as porcentaje,
	asignatura.Id_Asignatura, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2,
cortes_anuales.mescorte
FROM Insc_Alum_Asig INNER JOIN asignatura ON Insc_Alum_Asig.Asignatura_Id_Asignatura = asignatura.Id_Asignatura
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Insc_Alum_Asig.Persona_Id_Persona
	 JOIN cortes_anuales
WHERE Asignatura.SY_Id_SY = 3
AND PERSONA.Id_Persona = 195