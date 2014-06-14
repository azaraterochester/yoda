SELECT grado.Id_Grado, grado.Grado, Subarea.Subarea, eje.Eje_Tematico,
COUNT(Aprendizaje.Id_Aprendizaje) as conteo,
a_aprendizajes_total_eje_grado(eje.Id_Eje,Asignatura.Grado_Id_Grado,Asignatura.SY_Id_SY) as porcentajetotal
from asignatura inner join unidad on asignatura.Id_Asignatura = unidad.Asignatura_Id_Asignatura
inner join subtopico on subtopico.Unidad_Id_Unidad = unidad.Id_Unidad
inner join Aprendizaje on aprendizaje.Subtopico_Id_Subtopico = subtopico.Id_Subtopico
inner join eje on (eje.Id_Eje = aprendizaje.Eje_Id_Eje or eje.Id_Eje = aprendizaje.Eje2_Id_Eje or eje.Id_Eje = aprendizaje.Eje3_Id_Eje)
inner join Subarea on eje.Subarea_Id_Subarea = Subarea.Id_Subarea
inner join grado on grado.Id_Grado = asignatura.Grado_Id_Grado
where asignatura.SY_Id_SY = 4
group by grado.Id_Grado
ORDER BY grado.Id_Grado