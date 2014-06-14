SELECT COUNT(*)
FROM Eventualidades INNER JOIN Eventualidad_Personas ON Eventualidades.Id_Eventualidad = Eventualidad_Personas.Eventualidades_Id_Eventualidad
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Eventualidad_Personas.Persona_Id_Persona
	 INNER JOIN Subtipo_Eventualidad ON Subtipo_Eventualidad.Id_Subtipo_Eventualidad = Eventualidad_Personas.subtipo_eventualidad
	 INNER JOIN Tipo_Eventualidad ON Tipo_Eventualidad.Id_Tipo_Eventualidad = Subtipo_Eventualidad.Tipo_Eventualidad_Id_Tipo_Eventualidad
WHERE Eventualidades.Fecha >= primerdia(curdate()) AND PERSONA.Id_Persona = 1;