SELECT aa.Grado, 
	aa.Curso, 
	aa.Apellido1, 
	aa.Apellido2, 
	aa.Nombre1, 
	aa.Nombre2, 
	promocion.autorizado_academico AS academico, 
	promocion.autorizado_financiera AS financiera, 
	promocion.autorizado_cra AS biblioteca, 
	EXISTS(select * from matricula where matricula.SY_Id_SY = 5 and matricula.Persona_Id_Persona = aa.Id_Persona) AS matriculado, 
	aa.Codigo
FROM vista_alumnos_activos aa INNER JOIN promocion ON promocion.Persona_Id_Persona = aa.Id_Persona
WHERE promocion.SY_Id_Sy = 4