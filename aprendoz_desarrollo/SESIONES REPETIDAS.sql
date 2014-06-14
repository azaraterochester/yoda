DELETE s1 FROM sesion s1, sesion s2 
where 
s1.id_sesion > s2.id_sesion and
s1.fecha = s2.fecha and
s1.asignatura_Id_Asignatura = s2.asignatura_Id_Asignatura and
s1.Curso_Id_Curso = s2.Curso_Id_Curso

