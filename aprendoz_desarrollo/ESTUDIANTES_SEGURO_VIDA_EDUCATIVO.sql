SELECT PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Fecha_Nacimiento, 
	Curso.Curso, 
	costos.nombre_producto, 
	insc_alum_costo.valor_final_descuento, 
	padreomadre.Apellido1, 
	padreomadre.Apellido2, 
	padreomadre.Nombre1, 
	padreomadre.Nombre2, 
	padreomadre.Tipo_Documento, 
	padreomadre.No_Documento, 
	padreomadre.Fecha_Nacimiento, 
	padreomadre.Profesion, 
	padreomadre.Cargo, 
	padreomadre.Direccion_Residencia, 
	padreomadre.Telefono, 
	padreomadre.Telefono2, 
	padreomadre.Celular, 
	padreomadre.Direccion_Oficina, 
	padreomadre.Telefono_Oficina, 
	padreomadre.email,
	matricula.fecha_matricula
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN Insc_Alum_Curso ON PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
	 INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN insc_persona_grupo_familiar ON insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar = PERSONA.Grupo_Familiar_ID_Grupo_Familiar
	 INNER JOIN PERSONA padreomadre ON padreomadre.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
	 INNER JOIN matricula on matricula.Persona_Id_Persona = PERSONA.Id_Persona
WHERE Insc_Alum_Curso.Curso_Id_Curso BETWEEN 10101 and 40403
AND Insc_Alum_Curso.SY_Id_SY = 4
and insc_alum_costo.SY_Id_SY = 4
and costos.codigo = '0012'
and insc_alum_costo.inscrito = 1
and matricula.SY_Id_SY = 4
and (insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 2 
	or insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 4 
	or insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 6 
	or insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 7 
	OR insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 8
	OR insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 10
	OR insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 12)
order by matricula.fecha_matricula, persona.Codigo