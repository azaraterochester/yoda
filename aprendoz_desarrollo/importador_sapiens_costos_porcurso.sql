SELECT PERSONA.Codigo AS codalumno, 
	costos.codigo AS concep, 
	costos.nombre_producto AS nconcep, 
	costos.valor, 
	insc_alum_costo.descuento_porcentaje AS pordcto, 
	insc_alum_costo.descuento_valor AS valdcto, 
	insc_alum_costo.valor_final_descuento AS valorf, 
	DATE_FORMAT(insc_alum_costo.fecha_inicio,'%d/%m/%Y') AS fechaini, 
	DATE_FORMAT(insc_alum_costo.fecha_fin,'%d/%m/%Y') AS fechafin, 
	insc_alum_costo.observacion, 
	Curso.Curso
FROM PERSONA 
	 INNER JOIN Insc_Alum_Curso ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN insc_alum_costo ON Insc_Alum_Curso.Persona_Id_Persona = insc_alum_costo.Persona_Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN Curso ON Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
WHERE costos.codigo <> 9999 and 
costos.codigo <> 10001 and 
costos.codigo <> 10002 and 
insc_alum_costo.inscrito = 1 AND
costos.anual = 0 AND
Insc_Alum_Curso.SY_Id_SY = 3 AND
Curso.Id_Curso >= 10101 and
Curso.Id_Curso <= 40403
ORDER BY
Curso.Id_Curso, PERSONA.Apellido1, PERSONA.Apellido2, PERSONA.Nombre1, PERSONA.Nombre2