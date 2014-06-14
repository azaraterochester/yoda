SELECT DISTINCT Curso.Curso,
	alum.Codigo as codigo,
	alum.Apellido1,
	alum.Apellido2,
	alum.Nombre1,
	alum.Nombre2,
	padre.Apellido2,
	padre.Nombre1,
	padre.Nombre2,
	padre.email AS emailPadre,
	padre.Telefono AS TEL1,
	padre.Telefono2 AS TEL2,
	padre.Telefono_Oficina AS TELOFI,
	padre.Celular AS CELU,
	padre.Direccion_Residencia,
	Tipo_Persona_A.Tipo_Persona AS Tipo_Persona_Tipo_Persona, 
	 INNER JOIN Tipo_Persona Tipo_Persona_A ON alum.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_A.Id_Tipo_Persona
	 INNER JOIN Tipo_Persona Tipo_Persona_B ON padre.Tipo_Persona_Id_Tipo_Persona = Tipo_Persona_B.Id_Tipo_Persona
 AND Curso.Id_Curso <= 40403
 AND alum.Activo_Retirado = 1