SELECT Tipo_Eventualidad.Tipo_Eventualidad, 
	Subtipo_Eventualidad.Subtipo_Eventualidad, 
	Eventualidades.Fecha, 
	Eventualidades.Hora, 
	Eventualidades.Estado, 
	PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	remitente.Apellido1, 
	remitente.Apellido2, 
	remitente.Nombre1, 
	remitente.Nombre2, 
	Tipo_Lugar.Lugar, 
	Eventualidades.descripcion, 
	Eventualidades.fecha_ingreso, 
	Eventualidades.pregunta1, 
	Eventualidades.pregunta2, 
	Eventualidades.pregunta3, 
	Eventualidades.fecha_plan_reparacion, 
	Eventualidades.confidencial, 
	Tipo_Eventualidad.Id_Tipo_Eventualidad
FROM Eventualidades INNER JOIN Eventualidad_Personas ON Eventualidades.Id_Eventualidad = Eventualidad_Personas.Eventualidades_Id_Eventualidad
	 INNER JOIN PERSONA remitente ON Eventualidades.usuario_reg = remitente.Nombre_LDAP
	 INNER JOIN Tipo_Lugar ON Tipo_Lugar.Id_Lugar = Eventualidades.Lugar_id_Tipo_Lugar
	 INNER JOIN PERSONA ON PERSONA.Id_Persona = Eventualidad_Personas.Persona_Id_Persona
	 INNER JOIN Subtipo_Eventualidad ON Subtipo_Eventualidad.Id_Subtipo_Eventualidad = Eventualidad_Personas.subtipo_eventualidad
	 INNER JOIN Tipo_Eventualidad ON Tipo_Eventualidad.Id_Tipo_Eventualidad = Subtipo_Eventualidad.Tipo_Eventualidad_Id_Tipo_Eventualidad
WHERE PERSONA.Id_Persona = 195