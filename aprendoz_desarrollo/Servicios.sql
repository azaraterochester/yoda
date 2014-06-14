SELECT vista_alumnos_activos.Nivel, 
	vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Codigo, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2,
	tiene_costo_inscrito(vista_alumnos_activos.Id_Persona,4,'0021') as Almuerzo,
	tiene_costo_inscrito(vista_alumnos_activos.Id_Persona,4,'0022') as MediasNueves,
	tiene_costo_inscrito_NOMBRE(vista_alumnos_activos.Id_Persona,4,'TRANSPORTE COMPLETO') as TransporteCompleto,
	tiene_costo_inscrito_NOMBRE(vista_alumnos_activos.Id_Persona,4,'TRANSPORTE MEDIO') as TransporteMedio,
	tiene_costo_inscrito_NOMBRE(vista_alumnos_activos.Id_Persona,4,'MENSAJES SMS - TRANSPORTE - SALIDA/LLEGADA') as Mensajes
FROM vista_alumnos_activos