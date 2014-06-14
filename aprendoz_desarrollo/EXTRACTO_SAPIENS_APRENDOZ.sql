SELECT DISTINCT 
	iea.ncodigo,
	DATE_FORMAT(iea.fecha_a,'%d-%m-%Y'),
	iea.dotipo,
	iea.ticon_a,
	iea.nro,
	iea.nconcepto,
	iea.valor,	
	iea.forpago, 
	ieb.dotipo, 
	ieb.ticon_a
FROM importacion_extracto iea INNER JOIN importacion_extracto ieb ON iea.ticon_a = ieb.ticona
where iea.fecha_a >= '2013-08-01'
order by iea.ncodigo, iea.fecha_a, iea.dotipo, iea.nro
