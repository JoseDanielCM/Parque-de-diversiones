-- Evento para realizar un chequeo de mantenimiento semanal de una atracción.
-- Evento para actualizar los precios de los tickets VIP en un 5% al inicio de cada mes.
CREATE EVENT actualizarPreciosVIP 
on SCHEDULE EVERY 1 MONTH STARTS now()
do 
	
	UPDATE Ticket set Ticket.Price = Ticket.Price*1.05
    WHERE Ticket.TicketType = "VIP";

select * from Ticket;

-- Evento para eliminar a los visitantes que no han hecho ninguna visita en los últimos 2 años.

CREATE EVENT eliminarVisitantesNoActivos 
on SCHEDULE EVERY 1 MONTH STARTS now()
do 
	DELETE from Visitor where Visitor.VisitorId = Visit.VisitorId and Visit.VisitDate < now() - interval 1 year;

select * from Visit;

-- Evento para enviar un reporte semanal del número de visitantes.

-- Evento para realizar un mantenimiento automático a las atracciones más visitadas cada trimestre.