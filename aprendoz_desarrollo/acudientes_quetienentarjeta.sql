SELECT acudiente.Apellido1, 
	acudiente.Apellido2, 
	acudiente.Nombre1, 
	acudiente.Nombre2,
FROM PERSONA as acudiente 
inner join PERSONA as estudiante 
on acudiente.Grupo_Familiar_Id_Grupo_Familiar = estudiante.Grupo_Familiar_Id_Grupo_Familiar
WHERE 
acudiente.Tipo_Persona_Id_Tipo_Persona = 3 AND
estudiante.Tipo_Persona_Id_Tipo_Persona = 1
