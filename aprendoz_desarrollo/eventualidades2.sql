SELECT COUNT(DISTINCT (Eventualidad_Personas.Eventualidades_Id_Eventualidad))
FROM Eventualidad_Personas INNER JOIN Eventualidades ON Eventualidad_Personas.Eventualidades_Id_Eventualidad = Eventualidades.Id_Eventualidad
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Eventualidad_Personas.Persona_Id_Persona
	 INNER JOIN Subtipo_Eventualidad ON Subtipo_Eventualidad.Id_Subtipo_Eventualidad = Eventualidad_Personas.subtipo_eventualidad
	 INNER JOIN Tipo_Eventualidad ON Subtipo_Eventualidad.Tipo_Eventualidad_Id_Tipo_Eventualidad = Tipo_Eventualidad.Id_Tipo_Eventualidad
WHERE Eventualidad_Personas.Persona_Id_Persona = 195 and Tipo_Eventualidad.Id_Tipo_Eventualidad = 3