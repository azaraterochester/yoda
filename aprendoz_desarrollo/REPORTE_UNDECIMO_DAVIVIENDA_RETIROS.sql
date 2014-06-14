SELECT PERSONA.Codigo, factura_por_davivienda(PERSONA.Codigo), tiene_hermanos_activos(PERSONA.Id_Persona,4) 
from 
PERSONA 
INNER JOIN Insc_Alum_Curso on PERSONA.Id_Persona = Insc_Alum_Curso.Persona_Id_Persona
WHERE
Insc_Alum_Curso.SY_Id_SY = 3
and Insc_Alum_Curso.Curso_Id_Curso between 40401 and 40403
/*and PERSONA.Activo_Retirado = 1*
/*AND PERSONA.matriculado = 1*/


