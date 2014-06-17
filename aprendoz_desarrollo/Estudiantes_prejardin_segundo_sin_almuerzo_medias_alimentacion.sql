SELECT vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Codigo, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	costos.nombre_producto
FROM insc_alum_costo INNER JOIN vista_alumnos_activos ON insc_alum_costo.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
WHERE insc_alum_costo.SY_Id_SY = 5 and (costos.nombre_producto like '%ALMUERZO%' OR costos.nombre_producto like '%MEDIAS%') AND vista_alumnos_activos.Id_Curso < 20301 and insc_alum_costo.inscrito = 0