SELECT Grado.Grado, 
	Curso.Curso, 
	PERSONA.Apellido1, 
	PERSONA.Apellido2, 
	PERSONA.Nombre1, 
	PERSONA.Nombre2, 
	PERSONA.Codigo,
	costo_valor_por_persona(PERSONA.Id_Persona,'MATRICULA NUEVO',4) as "Matrícula estudiante Nuevo",
	costo_porcentaje_descuento(PERSONA.Id_Persona,'MATRICULA NUEVO',4) as "% desc. mat.",
	costo_valor_porcentaje_descuento(PERSONA.Id_Persona,'MATRICULA NUEVO',4) as "Valor desc. mat.",
	costo_valor_a_pagar(PERSONA.Id_Persona,'MATRICULA NUEVO',4) as "Valor a pagar mat.",
	costo_valor_por_persona(PERSONA.Id_Persona,'MATRÍCULA',4) as "Matrícula Antiguo",
	costo_porcentaje_descuento(PERSONA.Id_Persona,'MATRÍCULA',4) as "% desc. mat.",
	costo_valor_porcentaje_descuento(PERSONA.Id_Persona,'MATRÍCULA',4) as "Valor desc. mat.",
	costo_valor_a_pagar(PERSONA.Id_Persona,'MATRÍCULA',4) as "Valor a pagar mat.",
	costo_valor_por_persona(PERSONA.Id_Persona,'ALMUERZO',4) as "Almuerzo",
	costo_porcentaje_descuento(PERSONA.Id_Persona,'ALMUERZO',4) as "% desc. Almuerzo",
	costo_valor_porcentaje_descuento(PERSONA.Id_Persona,'ALMUERZO',4) as "Valor desc. Almuerzo",
	costo_valor_a_pagar(PERSONA.Id_Persona,'ALMUERZO',4) as "Valor a pagar Almuerzo",
    costo_valor_por_persona(PERSONA.Id_Persona,'MEDIAS NUEVES',4) as "MEDIAS NUEVES",
	costo_porcentaje_descuento(PERSONA.Id_Persona,'MEDIAS NUEVES',4) as "% desc. medias nueves",
	costo_valor_porcentaje_descuento(PERSONA.Id_Persona,'MEDIAS NUEVES',4) as "Valor desc. medias nueves",
	costo_valor_a_pagar(PERSONA.Id_Persona,'MEDIAS NUEVES',4) as "Valor a pagar medias nueves",
	costo_valor_por_persona(PERSONA.Id_Persona,'TRANSPORTE COMPLETO',4) as "Transporte",
	costo_porcentaje_descuento(PERSONA.Id_Persona,'TRANSPORTE COMPLETO',4) as "% desc. Transporte",
	costo_valor_porcentaje_descuento(PERSONA.Id_Persona,'TRANSPORTE COMPLETO',4) as "Valor desc. Transporte",
	costo_valor_a_pagar(PERSONA.Id_Persona,'TRANSPORTE COMPLETO',4) as "Valor a pagar Transporte",
	costo_valor_por_persona(PERSONA.Id_Persona,'TRANSPORTE MEDIO',4) as "Transporte",
	costo_porcentaje_descuento(PERSONA.Id_Persona,'TRANSPORTE MEDIO',4) as "% desc. Transporte",
	costo_valor_porcentaje_descuento(PERSONA.Id_Persona,'TRANSPORTE MEDIO',4) as "Valor desc. Transporte",
	costo_valor_a_pagar(PERSONA.Id_Persona,'TRANSPORTE MEDIO',4) as "Valor a pagar Transporte",
	costo_valor_por_persona(PERSONA.Id_Persona,'BECA',4) as "Beca Pension",
	costo_valor_a_pagar(PERSONA.Id_Persona,'BECA MATRÍCULA',4) as "Beca Matrícula"
FROM Insc_Alum_Curso INNER JOIN PERSONA ON Insc_Alum_Curso.Persona_Id_Persona = PERSONA.Id_Persona
	 INNER JOIN insc_alum_costo ON PERSONA.Id_Persona = insc_alum_costo.Persona_Id_Persona
	 INNER JOIN Curso ON Curso.Id_Curso = Insc_Alum_Curso.Curso_Id_Curso
	 INNER JOIN Grado ON Grado.Id_Grado = Curso.Grado_Id_Grado
WHERE insc_alum_costo.SY_Id_SY = 4 and
	  Insc_Alum_Curso.SY_Id_SY = 4 and
	  Insc_Alum_Curso.Curso_Id_Curso BETWEEN 10101 and 40403
	  and PERSONA.Activo_Retirado = 1
GROUP BY PERSONA.Id_Persona
ORDER BY Grado.Id_Grado, Curso.Curso, PERSONA.Apellido1, PERSONA.Apellido2