/*UPDATE Promocion p set p.calificacion_char = (select calcula_calif_grado_char(p.Persona_Id_Persona, p.SY_Id_Sy)) where p.SY_Id_SY = 3;*/
/*UPDATE Promocion p set p.calificacion = (select calcula_calif_grado_num(p.Persona_Id_Persona, p.SY_Id_Sy)) where p.SY_Id_SY = 3;*/
/*UPDATE Promocion p set aprobado = (select aprobado(p.Persona_Id_Persona,p.SY_Id_SY)) where p.SY_Id_SY = 3;*/
UPDATE Promocion p set p.promovido = p.aprobado where p.SY_Id_SY;