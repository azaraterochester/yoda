UPDATE insc_alum_costo set fecha_inicio = '2013-08-01', fecha_fin = '2013-12-31' where insc_alum_costo.SY_Id_SY = 4 and 
(select costos.anual from costos where costos.id_costo = insc_alum_costo.costo_Id_costo) = 0 
and (select costos.nombre_producto from costos where costos.id_costo = insc_alum_costo.costo_Id_costo) like '%TOEFL%'