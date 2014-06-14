DELETE c1 FROM insc_alum_costo c1, insc_alum_costo c2 
WHERE c1.Id_Insc_Alum_Costo > c2.Id_Insc_Alum_Costo 
 AND c1.Persona_Id_Persona = c2.Persona_Id_Persona 
 AND c1.costo_Id_costo = c2.costo_Id_costo
and c1.SY_Id_SY = c2.SY_Id_SY
and c1.fecha_inicio = c2.fecha_inicio