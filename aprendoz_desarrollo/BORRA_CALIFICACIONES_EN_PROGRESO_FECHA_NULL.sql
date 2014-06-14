delete from calificacion_final 
where (select exists ( 
	select * from Aprendizaje where Aprendizaje.Fecha_Esperada >= CURDATE() 
	and Aprendizaje.Id_Aprendizaje = calificacion_final.Aprendizaje_Id_Aprendizaje )) = 1 
and calificacion_final.fecha_logro is null