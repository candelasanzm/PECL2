-- Sentencia 1
select colision_vehiculos.vehicle_id, count(colision_vehiculos.collision_id) as NumeroAccidentes
from colision_vehiculos
group by vehicle_id
having count(colision_vehiculos.collision_id) > 1
order by NumeroAccidentes DESC ;

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

-- Sentencia 4 (No compila)
select colision_persona.person_id, count(colision_persona.collision_id) as NumeroAccidentes
from colision_persona
group by person_id
having count(colision_persona.collision_id) > 1
order by NumeroAccidentes DESC ;

select final.persona.person_id, count(accidentes.*) as NumeroAccidentes
from final.accidentes, final.colision_persona, final.persona
where final.persona.person_id = final.colision_persona.person_id
    and final.accidentes.collision_id = final.colision_persona.collision_id
group by final.persona.person_id
having count(accidentes.*) > 1;

select distinct *, (select count(*) from accidentes) as NumeroAccidentes
from persona
group by person_id
having (select count(*) from accidentes) > 1;

select final.persona.*, count(final.colision_persona.person_id) as numero_accidentes
from persona, colision_persona
where final.persona.person_id = final.colision_persona.person_id
  and final.colision_persona.person_type in ('driver')
group by persona.person_id, persona.person_sex, person_lastname, person_firstname, person_phone, person_address, person_city, person_state, person_zip, person_ssn, person_dob
having count(final.colision_persona.person_id) >1;

-- Sentencia 5
select position_in_vehicle, person_id, person_age
from colision_persona
where position_in_vehicle in ('Driver') and (person_age > 65 or person_age < 26)
order by person_age desc;

-- Sentencia 6
select distinct persona.*, vehiculos.vehicle_type
from persona, vehiculos
where vehiculos.vehicle_type in ('Pick-up');

-- Sentencia 7
select vehicle_make, (select count(collision_id)
                      from colision_vehiculos
                      group by collision_id) as NumeroAccidentes
from vehiculos
group by vehicle_make
order by NumeroAccidentes desc
limit 3;

select vehiculos.vehicle_make, count(colision_vehiculos.collision_id) as NumeroAccidentes
from vehiculos, colision_vehiculos
where final.vehiculos.vehicle_id = final.colision_vehiculos.vehicle_id
group by vehicle_make
order by NumeroAccidentes DESC
limit 3;

select vehicle_type, count(final.colision_vehiculos.*) as numero_accidentes
from vehiculos, colision_vehiculos
where final.vehiculos.vehicle_id= final.colision_vehiculos.vehicle_id
group by vehicle_type
order by numero_accidentes asc
limit 3;

-- Sentencia 8 (No compila)
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
