/*delete from insc_alum_costo where insc_alum_costo.observacion = 'mensual' and insc_alum_costo.valor_final_descuento = 0;*/
update insc_alum_costo set fecha_inicio = '2014-02-01', fecha_fin = '2014-03-31' where fecha_inicio = '2014-02-03' and observacion = 'mensual';
/*delete from insc_alum_costo where insc_alum_costo.observacion = 'mensual' and insc_alum_costo.descuento_valor > 0;*/