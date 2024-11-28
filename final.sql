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
    collision_id varchar(10) not null
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

INSERT INTO final.accidentes (crash_date,
                              crash_time,
                              borough,
                              zip_code,
                              latitude,
                              longitude,
                              location,
                              on_street_name,
                              cross_street_name,
                              off_street_name,
                              number_of_persons_injured,
                              number_of_persons_killed,
                              number_of_pedestrians_injured,
                              number_of_pedestrians_killed,
                              number_of_cyclists_injured,
                              number_of_cyclists_killed,
                              number_of_motorists_injured,
                              number_of_motorists_killed,
                              contributing_factor_vehicle_1,
                              contributing_factor_vehicle_2,
                              contributing_factor_vehicle_3,
                              contributing_factor_vehicle_4,
                              contributing_factor_vehicle_5,
                              collision_id)
SELECT
    CAST(crash_date AS date check(crash_date between '2013-01-01' and '2024-01-01')),
    CAST(crash_time AS time without time zone),
    CAST(borough AS varchar(512)),
    CAST(zip_code AS serial check(zip_code between 1 and 99999)),
    CAST(latitude AS decimal check(latitude between -90 and 90)),
    CAST(longitude AS decimal check(longitude between -90 and 90)),
    CAST(location AS varchar(512)),
    CAST(on_street_name AS varchar(512)),
    CAST(cross_street_name AS varchar(512)),
    CAST(off_street_name AS varchar(512)),
    CAST(number_of_persons_injured AS smallint check (number_of_persons_injured >= 0)),
    CAST(number_of_persons_killed AS smallint check (number_of_persons_killed>=0)),
    CAST(number_of_pedestrians_injured AS smallint check (number_of_pedestrians_injured>=0)),
    CAST(number_of_pedestrians_killed AS smallint check (number_of_pedestrians_killed>=0)),
    CAST(number_of_cyclists_injured AS smallint check (number_of_cyclists_injured>=0)),
    CAST(number_of_cyclists_killed AS smallint check (number_of_cyclists_killed>=0)),
    CAST(number_of_motorists_injured AS smallint check (number_of_motorists_injured>=0)),
    CAST(number_of_motorists_killed AS smallint check (number_of_motorists_killed>=0)),
    CAST(contributing_factor_vehicle_1 AS text),
    CAST(contributing_factor_vehicle_2 AS text),
    CAST(contributing_factor_vehicle_3 AS text),
    CAST(contributing_factor_vehicle_4 AS text),
    CAST(contributing_factor_vehicle_5 AS text),
    CAST(collision_id AS varchar(10) not null)
FROM temporal.accidentes;

INSERT INTO final.persona(person_id,
                          person_sex,
                          person_lastName,
                          person_firstName,
                          person_phone,
                          person_address,
                          person_city,
                          person_state,
                          person_zip,
                          person_ssn,
                          person_dob)
SELECT(
    CAST(person_id AS varchar(512) not null),
    CAST(person_sex AS char(1) check(person_sex in ('M', 'F', 'U'))),
    CAST(person_lastName AS varchar(50)),
    CAST(person_firstName AS varchar(50)),
    CAST(person_phone AS text),
    CAST(person_address AS varchar(200)),
    CAST(person_city AS varchar(100)),
    CAST(person_state AS varchar(100)),
    CAST(person_zip AS serial check(person_zip between 1 and 99999)),
    CAST(person_ssn AS varchar(11)),
    CAST(person_dob AS date)
)
FROM temporal.persona;

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

INSERT INTO colision_persona(person_id,
                             person_type,
                             person_injury,
                             vehicle_id,
                             person_age,
                             ejection,
                             emotional_status,
                             bodily_injury,
                             position_in_vehicle,
                             safety_equipment,
                             ped_location,
                             complaint,
                             ped_role,
                             contributing_factor_1,
                             contributing_factor_2,
                             person_sex,
                             collision_id)
SELECT(
    CAST(person_id AS varchar(512) not null),
    CAST(person_type AS varchar(50)),
    CAST(person_injury AS varchar(50)),
    CAST(vehicle_id AS bigserial not null),
    CAST(person_age AS smallint),
    CAST(ejection AS varchar(50)),
    CAST(emotional_status AS varchar(50)),
    CAST(bodily_injury AS varchar(512)),
    CAST(position_in_vehicle AS varchar(1000)),
    CAST(safety_equipment AS varchar(512)),
    CAST(ped_location AS varchar(1000)),
    CAST(ped_action AS varchar(1000)),
    CAST(complaint AS varchar(512)),
    CAST(ped_role AS varchar(50)),
    CAST(contributing_factor_1 AS text),
    CAST(contributing_factor_2 AS text),
    CAST(person_sex AS char(1) check(person_sex in ('M', 'F', 'U'))),
    CAST(collision_id AS varchar(10) not null)
)
FROM temporal.colision_persona;

INSERT INTO colision_vehiculos(vehicle_id,
                               travel_direction,
                               vehicle_occupants,
                               driver_sex,
                               driver_license_status,
                               driver_license_jurisdiction,
                               pre_crash,
                               point_of_impact,
                               vehicle_damage_1,
                               vehicle_damage_2,
                               vehicle_damage_3,
                               vehicle_damage_4,
                               public_property_damage,
                               public_property_damage_type,
                               contributing_factor_1,
                               contributing_factor_2,
                               collision_id)
SELECT(
    CAST(vehicle_id AS varchar(512) not null),
    CAST(travel_direction AS varchar(20)),
    CAST(vehicle_occupants AS smallserial),
    CAST(driver_sex AS bpchar(1) check (driver_sex in ('U','F','M'))),
    CAST(driver_license_status AS varchar(20)),
    CAST(driver_license_jurisdiction AS bpchar(2)),
    CAST(pre_crash AS varchar(100)),
    CAST(point_of_impact AS varchar(512)),
    CAST(vehicle_damage_1 AS varchar(512)),
    CAST(vehicle_damage_2 AS varchar(512)),
    CAST(vehicle_damage_3 AS varchar(512)),
    CAST(vehicle_damage_4 AS varchar(512)),
    CAST(public_property_damage AS varchar(20)),
    CAST(public_property_damage_type AS text),
    CAST(contributing_factor_1 AS text),
    CAST(contributing_factor_2 AS text),
    CAST(collision_id AS varchar(10) not null)
)
FROM temporal.colision_vehiculos;