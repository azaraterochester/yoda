SELECT Subarea.Subarea, grado.Grado, eje.Eje_Tematico,
COUNT(Aprendizaje.Id_Aprendizaje)/a_aprendizajes_subarea_grado(subarea.Id_Subarea,grado.Id_Grado,Asignatura.SY_Id_SY)* 100 as porcentajegrado, 
COUNT(Aprendizaje.Id_Aprendizaje)/a_aprendizajes_total_subarea(subarea.Id_Subarea,Asignatura.SY_Id_SY)* 100 as porcentajetotal
from asignatura inner join unidad on asignatura.Id_Asignatura = unidad.Asignatura_Id_Asignatura
inner join subtopico on subtopico.Unidad_Id_Unidad = unidad.Id_Unidad
inner join Aprendizaje on aprendizaje.Subtopico_Id_Subtopico = subtopico.Id_Subtopico
inner join eje on eje.Id_Eje = aprendizaje.Eje_Id_Eje
inner join Subarea on eje.Subarea_Id_Subarea = Subarea.Id_Subarea
inner join grado on grado.Id_Grado = asignatura.Grado_Id_Grado
where asignatura.SY_Id_SY = 4
group BY Subarea.Id_Subarea, grado.Id_Grado, eje.Id_Eje
ORDER BY Subarea.Id_Subarea, grado.Id_Grado, eje.Id_Eje


