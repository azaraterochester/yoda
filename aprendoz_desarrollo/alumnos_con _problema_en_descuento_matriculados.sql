select distinct vista_datos_padres.email from 
tabla_descuentos 
inner join PERSONA on persona.Codigo = tabla_descuentos.codigo 
inner join insc_persona_grupo_familiar on persona.Id_Persona = insc_persona_grupo_familiar.Persona_Id_Persona
inner join actualizacion_grupo_familiar on actualizacion_grupo_familiar.grupo_familiar_id_grupo_familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
inner join vista_alumnos_activos on vista_alumnos_activos.Id_Persona = persona.Id_Persona
inner join vista_datos_padres on vista_datos_padres.idpersona = persona.Id_Persona
where actualizacion_grupo_familiar.actualizado = 1 and tabla_descuentos.pordcto BETWEEN 1 and 49
and vista_datos_padres.Tipo_Persona = 'Padre'
group by tabla_descuentos.codigo
order by tabla_descuentos.codigo
