SELECT Grado.Grado, 
	Curso.Curso, 
	PERSONA.Codigo, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	Grado.Grado,
	costo_valor_grado(grado_siguiente.Grado_Id_Grado2,'0001',5,(SELECT es_nuevo(PERSONA.Id_Persona))) as matriculaantiguo,
	costo_valor_grado(grado_siguiente.Grado_Id_Grado2,'0001A',5,(SELECT es_nuevo(PERSONA.Id_Persona))) as matriculanuevo,
	costo_valor_grado(grado_siguiente.Grado_Id_Grado2,'0003',5,(SELECT es_nuevo(PERSONA.Id_Persona))) as bibliobanco,
	costo_valor_grado(grado_siguiente.Grado_Id_Grado2,'0011',5,(SELECT es_nuevo(PERSONA.Id_Persona))) as seguroaccidentes,
	costo_valor_grado(grado_siguiente.Grado_Id_Grado2,'0014',5,(SELECT es_nuevo(PERSONA.Id_Persona))) as asopadres,
	costo_valor_grado(grado_siguiente.Grado_Id_Grado2,'0012',5,(SELECT es_nuevo(PERSONA.Id_Persona))) as segurovida,
	g.Grado,
	papas.Apellido1,
	papas.Apellido2,
	papas.Nombre1,
	papas.Nombre2,
	mamas.Apellido1,
	mamas.Apellido2, 
	mamas.Nombre1,
	mamas.Nombre2
	
FROM 
	PERSONA inner join Insc_Alum_Curso on PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
			inner join Curso on Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
			inner join Grado on grado.Id_Grado = curso.Grado_Id_Grado
			inner join grado_siguiente on grado_siguiente.Grado_Id_Grado1 = Grado.Id_Grado
			inner join Grado G on G.Id_Grado = grado_siguiente.Grado_Id_Grado2
			inner join insc_persona_grupo_familiar on PERSONA.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona 
			left join (select padre.Apellido1, padre.Apellido2, padre.Nombre1, padre.Nombre2, ipgp.Grupo_familiar_Id_Grupo_Familiar from persona padre inner join insc_persona_grupo_familiar ipgp on padre.Id_Persona = ipgp.Persona_Id_Persona where ipgp.Tipo_Persona_Id_Tipo_Persona = 2) as papas on papas.Grupo_Familiar_Id_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
			left join (select madre.Apellido1, madre.Apellido2, madre.Nombre1, madre.Nombre2, ipgp2.Grupo_familiar_Id_Grupo_Familiar from persona madre inner join insc_persona_grupo_familiar ipgp2 on madre.Id_Persona = ipgp2.Persona_Id_Persona where ipgp2.Tipo_Persona_Id_Tipo_Persona = 12) as mamas on mamas.Grupo_Familiar_Id_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar 
WHERE
	insc_persona_grupo_familiar.Tipo_Persona_Id_Tipo_Persona = 1 and
	Insc_Alum_Curso.SY_Id_SY = 4 and 
	Insc_Alum_Curso.Curso_Id_Curso >= 10101 and 
	Insc_Alum_Curso.Curso_Id_Curso <= 40303
	AND persona.Apellido1 = 'HURTADO'