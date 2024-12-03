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
select vehicle_make, count(final.colision_vehiculos.*) as numero_accidentes
from vehiculos, colision_vehiculos
where final.vehiculos.vehicle_id= final.colision_vehiculos.vehicle_id
group by vehicle_make
order by numero_accidentes desc
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
select persona.*, person_age
from persona, colision_persona
where final.persona.person_id = final.colision_persona.person_id
    and final.colision_persona.person_type = 'driver'
    and final.colision_persona.person_age <= 26 or final.colision_persona.person_age >= 65
order by person_age asc;

-- Sentencia 6
select distinct persona.*, vehiculos.vehicle_type
from persona, vehiculos
where vehiculos.vehicle_type in ('Pick-up');

select distinct final.persona.*
from persona, colision_persona, vehiculos
where final.vehiculos.vehicle_id = final.colision_persona.vehicle_id
    and final.colision_persona.person_id = final.persona.person_id
group by persona.person_id, vehicle_type
having final.vehiculos.vehicle_type in ('Pick-up');


-- Sentencia 7
select vehicle_make, count(final.colision_vehiculos.*) as numero_accidentes
from vehiculos, colision_vehiculos
where final.vehiculos.vehicle_id= final.colision_vehiculos.vehicle_id
group by vehicle_make
order by numero_accidentes asc
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

select vehicle_make, (select count(*) from accidentes) as NumeroAccidentes
from vehiculos
group by vehicle_make;

-- Sentencia 9
select persona.person_address, persona.person_city, persona.person_state
from persona, accidentes, colision_persona
where persona.person_id = colision_persona.person_id
    and accidentes.collision_id = colision_persona.collision_id;

-- Sentencia 10 (No funciona)
select count(accidentes.*) as NumeroAccidentes, state_registration
from vehiculos, colision_vehiculos, accidentes
where vehiculos.vehicle_id = colision_vehiculos.vehicle_id
    and accidentes.collision_id = colision_vehiculos.collision_id
group by state_registration;
