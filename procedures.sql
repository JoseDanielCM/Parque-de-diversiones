set SQL_SAFE_UPDATES =0;
-- Agregar un nuevo visitante.
DELIMITER //
CREATE PROCEDURE AgregarVisitante(in FirstName varchar(40), in LastName varchar(40), in BirthDate DATETIME, in Email varchar(60), in Phone varchar(24), in Address varchar(70), in City varchar(40), in State varchar(40), in Country varchar(40), in PostalCode varchar(10))
BEGIN
	declare idUltimoVisitante int;
    select max(VisitorId) into idUltimoVisitante from Visitor;
	INSERT INTO `Visitor` (`VisitorId`, `FirstName`, `LastName`, `BirthDate`, `Email`, `Phone`, `Address`, `City`, `State`, `Country`, `PostalCode`) VALUE
    (idUltimoVisitante+1,FirstName,LastName,BirthDate,Email,Phone,Address,City,State,Country,PostalCode);
    
END //
DELIMITER ;
call AgregarVisitante('Carlos', 'Pérez', '1985-07-12', 'carlos.perez@example.com', '123456789', 'Calle 123', 'Bogotá', 'Cundinamarca', 'Colombia', '110111');
select * from Visitor;

-- Registrar un nuevo mantenimiento para una atracción. ------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE nuevoMantenimientoAtraccion(IN AttractionId INT,IN EmployeeId INT,IN MaintenanceDate DATETIME,IN Details VARCHAR(500))
BEGIN
	declare idUltimoMantenimiento int;
    select max(MaintenanceId) into idUltimoMantenimiento from Maintenance;

	INSERT INTO Maintenance (MaintenanceId,AttractionId,EmployeeId,MaintenanceDate,Details) value
        (idUltimoMantenimiento+1,AttractionId,EmployeeId,MaintenanceDate,Details);
    
END //
DELIMITER ;
call nuevoMantenimientoAtraccion(1,1,"2024-10-11 16:14:00","memueroo");
select * from Maintenance;
-- Actualizar el precio de los tickets de un tipo específico. -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE actualizarPrecioTicket(IN tipo varchar(40),IN precio DECIMAL(10,2))

BEGIN
    update Ticket set Ticket.Price = precio WHERE Ticket.TicketType = tipo;
    
END //
DELIMITER ;
call actualizarPrecioTicket("vIp",150.00);
select * from Ticket;
-- Eliminar un visitante por su ID.

-- Registrar una nueva visita de un visitante a una atracción.