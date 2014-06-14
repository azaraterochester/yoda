UPDATE asignatura asignaturabase set 
asignaturabase.descrip_asig_espaniol = descripcion_asignatura_pornombre(asignaturabase.Asignatura),
asignaturabase.descrip_asig_ingles = descripcion_asignatura_ingles_pornombre(asignaturabase.Asignatura)
where asignaturabase.SY_Id_SY = 3 and
asignaturabase.Grado_Id_Grado = 404 