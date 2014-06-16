select c1.Curso, c2.Curso, persona.Codigo, persona.Id_Persona, persona.Apellido1, persona.Apellido2, persona.Nombre1, persona.Nombre2 from 
Insc_Alum_Curso iac1 inner join Insc_Alum_Curso iac2 on iac1.Persona_Id_Persona = iac2.Persona_Id_Persona
inner join curso c1 on c1.Id_Curso = iac1.Curso_Id_Curso
inner join curso c2 on c2.Id_Curso = iac2.Curso_Id_Curso
inner join PERSONA on iac1.Persona_Id_Persona = PERSONA.Id_Persona
where iac1.SY_Id_SY = 4 and
iac2.SY_Id_SY = 5 and 
(select grado1.Id_Grado from grado grado1 inner join Curso on curso.Grado_Id_Grado = grado1.Id_Grado where iac1.Curso_Id_Curso = Curso.Id_Curso) = 
(select grado2.Id_Grado from grado grado2 inner join Curso on curso.Grado_Id_Grado = grado2.Id_Grado where iac2.Curso_Id_Curso = Curso.Id_Curso)