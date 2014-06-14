update insc_alum_costo as iac 
set 
iac.valor_final_descuento = (
	select max(educom.tarifa_anticipado) 
	from educom inner join costos on educom.costo_id_costo = costos.id_costo 
	where costos.id_costo = iac.costo_Id_costo
), 
iac.descuento_porcentaje = (

SELECT (1 - (select max(educom.tarifa_anticipado) from educom inner join costos on educom.costo_id_costo = costos.id_costo where costos.id_costo = iac.costo_Id_costo) /
(select max(costos.valor) from costos where costos.id_costo = iac.costo_Id_costo)) * 100

 
 ), 
iac.descuento_valor = (

SELECT 
	(
	select max(costos.valor) from costos where costos.id_costo = iac.costo_Id_costo
	) - 
	(
	select max(educom.tarifa_anticipado) 
	from educom inner join costos on educom.costo_id_costo = costos.id_costo 
	where costos.id_costo = iac.costo_Id_costo
	)

),
fecha_inicio = '2014-02-01', 
fecha_fin = '2014-02-01'
where iac.observacion = 'anticipado';