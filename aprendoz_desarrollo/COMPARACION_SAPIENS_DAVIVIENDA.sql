SELECT reporte_davivienda.id_reporte_sapiens_davivienda, 
	reporte_davivienda.tarjetadav, 
	reporte_davivienda.numidres, 
	reporte_davivienda.valor, 
	reporte_davivienda.nombres, 
	reporte_davivienda.nit, 
	reporte_davivienda.nnombre, 
	reporte_davivienda.cursoact, 
	importacion_davivienda.`id_importacion-davivienda`, 
	importacion_davivienda.tarjeta, 
	importacion_davivienda.numeroidentificacion, 
	importacion_davivienda.nombresocio
FROM reporte_davivienda LEFT OUTER JOIN importacion_davivienda ON reporte_davivienda.tarjetadav = importacion_davivienda.tarjeta