SELECT 
	vista_alumnos_activos.Nivel, 
	vista_alumnos_activos.Grado, 
	vista_alumnos_activos.Curso, 
	vista_alumnos_activos.Codigo, 
	vista_alumnos_activos.Apellido1, 
	vista_alumnos_activos.Apellido2, 
	vista_alumnos_activos.Nombre1, 
	vista_alumnos_activos.Nombre2, 
	vista_alumnos_activos.Id_Persona AS idpersona, 
	vista_alumnos_activos.No_Documento AS numerodocumento, 
	vista_alumnos_activos.Tipo_Documento AS tipodocumento
FROM vista_alumnos_activos inner join matricula ON matricula.Persona_Id_Persona = vista_alumnos_activos.Id_Persona
WHERE matricula.SY_Id_SY = 4
