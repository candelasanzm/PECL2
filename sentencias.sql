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
select count(cv.unique_id) as NumeroAccidentes, v.vehicle_make
from colision_vehiculos as cv left join vehiculos as v on cv.vehicle_id = v.vehicle_id
group by v.vehicle_make
order by NumeroAccidentes asc
limit 3;

select count(cv.unique_id) as NumeroAccidentes, v.vehicle_type
from colision_vehiculos as cv left join vehiculos as v on cv.vehicle_id = v.vehicle_id
group by v.vehicle_type
order by NumeroAccidentes asc
limit 3;

-- Sentencia 8 (No compila)
select count(cv.unique_id) as NumeroAccidentes, v.vehicle_make
from colision_vehiculos as cv left join vehiculos as v on cv.vehicle_id = v.vehicle_id
group by v.vehicle_make
order by vehicle_make asc;

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
