CREATE TABLE IF NOT EXISTS accidentes(
    crash_date date check(crash_date between '2013-01-01' and '2024-01-01'),
    crash_time time without time zone,
    borough varchar(512),
    zip_code serial check(zip_code between 1 and 99999),
    latitude decimal check(latitude between -90 and 90),
    longitude decimal check(longitude between -90 and 90),
    location varchar(512),
    on_street_name varchar(512),
    cross_street_name varchar(512),
    off_street_name varchar(512),
    number_of_persons_injured smallint check (number_of_persons_injured >= 0),
    number_of_persons_killed smallint check (number_of_persons_killed>=0),
    number_of_pedestrians_injured smallint check (number_of_pedestrians_injured>=0),
    number_of_pedestrians_killed smallint check (number_of_pedestrians_killed>=0),
    number_of_cyclists_injured smallint check (number_of_cyclists_injured>=0),
    number_of_cyclists_killed smallint check (number_of_cyclists_killed>=0),
    number_of_motorists_injured smallint check (number_of_motorists_injured>=0),
    number_of_motorists_killed smallint check (number_of_motorists_killed>=0),
    contributing_factor_vehicle_1 text,
    contributing_factor_vehicle_2 text,
    contributing_factor_vehicle_3 text,
    contributing_factor_vehicle_4 text,
    contributing_factor_vehicle_5 text,
    collision_id varchar(10) not null,
);

CREATE TABLE IF NOT EXISTS persona(
    person_id varchar(512) not null,
    person_sex char(1) check(person_sex in ('M', 'F', 'U')),
    person_lastName varchar(50),
    person_firstName varchar(50),
    person_phone text,
    person_address varchar(200),
    person_city varchar(100),
    person_state varchar(100),
    person_zip serial check(person_zip between 1 and 99999),
    person_ssn varchar(11),
    person_dob date
);

CREATE TABLE IF NOT EXISTS vehiculos(
    vehicle_id varchar(512) not null,
    vehicle_type varchar(512),
    vehicle_make varchar(50),
    vehicle_model varchar(50),
    vehicle_year smallint check(vehicle_year between 1000 and 2024)
);

CREATE TABLE IF NOT EXISTS colision_persona(
    person_id varchar(512) not null,
    person_type varchar(50),
    person_injury varchar(50),
    vehicle_id bigserial not null,
    person_age smallint,
    ejection varchar(50),
    emotional_status varchar(50),
    bodily_injury varchar(512),
    position_in_vehicle varchar(1000),
    safety_equipment varchar(512),
    ped_location varchar(1000),
    ped_action varchar(1000),
    complaint varchar(512),
    ped_role varchar(50),
    contributing_factor_1 text,
    contributing_factor_2 text,
    person_sex char(1) check(person_sex in ('M', 'F', 'U')),
    collision_id varchar(10) not null
);

CREATE TABLE IF NOT EXISTS  colision_vehiculos(
    vehicle_id varchar(512) not null,
    travel_direction varchar(20),
    vehicle_occupants smallserial,
    driver_sex bpchar(1) check (driver_sex in ('U','F','M')),
    driver_license_status varchar(20),
    driver_license_jurisdiction bpchar(2),
    pre_crash varchar(100),
    point_of_impact varchar(512),
    vehicle_damage_1 varchar(512),
    vehicle_damage_2 varchar(512),
    vehicle_damage_3 varchar(512),
    vehicle_damage_4 varchar(512),
    public_property_damage varchar(20),
    public_property_damage_type text,
    contributing_factor_1 text,
    contributing_factor_2 text,
    collision_id varchar(10) not null
);

INSERT INTO final.accidentes ()

INSERT INTO final.persona()

INSERT INTO vehiculos(vehicle_id,
                      vehicle_year,
                      vehicle_type,
                      vehicle_model,
                      vehicle_make)
SELECT
    CAST(vehicle_id AS VARCHAR(512)),
    CAST(vehicle_type AS VARCHAR(512)),
    CAST(vehicle_make AS VARCHAR(50)),
    CAST(vehicle_model AS VARCHAR(50)),
    CAST(vehicle_year AS SMALLINT)
FROM temporal.vehiculos;