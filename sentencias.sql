-- Sentencia 1
select colision_vehiculos.vehicle_id, count(colision_vehiculos.collision_id) as NumeroAccidentes
from colision_vehiculos
group by vehicle_id
having count(colision_vehiculos.collision_id) > 1
order by NumeroAccidentes desc ;

-- Sentencia 2
select *
from vehiculos
where vehicle_year <= 1989
order by vehicle_year desc;

-- Sentencia 3
select vehicle_make, count(vehicle_make) as CantidadPorMarca
from vehiculos
group by vehicle_make
order by CantidadPorMarca desc
limit 5;

-- Sentencia 4
select count(colision_persona.collision_id) as NumeroAccidentes, colision_persona.person_id
from colision_persona
group by person_id
having count(colision_persona.collision_id) > 1
order by NumeroAccidentes desc;

-- Sentencia 5
select position_in_vehicle, person_id, person_age
from colision_persona
where position_in_vehicle in ('Driver') and (person_age > 65 or person_age < 26)
order by person_age desc;

-- Sentencia 6
select distinct persona.*, vehiculos.vehicle_type
from persona, vehiculos
where vehiculos.vehicle_type = 'Pick-up';

-- Sentencia 7
select v1.vehicle_make as Marca, v2.NumeroAccidentes
from vehiculos as v1
    inner join (select count(collision_id) as NumeroAccidentes, vehicle_id as VehicleID
                from colision_vehiculos
                group by vehicle_id
                order by NumeroAccidentes asc
                limit 3) as v2
    on v1.vehicle_id = v2.VehicleID;

select v1.vehicle_make as Marca, v2.NumeroAccidentes
from vehiculos as v1
    inner join (select count(collision_id) as NumeroAccidentes, vehicle_id as VehicleID
                from colision_vehiculos
                inner join vehiculos on vehiculos.vehicle_id = colision_vehiculos.vehicle_id
                group by vehicle_id
                order by NumeroAccidentes asc
                limit 3) as v2
    on v1.vehicle_id = v2.VehicleID;

--(No va)
select v1.vehicle_type as TipoVehiculo, v2.NumeroAccidentes
from vehiculos as v1
    inner join (select count(collision_id) as NumeroAccidentes, colision_vehiculos.vehicle_id
                from colision_vehiculos
                inner join vehiculos on vehiculos.vehicle_id = colision_vehiculos.vehicle_id
                group by vehiculos.vehicle_type, colision_vehiculos.vehicle_id
                order by NumeroAccidentes asc
                limit 3) as v2
    on v1.vehicle_id = v2.vehicle_id;

-- Sentencia 8 (No compila)
SELECT
    v.vehicle_make AS Marca,
    COUNT(DISTINCT cv.collision_id) AS NumeroAccidentes
FROM
    vehiculos v
INNER JOIN
    colision_vehiculos cv
ON
    v.vehicle_id = cv.vehicle_id
GROUP BY
    v.vehicle_make
ORDER BY
    NumeroAccidentes ASC;


SELECT
    v.vehicle_make AS Marca,
    COUNT(cv.collision_id) AS NumeroAccidentes
FROM
    vehiculos v
INNER JOIN
    colision_vehiculos cv
ON
    v.vehicle_id = cv.vehicle_id
WHERE
    v.vehicle_make IS NOT NULL
GROUP BY
    v.vehicle_make
ORDER BY
    NumeroAccidentes ASC;


SELECT
    v.vehicle_make AS Marca,
    COUNT(cv.collision_id) AS NumeroAccidentes
FROM
    vehiculos v
INNER JOIN
    colision_vehiculos cv
ON
    v.vehicle_id = cv.vehicle_id
GROUP BY
    v.vehicle_make
ORDER BY
    NumeroAccidentes ASC;



select v.vehicle_make as Marca, count(cv.collision_id) as NumeroAccidentes
from vehiculos v
left join colision_vehiculos cv on v.vehicle_id = cv.vehicle_id
group by v.vehicle_make
order by NumeroAccidentes asc
limit 100;


select v1.vehicle_make as Marca, v2.NumeroAccidentes
from vehiculos as v1
    inner join (select count(collision_id) as NumeroAccidentes
                from colision_vehiculos
                inner join vehiculos on vehiculos.vehicle_id = colision_vehiculos.vehicle_id
                group by vehicle_make
                order by NumeroAccidentes asc) as v2
    on v1.vehicle_id = v2.VehicleID;

select v1.vehicle_make as Marca, v2.NumeroAccidentes
from vehiculos as v1
    inner join (select count(collision_id) as NumeroAccidentes, vehicle_make as MarcaVehiculo
                from colision_vehiculos, vehiculos
                inner join vehiculos on vehiculos.vehicle_id = colision_vehiculos.vehicle_id
                group by vehicle_id
                order by NumeroAccidentes asc) as v2
    on v1.vehicle_id = v2.vehicle_id;

select vehicle_make as Marca, (select count(collision_id), vehicle_make as MarcaVehiculo
                               from colision_vehiculos, vehiculos
                               inner join vehiculos on vehiculos.vehicle_id =
                               group by vehicle_make) as NumeroAccidentes
from vehiculos
order by NumeroAccidentes asc;

select count(collision_id) as NumeroAccidentes, vehicle_make as MarcaVehiculo
                               from colision_vehiculos
                               inner join vehiculos on vehiculos.vehicle_id = colision_vehiculos.vehicle_id
                               group by vehicle_make
                               order by NumeroAccidentes asc

select vehiculos.vehicle_make as Marca, count(accidentes.*) as NumeroAccidentesMarca
from vehiculos, accidentes, colision_vehiculos
where vehiculos.vehicle_id = colision_vehiculos.vehicle_id
    and  accidentes.collision_id = colision_vehiculos.collision_id
group by vehiculos.vehicle_make;

select vehiculos.vehicle_make, count(colision_vehiculos.collision_id) as NumeroAccidentes
from vehiculos, colision_vehiculos
where colision_vehiculos.vehicle_id = vehiculos.vehicle_id
group by vehicle_make
order by NumeroAccidentes desc;

-- Sentencia 9
select persona.person_address, persona.person_city, persona.person_state
from persona, accidentes, colision_persona
where persona.person_id = colision_persona.person_id
    and accidentes.collision_id = colision_persona.collision_id
    and colision_persona.position_in_vehicle in ('Driver');

-- Sentencia 10
select state_registration, count(colision_vehiculos.collision_id) as NumeroAccidentes
from colision_vehiculos
group by state_registration
order by state_registration desc;
