SELECT 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Fecha_Nacimiento,
	COUNT(edad(PERSONA.Id_Persona))
FROM PERSONA
WHERE PERSONA.Tipo_Persona_Id_Tipo_Persona = 1
GROUP BY edad(PERSONA.Id_Persona)