/*UPDATE Insc_Alum_Curso iac set iac.calif_char = (select calcula_calif_grado_char(iac.Persona_Id_Persona, iac.SY_Id_Sy)) where iac.SY_Id_SY = 3;*/
UPDATE Insc_Alum_Curso iac set iac.Calificacion = (select calcula_calif_grado_num(iac.Persona_Id_Persona, iac.SY_Id_Sy)) where iac.SY_Id_SY = 3;