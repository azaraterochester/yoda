select distinct persona.Nombre1,
" ",
persona.Nombre2,
" ",
persona.Apellido1,
" ",
persona.Apellido2,
persona.Fecha_Nacimiento as fechanacimiento, 
persona2.Nombre1,
" ",
persona2.Nombre2,
" ",
persona2.Apellido1,
" ",
persona2.Apellido2
from persona inner join insc_persona_grupo_familiar on persona.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar 
inner join persona as persona2 on persona2.Grupo_Familiar_ID_Grupo_Familiar = insc_persona_grupo_familiar.Grupo_familiar_Id_Grupo_Familiar
inner join Insc_Alum_Curso on  persona.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona

where persona2.Tipo_Persona_Id_Tipo_Persona = 12
and Insc_Alum_Curso.Curso_Id_Curso between 30301 and 30303
and persona.Activo_Retirado = 1
and persona.matriculado = 1
and Insc_Alum_Curso.SY_Id_SY = 4
order by persona.Nombre1, persona.Nombre2, PERSONA.Apellido1, persona.Apellido2