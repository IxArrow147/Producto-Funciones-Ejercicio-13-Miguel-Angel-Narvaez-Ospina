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

#Triggers

/* 
  Practicamente todos los ejercicios estan relacionados con la tabla reserva , por eso los ejemplos son practicamente iguales un insert para la tabla reserva
*/

# 1.	TR_ActualizarDisponibilidadPaquete: Actualiza la disponibilidad de un paquete tras una reserva.

#En el ejercicio original no existe, el dato capacidad maxima o cupos disponibles entonces creamos un alter para esta ocasion

ALTER TABLE Paquete_Turistico 
ADD cupos_disponibles INT DEFAULT 50;

DELIMITER //
CREATE TRIGGER TR_ActualizarDisponibilidadPaquete
AFTER INSERT ON Reserva
FOR EACH ROW
BEGIN
    UPDATE Paquete_Turistico
    SET cupos_disponibles = cupos_disponibles - 
        (NEW.cantidad_adultos + NEW.cantidad_ninos)
    WHERE id_paquete = NEW.id_paquete;
END //
DELIMITER ;

#pequena prueba de un insert
INSERT INTO Reserva (
numero_reserva, fecha_creacion, fecha_inicio, fecha_fin,
cantidad_adultos, cantidad_ninos,
precio_total, abonos_realizados,
estado, id_cliente, id_metodo_pago,
id_paquete, id_guia
)
VALUES ('RES100', NOW(), '2026-07-01', '2026-07-05',2, 1,0, 0,'Pendiente', 1, 1,1, 1);

#Verificamos
SELECT id_paquete, cupos_disponibles
FROM Paquete_Turistico
WHERE id_paquete = 1;


# 2.	TR_CalcularCostoPaquete: Calcula automáticamente el costo de un paquete según servicios incluidos.

DELIMITER //
CREATE TRIGGER TR_CalcularCostoPaquete
BEFORE INSERT ON Reserva
FOR EACH ROW
BEGIN
    DECLARE costo_base DECIMAL(10,2);
    DECLARE costo_actividad DECIMAL(10,2);

    SELECT precio_base INTO costo_base
    FROM Paquete_Turistico
    WHERE id_paquete = NEW.id_paquete;

    SELECT a.precio_por_persona
    INTO costo_actividad
    FROM Paquete_Actividad_Incluida pai
    JOIN Actividad_Turistica a 
        ON pai.id_actividad = a.id_actividad
    WHERE pai.id_paquete = NEW.id_paquete
    LIMIT 1;

    SET NEW.precio_total = 
        (costo_base + IFNULL(costo_actividad,0)) *
        (NEW.cantidad_adultos + NEW.cantidad_ninos);

END //
DELIMITER ;

#Para probar hay que hacer un insert prueba 
INSERT INTO Reserva (
numero_reserva, fecha_creacion, fecha_inicio, fecha_fin,
cantidad_adultos, cantidad_ninos,
precio_total, abonos_realizados,
estado, id_cliente, id_metodo_pago,
id_paquete, id_guia
)
VALUES ('TEST_COSTO', NOW(), '2026-06-10', '2026-06-15',2, 1,0, 0,'Pendiente', 
1, -- id_cliente
1, -- id_metodo_pago
1, -- id_paquete
1 -- id_guia
);
#un pequeno select para verificar
SELECT numero_reserva, precio_total
FROM Reserva
WHERE numero_reserva = 'TEST_COSTO';

# 3.	TR_VerificarCapacidadActividad: Verifica que no se exceda la capacidad de una actividad turística.
#Con el primer alter de capacidad podemos hacer este ejercicio 
DELIMITER //
CREATE TRIGGER TR_VerificarCapacidadActividad
BEFORE INSERT ON Reserva
FOR EACH ROW
BEGIN
    DECLARE capacidad INT;
    DECLARE total_personas INT;

    SET total_personas = NEW.cantidad_adultos + NEW.cantidad_ninos;

    SELECT a.capacidad_maxima
    INTO capacidad
    FROM Paquete_Actividad_Incluida pai
    JOIN Actividad_Turistica a 
        ON pai.id_actividad = a.id_actividad
    WHERE pai.id_paquete = NEW.id_paquete
    LIMIT 1;
	
    IF total_personas > capacidad THEN -- Mensaje de Error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Capacidad excedida';
    END IF;

END //
DELIMITER ;
# un insert trampa que supera la capacidad maxima debe de dar error, igual pongo donde se puede modicar si queres hacer un insert normal, la capacidad maxima o cupos esta establecido en un max de 50
INSERT INTO Reserva (
numero_reserva, fecha_creacion, fecha_inicio, fecha_fin,
cantidad_adultos, cantidad_ninos,
precio_total, abonos_realizados,
estado, id_cliente, id_metodo_pago,
id_paquete, id_guia
)
VALUES (
'TEST_CAP', NOW(), '2026-06-10', '2026-06-15',
100 -- esto son 100 adultos deberia de no entrar este insert y dar error, la capacidad maxima es 50
, 0 -- Cantidad de ninos, este valor y el anterior se suman y lo asignan a una variable que se llama total_personas y esta la compara con el valor de la tabla capacidad que son 50
,0, 0,'Pendiente', 
1, -- id_cliente
1, -- id_metodo_pago
1, -- id_paquete
1 -- id_guia
);
# Aqui no deberia de aparecer nada puesto que dio error el anterior insert, pero si entra queda registrada la reserva
SELECT * FROM Reserva WHERE numero_reserva = 'TEST_CAP';

# 4.	TR_ActualizarEstadisticasDestino: Actualiza estadísticas de popularidad de destinos tras reservas.

DELIMITER //
CREATE TRIGGER TR_ActualizarEstadisticasDestino
AFTER INSERT ON Reserva
FOR EACH ROW
BEGIN
    UPDATE Destino_Turistico d
    JOIN Actividad_Turistica a 
        ON d.id_destino = a.id_destino
    JOIN Paquete_Actividad_Incluida pai 
        ON a.id_actividad = pai.id_actividad
    SET d.nivel_popularidad = IFNULL(d.nivel_popularidad,0) + 1
    WHERE pai.id_paquete = NEW.id_paquete;
END //
DELIMITER ;
#El nivel de popularidad es incremental a medida de que hayan mas reservas dependiendo del id del paquete seleccionado 
#Mismo insert de siempre para testear
INSERT INTO Reserva (
numero_reserva, fecha_creacion, fecha_inicio, fecha_fin,
cantidad_adultos, cantidad_ninos,
precio_total, abonos_realizados,
estado, id_cliente, id_metodo_pago,
id_paquete, id_guia
)
VALUES (
'TEST_POP', NOW(), '2026-06-10', '2026-06-15',2, 0,0, 0,'Pendiente', 
1, -- id_cliente
1, -- id_metodo_pago
1, -- id_paquete
1 -- id_guia
);
#Para probar puede testar con otro id para ver las demas paquetes
SELECT nivel_popularidad
FROM Destino_Turistico
WHERE id_destino = 1;