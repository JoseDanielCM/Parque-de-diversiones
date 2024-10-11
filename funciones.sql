-- Calcular el total de visitas a una atracción específica.
DELIMITER //
CREATE FUNCTION totalVisitasAtraccion (idAtraccion int)
RETURNS int
READS SQL DATA
begin
	declare totalVisitas int;
    select count(Visit.VisitId) into totalVisitas
	from Attraction
	join Visit on Visit.AttractionId = Attraction.AttractionId
    where Attraction.AttractionId = idAtraccion
	group by Attraction.AttractionId;
	
	return totalVisitas;
END // 
DELIMITER ;

select totalVisitasAtraccion(5) as TotalVisitas;
-- Calcular el número de días desde el último mantenimiento de una atracción.
DELIMITER //
CREATE FUNCTION numeroDiasMantenimientoAtraccion (idAtraccion int)
RETURNS int
READS SQL DATA
begin
	declare numeroDias int;
    select DATEDIFF(max(Maintenance.MaintenanceDate), curdate()) into totalVisitas
	from Maintenance
	join Visit on Visit.AttractionId = Attraction.AttractionId
    where Attraction.AttractionId = idAtraccion
	group by Attraction.AttractionId;
	
	return totalVisitas;
END // 
DELIMITER ;

select totalVisitasAtraccion(5) as TotalVisitas;
-- Obtener la capacidad total del parque (suma de las capacidades de todas las atracciones).

-- Calcular el ingreso total generado por los tickets vendidos en un evento.

-- Obtener el número total de empleados contratados en un año específico.