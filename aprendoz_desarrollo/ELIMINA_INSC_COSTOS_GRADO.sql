DELETE FROM insc_alum_costo where (SELECT EXISTS ( select * from costos where costos.id_costo = insc_alum_costo.costo_Id_Costo and costos.SY_Id_SY = 4 and costos.Grado_Id_Grado = 101 ) ) = 1 and insc_alum_costo.SY_Id_SY = 4 AND codigo(insc_alum_costo.Persona_Id_Persona) >= 12000 AND codigo(insc_alum_costo.Persona_Id_Persona) <= 12999