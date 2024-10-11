-- Obtener todas las atracciones operativas.

select * from Attraction
where Status = "Operativa";

-- Listar todos los visitantes que se encuentran en la base de datos.

select * from Visitor;

-- Mostrar los eventos programados junto con su precio.

select Event.Name, Event.Price FROM Event;

-- Obtener el nombre y fecha de contratación de todos los empleados.

select concat(Employee.FirstName, " ",Employee.LastName) as NombreCompleto, Employee.HireDate from Employee;

-- Listar todos los boletos vendidos y su tipo.

select * from Ticket;

-- Obtener el nombre de los visitantes y las atracciones que visitaron.

select concat(Visitor.FirstName, " ",Visitor.LastName) as NombreVisitante, Attraction.Name as NombreAtraccion
from Visitor
join Visit on Visit.VisitorId = Visitor.VisitorId
join Attraction on Attraction.AttractionId = Visit.AttractionId;

-- Listar los empleados que participaron en eventos, junto con el nombre del evento.

select concat(Employee.FirstName, " ",Employee.LastName) as NombreCompleto, Event.Name
from Employee
join EmployeeEvent on EmployeeEvent.EmployeeId = Employee.EmployeeId
join Event on Event.EventId = EmployeeEvent.EventId
;

-- Mostrar los detalles de mantenimiento realizados por cada empleado, junto con la atracción.

select concat(Employee.FirstName, " ",Employee.LastName) as NombreCompleto, Maintenance.Details as DetallesMantenimiento, Attraction.Name
from Employee
join Maintenance on Maintenance.EmployeeId = Employee.EmployeeId
join Attraction on Attraction.AttractionId = Maintenance.AttractionId
;

-- Obtener el nombre del visitante y la atracción que calificó junto con la puntuación.

select concat(Visitor.FirstName, " ",Visitor.LastName) as NombreVisitante, Attraction.Name as NombreAtraccion, Visit.Rating as Calificacion
from Visitor
join Visit on Visit.VisitorId = Visitor.VisitorId
join Attraction on Attraction.AttractionId = Visit.AttractionId;

-- Listar los visitantes que asistieron a eventos, con el nombre del evento.

select concat(Visitor.FirstName, " ",Visitor.LastName) as NombreVisitante, Event.Name as nombreEvento
from Visitor
join VisitorEvent on VisitorEvent.VisitorId = Visitor.VisitorId
join Event on Event.EventId = VisitorEvent.EventId;

-- Contar cuántas visitas ha tenido cada atracción.

select Attraction.Name, count(Visit.VisitId) as CantidadVisitas
from Attraction
join Visit on Visit.AttractionId = Attraction.AttractionId
group by Attraction.AttractionId
;
-- Obtener el precio promedio de los tickets vendidos por tipo.
select Ticket.TicketType, avg(Ticket.Price)
from Ticket
group by TicketType;
-- Contar cuántos empleados hay en cada ciudad.

-- Listar el total de visitantes por país.

-- Obtener el número total de eventos y su precio promedio.

-- Obtener el nombre de las atracciones que tienen una capacidad máxima mayor que el promedio.

-- Listar los empleados que han trabajado en más de un evento.

-- Obtener las atracciones que no han sido visitadas en la última semana.

-- Listar los visitantes que compraron un boleto VIP.

-- 20. **Mostrar los empleados cuyo salario (de la tabla `EmployeeSalary`) es mayor al salario promedio.**

-- Actualizar el estado de una atracción a 'En Mantenimiento'.

-- Eliminar visitantes que no han realizado ninguna visita.

-- Insertar un nuevo evento en la base de datos.

-- Aumentar el precio de los tickets VIP en un 10%.

-- Cambiar la ciudad de todos los empleados en Bogotá a Medellín.

