-- PROYECTO 4: SQL - Consultas sobre Base de Datos de Reservas Aéreas

-------------------------------------------------------------------------------
-- 1. Recuperar los Vuelos (flights) y su identificador con status 'On Time'.
-------------------------------------------------------------------------------
SELECT 
    flight_id, 
    flight_no, 
    status 
FROM flights 
WHERE status = 'On Time';


-------------------------------------------------------------------------------
-- 2. Reservas (bookings) con una cantidad total mayor a 1.000.000 de rublos.
-- Se extraen todas las columnas (*) según lo solicitado.
-------------------------------------------------------------------------------
SELECT * FROM bookings 
WHERE total_amount > 1000000;


-------------------------------------------------------------------------------
-- 3. Extraer todas las columnas de los modelos de aviones disponibles.
-- Nota: Se utiliza 'aircrafts_data' (nombre estándar en la BD demo).
-------------------------------------------------------------------------------
SELECT * FROM aircrafts_data;


-------------------------------------------------------------------------------
-- 4. Identificadores de vuelo que han volado con un Boeing 737 (Código = 733).
-------------------------------------------------------------------------------
SELECT 
    flight_id, 
    flight_no, 
    aircraft_code 
FROM flights 
WHERE aircraft_code = '733';


-------------------------------------------------------------------------------
-- 5. Información detallada de los tickets de pasajeros llamados 'Irina'.
-- Nota: Usamos UPPER o el nombre en mayúsculas ya que los datos suelen estar así.
-------------------------------------------------------------------------------
SELECT * FROM tickets 
WHERE passenger_name LIKE 'IRINA%';


-------------------------------------------------------------------------------
-- EJERCICIOS OPCIONALES (PRÁCTICA ADICIONAL)
-------------------------------------------------------------------------------

-- 6. Ciudades con más de un aeropuerto.
-- Filtramos usando HAVING tras agrupar por la ciudad.
SELECT 
    city, 
    COUNT(*) AS total_aeropuertos
FROM airports_data
GROUP BY city
HAVING COUNT(*) > 1;


-- 7. Número de vuelos por modelo de avión.
SELECT 
    aircraft_code, 
    COUNT(*) AS numero_de_vuelos
FROM flights
GROUP BY aircraft_code;


-- 8. Reservas con más de un billete (varios pasajeros por reserva).
-- Agrupamos por la referencia de reserva en la tabla de tickets.
SELECT 
    book_ref, 
    COUNT(*) AS tickets_por_reserva
FROM tickets
GROUP BY book_ref
HAVING COUNT(*) > 1;


-- 9. Vuelos con retraso de salida superior a una hora.
-- La diferencia entre 'actual_departure' y 'scheduled_departure' debe ser > 1 hora.
SELECT 
    flight_id, 
    flight_no, 
    scheduled_departure, 
    actual_departure,
    (actual_departure - scheduled_departure) AS retraso_total
FROM flights
WHERE (actual_departure - scheduled_departure) > INTERVAL '1 hour';