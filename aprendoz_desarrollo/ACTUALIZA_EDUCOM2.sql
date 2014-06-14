update insc_alum_costo as iac 
set iac.valor_final_descuento = (iac.valor_final_descuento / 2), fecha_inicio = '2014-02-01', fecha_fin = '2014-03-31'
where iac.observacion = 'mensual' and (select educom.comentario from educom where educom.costo_id_costo = iac.costo_Id_costo) = 'BIMESTRE';