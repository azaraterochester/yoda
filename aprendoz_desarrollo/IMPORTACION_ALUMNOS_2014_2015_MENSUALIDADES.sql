select 
vista_alumnos_activos.Grado, 
vista_alumnos_activos.Curso, 
vista_alumnos_activos.Apellido1, 
vista_alumnos_activos.Apellido2,
consulta.*
from vista_alumnos_activos left join (

SELECT DISTINCT PERSONA.Codigo as codalumno, 
	costos.codigo as concep, 
	costos.nombre_producto as nconcep, 
	costos.valor as valor, 
	insc_alum_costo.descuento_porcentaje as pordcto, 
	insc_alum_costo.descuento_valor as valdcto, 
	insc_alum_costo.valor_final_descuento as valorf, 
	'01/08/2013' as fechaini,
	'31/05/2014'as fechafin,
	insc_alum_costo.observacion
FROM insc_alum_costo INNER JOIN PERSONA ON insc_alum_costo.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN costos ON costos.id_costo = insc_alum_costo.costo_Id_costo
	 INNER JOIN matricula on matricula.Persona_Id_Persona = insc_alum_costo.Persona_Id_Persona
WHERE
	insc_alum_costo.inscrito = 1
and costos.anual = 0
and insc_alum_costo.SY_Id_SY = 5
and costos.nombre_producto NOT LIKE '%BECA%'
and costos.nombre_producto NOT LIKE '%MENSAJES SMS%'
ORDER BY persona.Codigo


) as consulta on consulta.codalumno = vista_alumnos_activos.Codigo
order by vista_alumnos_activos.Id_Curso, vista_alumnos_activos.Apellido1, vista_alumnos_activos.Apellido2, vista_alumnos_activos.Codigo