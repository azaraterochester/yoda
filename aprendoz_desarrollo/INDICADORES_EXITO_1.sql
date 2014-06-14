SELECT PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Fecha_Retiro
FROM PERSONA
WHERE
PERSONA.Fecha_Retiro >= '2012-06-01' and
PERSONA.Fecha_Retiro <= '2013-08-01'