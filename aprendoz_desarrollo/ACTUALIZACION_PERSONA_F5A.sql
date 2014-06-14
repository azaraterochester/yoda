/*UPDATE PERSONA p set p.Fecha_Nacimiento = (SELECT MAX(f.fechanacimiento) from formulario5a f where f.codigo = p.Codigo) WHERE p.Codigo is not null and (esta_enf5a(p.Codigo));*/
/*UPDATE PERSONA p set p.Tipo_Documento = (SELECT MAX(f.tipodocumento) from formulario5a f where f.codigo = p.Codigo) WHERE p.Codigo is not null and (esta_enf5a(p.Codigo));*/
/*UPDATE PERSONA p set p.No_Documento = (SELECT MAX(f.numerodoc) from formulario5a f where f.codigo = p.Codigo) WHERE p.Codigo is not null and (esta_enf5a(p.Codigo));*/
/*UPDATE PERSONA p set p.Lugar_Nacimiento_Municipio = (SELECT MAX(f.ciudadnacimiento) from formulario5a f where f.codigo = p.Codigo) WHERE p.Codigo is not null and (esta_enf5a(p.Codigo));*/
/*UPDATE PERSONA p set p.Lugar_Nacimiento_Municipio = "BOGOTÁ D.C." where p.Lugar_Nacimiento_Municipio = "BOGOTÁ"*/
/*UPDATE PERSONA p set p.Lugar_Nacimiento_Departamento = (SELECT MAX(f.departamentonacimiento) from formulario5a f where f.codigo = p.Codigo) WHERE p.Codigo is not null and (esta_enf5a(p.Codigo));*/
/*UPDATE PERSONA p set p.Lugar_Nacimiento_Departamento = "BOGOTÁ D.C." where p.Lugar_Nacimiento_Departamento = "D.C."*/
