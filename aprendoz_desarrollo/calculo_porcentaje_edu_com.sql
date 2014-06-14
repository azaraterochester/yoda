SELECT (1 - (select max(educom.tarifa_anticipado) from educom inner join costos on educom.costo_id_costo = costos.id_costo where costos.id_costo = 2057) /
(select max(costos.valor) from costos where costos.id_costo = 2057)) * 100
