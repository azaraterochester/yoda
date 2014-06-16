update tabla_descuentos set concepto = '0019' where concepto = '0020';
update tabla_descuentos set nconcepto = 'PENSIÓN - NUEVO' where left(codigo,2) = 12 and nconcepto = 'PENSION ALUM ANTIGUO';
update tabla_descuentos set nconcepto = 'MATRÍCULA - NUEVO', concepto = '0001A' where left(codigo,2) = 12 and nconcepto = 'MATRICULA ALUM ANTIGUOS';
update tabla_descuentos set nconcepto = 'MATRÍCULA - NUEVO', concepto = '0001A' where left(codigo,2) = 12 and concepto = '0001';