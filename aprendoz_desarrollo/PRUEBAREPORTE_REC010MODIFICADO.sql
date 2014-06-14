SELECT DISTINCT
     Curso.`Id_Curso` AS Curso_Id_Curso,
     Curso.`Curso` AS Curso_Curso,
     Curso.`Grado_Id_Grado` AS Curso_Grado_Id_Grado,
     PERSONA.`Apellido1` AS PERSONA_Apellido1,
     PERSONA.`Apellido2` AS PERSONA_Apellido2,
     PERSONA.`Nombre1` AS PERSONA_Nombre1,
     PERSONA.`Nombre2` AS PERSONA_Nombre2,
     PERSONA.`Codigo` AS PERSONA_Codigo,
     asignatura.`Asignatura` AS asignatura_Asignatura,
     Grado.`Grado` AS Grado_Grado,
     Nivel.`Id_Nivel` AS Nivel_Id_Nivel,
     Nivel.`Nivel` AS Nivel_Nivel,
     	 calificacion_asignatura_estudiante_NUM_fecha(PERSONA.Id_Persona,asignatura.Id_Asignatura,"2012-12-31")*100 AS Insc_Alum_Asig_Calificacion,
	 calificacion_asignatura_estudiante_CHAR_fecha(PERSONA.Id_Persona,asignatura.Id_Asignatura,"2012-12-31")*100 AS Insc_Alum_Asig_calif_char
FROM
     `Insc_Alum_Curso` Insc_Alum_Curso INNER JOIN `Insc_Alum_Asig` Insc_Alum_Asig ON Insc_Alum_Curso.`Persona_Id_Persona` = Insc_Alum_Asig.`Persona_Id_Persona`
     INNER JOIN `Curso` Curso ON Insc_Alum_Curso.`Curso_Id_Curso` = Curso.`Id_Curso`
     INNER JOIN `PERSONA` PERSONA ON Insc_Alum_Curso.`Persona_Id_Persona` = PERSONA.`Id_Persona`
     INNER JOIN `Periodo` Periodo ON Insc_Alum_Curso.`SY_Id_SY` = Periodo.`SY_Id_SY`
     AND Insc_Alum_Asig.`Periodo_Id_Periodo` = Periodo.`Id_Periodo`
     AND PERSONA.`Id_Persona` = Insc_Alum_Asig.`Persona_Id_Persona`
     INNER JOIN `asignatura` asignatura ON Insc_Alum_Asig.`Asignatura_Id_Asignatura` = asignatura.`Id_Asignatura`
     INNER JOIN `Grado` Grado ON Curso.`Grado_Id_Grado` = Grado.`Id_Grado`
     INNER JOIN `Nivel` Nivel ON Grado.`Nivel_Id_Nivel` = Nivel.`Id_Nivel`
WHERE
  asignatura.SY_Id_SY = 3
     and Curso.Id_Curso >= 10101
     and Curso.Id_Curso <= 40403
     and Curso.Id_Curso = 30203
	AND PERSONA.Id_Persona = 195
     and calificacion_asignatura_estudiante_NUM_fecha(PERSONA.Id_Persona,asignatura.Id_Asignatura,"2012-12-31")*100 >= 72
     and calificacion_asignatura_estudiante_NUM_fecha(PERSONA.Id_Persona,asignatura.Id_Asignatura,"2012-12-31")*100 <= 160
ORDER BY
     Insc_Alum_Curso.Curso_Id_Curso ASC,
     Persona.Apellido1 ASC,
     Persona.Apellido2 ASC,
     Persona.Nombre1 ASC,
     Persona.Nombre2 ASC
