update Insc_Alum_Asig set Insc_Alum_Asig.esperados = esperados_fecha_estudiante_asignatura(Insc_Alum_Asig.Persona_Id_Persona,'2014-06-05',Insc_Alum_Asig.Asignatura_Id_Asignatura) where Insc_Alum_Asig.Periodo_Id_Periodo = 10