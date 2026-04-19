USE Destinos_Soñados_SA; # Utilizar Base de Datos Creada

# 1. FN_CalcularPrecioReserva: Calcula el precio total de una reserva según servicios y promociones.

DELIMITER //
CREATE FUNCTION FN_CalcularPrecioReserva(p_id_reserva INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT p.precio_base
    INTO total
    FROM Reserva r
    JOIN Paquete_Turistico p ON r.id_paquete = p.id_paquete
    WHERE r.id_reserva = p_id_reserva;

    RETURN total;
END //
DELIMITER ;

#Ejemplo utilizando el Id #1
SELECT FN_CalcularPrecioReserva (1) AS Calcular_Precio;

#2. FN_VerificarDisponibilidadFecha: Verifica la disponibilidad de un paquete para fechas específicas.

DELIMITER //
CREATE FUNCTION FN_VerificarDisponibilidadFecha(
    p_id_paquete INT,
    p_fecha_inicio DATE,
    p_fecha_fin DATE
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*)
    INTO existe FROM Reserva
    WHERE id_paquete = p_id_paquete
    AND (
        p_fecha_inicio BETWEEN fecha_inicio AND fecha_fin
        OR p_fecha_fin BETWEEN fecha_inicio AND fecha_fin
    );
    IF existe > 0 THEN
        RETURN 'No Disponible, intentelo de nuevo con otro Paquete o Fechas Distintas';
    ELSE
        RETURN 'Claro que si, hay disponibilidad del Paquete en la Fechas Asignadas';
    END IF;
END //
DELIMITER ;

#Ejemplo utilizando el Id #2 y las fechas '2025-05-01', '2025-05-10'
SELECT FN_VerificarDisponibilidadFecha (2, '2025-05-01', '2025-05-10') AS Disponibilidad;

# 3. FN_ObtenerGuiasRecomendados: Sugiere guías óptimos según destino, idioma y evaluaciones.
/* 
   Profe esta consulta no deberia de ser una funcion puesto que solo puedo devolver un valor, en este caso decidi devolver quien tiene mayor recomendacion o Puntaje 
   pero lo ideal seria utilizar un procedimiento almacenado para devolver el puntaje, el Nombre del guia y de mas datos etc etc.
   esta funcion utiliza el id de un paquete y de ahi saca el mejor guia para ese destino
*/
DELIMITER //
CREATE FUNCTION FN_ObtenerGuiasRecomendados(p_id_destino INT)
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE mejor DECIMAL(3,2);

    SELECT MAX(g.evaluacion_desempeno)
    INTO mejor
    FROM Guia_Turistico g
    JOIN Guia_Destino gd ON g.id_guia = gd.id_guia
    WHERE gd.id_destino = p_id_destino;

    RETURN mejor;
END //
DELIMITER ;
#Ejemplo
SELECT FN_ObtenerGuiasRecomendados(2) AS Puntaje_MAX;

# 4. FN_CalcularComisionProveedor: Calcula la comisión correspondiente a un proveedor por servicio.

DELIMITER //
CREATE FUNCTION FN_CalcularComisionProveedor(p_id_alojamiento INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE comision DECIMAL(10,2);

    SELECT comision_acordada
    INTO comision
    FROM Alojamiento
    WHERE id_alojamiento = p_id_alojamiento;

    RETURN comision;
END //
DELIMITER ;
#Ejemplo Utilizando el Id de Alojamiento
SELECT FN_CalcularComisionProveedor(1) AS Comision_Proveedor;


# 5. FN_ObtenerTemporadaFecha: Identifica la temporada correspondiente a una fecha específica.

DELIMITER //
CREATE FUNCTION FN_ObtenerTemporadaFecha(p_fecha DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE mes INT;
    SET mes = MONTH(p_fecha);
    IF mes IN (12,1,2) THEN
        RETURN 'Alta';
    ELSEIF mes IN (6,7,8) THEN
        RETURN 'Media';
    ELSE
        RETURN 'Baja';
    END IF;
END //
DELIMITER ;

SELECT FN_ObtenerTemporadaFecha('2026-10-10') AS Temporada_Fecha;