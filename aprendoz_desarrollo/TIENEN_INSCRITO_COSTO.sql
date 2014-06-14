SELECT PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	costos.valor, 
	SY.School_year, 
	vista_alumnos_activos.Curso
FROM costos INNER JOIN insc_alum_costo ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN vista_alumnos_activos ON vista_alumnos_activos.Id_Persona = insc_alum_costo.Persona_Id_Persona
	 INNER JOIN SY ON SY.Id_SY = costos.SY_Id_SY
	 INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
WHERE insc_alum_costo.SY_Id_SY = 4 and insc_alum_costo.inscrito = 1 and costos.anual = 1 and costos.nombre_producto like '%ASOPADRES%'