SELECT 
	max(costos.valor)
FROM grado_siguiente  INNER JOIN vista_alumnos_activos ON grado_siguiente.Grado_Id_Grado1 = vista_alumnos_activos.Id_Grado
	 INNER JOIN costos ON costos.Grado_Id_Grado = grado_siguiente.Grado_Id_Grado2
	 INNER JOIN Grado ON Grado.Id_Grado = costos.Grado_Id_Grado
WHERE costos.SY_Id_SY = 5 and costos.nuevo = (SELECT es_nuevo(vista_alumnos_activos.Id_Persona)) and costos.valor > 0 and (costos.nombre_producto like '%MATRICULA%') and costos.Grado_Id_Grado = 403 