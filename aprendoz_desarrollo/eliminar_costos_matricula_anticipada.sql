delete
from insc_alum_costo
where insc_alum_costo.SY_Id_SY = 5  
and !EXISTS(select * from insc_alum_curso where Insc_Alum_Curso.SY_Id_SY = 5 and Insc_Alum_Curso.Persona_Id_Persona = insc_alum_costo.Persona_Id_Persona)