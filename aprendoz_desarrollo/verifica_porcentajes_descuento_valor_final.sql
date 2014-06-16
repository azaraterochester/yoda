update insc_alum_costo set 
insc_alum_costo.descuento_valor = (select costos.valor from costos where costos.id_costo = insc_alum_costo.costo_Id_costo) * insc_alum_costo.descuento_porcentaje / 100,
insc_alum_costo.valor_final_descuento = (select costos.valor from costos where costos.id_costo = insc_alum_costo.costo_Id_costo) * (100 - insc_alum_costo.descuento_porcentaje) / 100
where insc_alum_costo.SY_Id_SY = 5