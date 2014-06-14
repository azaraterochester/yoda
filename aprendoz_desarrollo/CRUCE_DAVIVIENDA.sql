SELECT Curso.Curso, 
	padre.Apellido1, 
	padre.Apellido2, 
	padre.Nombre1, 
	padre.Nombre2, 
	padre.No_Documento, 
	est.Codigo,
	est.Apellido1,
	est.Apellido2,
	est.Nombre1,
	est.Nombre2,
	iac.Curso_Id_Curso, 
	id.tarjeta, 
	id.numeroidentificacion,
	id.fecha_creacion
FROM importacion_davivienda id INNER JOIN PERSONA padre ON padre.No_Documento = id.numeroidentificacion
	 INNER JOIN PERSONA est ON est.Grupo_Familiar_ID_Grupo_Familiar = padre.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN Insc_Alum_Curso iac ON iac.Persona_Id_Persona = est.Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = iac.Curso_Id_Curso
WHERE (
padre.Tipo_Persona_Id_Tipo_Persona = 2 or 
padre.Tipo_Persona_Id_Tipo_Persona = 12 or 
padre.Tipo_Persona_Id_Tipo_Persona = 4 or 
padre.Tipo_Persona_Id_Tipo_Persona = 8 or 
padre.Tipo_Persona_Id_Tipo_Persona = 6 or
padre.Tipo_Persona_Id_Tipo_Persona = 7 
) 
and est.Tipo_Persona_Id_Tipo_Persona = 1 
and est.Activo_Retirado = 1
and iac.SY_Id_SY = 4
and iac.Curso_Id_Curso >= 10101
and iac.Curso_Id_Curso <= 40403
and id.fecha_creacion = '2013-10-07'
ORDER BY iac.Curso_Id_Curso, est.Apellido1, est.Apellido2
