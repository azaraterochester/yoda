update Insc_Alum_Asig set Insc_Alum_Asig.esperados = esperados(Insc_Alum_Asig.Asignatura_Id_Asignatura), Insc_Alum_Asig.logrados = logradosf(Insc_Alum_Asig.Persona_Id_Persona,Insc_Alum_Asig.Asignatura_Id_Asignatura)
where
Insc_Alum_Asig.Persona_Id_Persona = 235 and
Insc_Alum_Asig.Asignatura_Id_Asignatura = 240314
;
update Insc_Alum_Asig set Insc_Alum_Asig.Porcentaje = (logradosf(Insc_Alum_Asig.Persona_Id_Persona,Insc_Alum_Asig.Asignatura_Id_Asignatura)/esperados(Insc_Alum_Asig.Asignatura_Id_Asignatura)) * 100
where
Insc_Alum_Asig.Persona_Id_Persona = 235 and
Insc_Alum_Asig.Asignatura_Id_Asignatura = 240314
;