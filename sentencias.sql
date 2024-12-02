-- Sentencia 1
select vehiculos.vehicle_id, count(accidentes.*) as NumeroAccidentes
from accidentes, colision_vehiculos, vehiculos
where vehiculos.vehicle_id = colision_vehiculos.vehicle_id
    and accidentes.collision_id = colision_vehiculos.collision_id
group by vehiculos.vehicle_id
having count(accidentes.*) > 1;

-- Sentencia 2
select *, (max(final.vehiculos.vehicle_year) - vehicle_year) AS Antiguedad
from vehiculos
where Antiguedad >= 35
order by Antiguedad desc;

-- Sentencia 3

-- Sentencia 4
select final.persona.person_id, count(accidentes.*) as NumeroAccidentes
from final.accidentes, final.colision_persona, final.persona
where final.persona.person_id = final.colision_persona.person_id
    and final.accidentes.collision_id = final.colision_persona.collision_id
group by final.persona.person_id
having count(accidentes.*) > 1;

-- Sentencia 5
select persona.*, person_age
from persona, colision_persona
where final.persona.person_id = final.colision_persona.person_id
    and final.colision_persona.person_age between 26 and 65
order by person_age asc;

-- Sentencia 6
select persona.*
from persona, vehiculos
where vehiculos.vehicle_type in ('Pick-up');

-- Sentencia 7


-- Sentencia 8
select vehiculos.vehicle_make as Marca, count(accidentes.*) as NumeroAccidentesMarca
from vehiculos, accidentes, colision_vehiculos
where vehiculos.vehicle_id = colision_vehiculos.vehicle_id
    and  accidentes.collision_id = colision_vehiculos.collision_id
group by vehiculos.vehicle_make;

-- Sentencia 9
select persona.person_address, persona.person_city, persona.person_state
from persona, accidentes, colision_persona
where persona.person_id = colision_persona.person_id
    and accidentes.collision_id = colision_persona.collision_id;

-- Sentencia 10
select count(accidentes.*) as NumeroAccidentes, state_registration
from vehiculos, colision_vehiculos, accidentes
where vehiculos.vehicle_id = colision_vehiculos.vehicle_id
    and accidentes.collision_id = colision_vehiculos.collision_id
group by state_registration;
