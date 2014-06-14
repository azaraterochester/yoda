select distinct 
importacion_cartera.valor as valor,
importacion_cartera.concepto as concepto,
importacion_cartera.mensualidad as mensualidad,
importacion_cartera.codigo as codigo,
importacion_cartera.alumno as alumno,
importacion_cartera.numero_mes as numero_mes,
cartera_codigo_mes(importacion_cartera.codigo,importacion_cartera.mensualidad) AS saldo_mes,
calcula_valor_recargo_mensualidades(importacion_cartera.numero_mes) AS factor_recargo,
(cartera_codigo_mes(importacion_cartera.codigo,importacion_cartera.mensualidad) * ( 1 + calcula_valor_recargo_mensualidades(importacion_cartera.numero_mes))) / numerodeconceptosmensuales(importacion_cartera.codigo,importacion_cartera.numero_mes) AS totaldeuda, 
p.Direccion_Residencia, 
p.Telefono,
p.Telefono2,
p.Municipio,
p.Barrio,
p.Departamento, 
ultimo_mes_facturado(),
curso.Curso,
a_getMonth() as get_mes,
proximafechadepago() as fecha_pago
from PERSONA p left join importacion_cartera on p.Codigo = importacion_cartera.codigo 
left join Insc_Alum_Curso on Insc_Alum_Curso.Persona_Id_Persona = p.Id_Persona
left join Curso on Insc_Alum_Curso.Curso_Id_Curso = Curso.Id_Curso
where p.codigo = '11162'  AND Curso.Id_Curso >= 10101 and Curso.Id_Curso <= 40403 AND Insc_Alum_Curso.SY_Id_SY = sy_actual()
ORDER BY importacion_cartera.numero_mes, p.Apellido1, p.Apellido2, p.Nombre1, p.Nombre2 ASC