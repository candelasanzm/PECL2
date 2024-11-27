CREATE TABLE IF NOT EXISTS accidentes(
    crash_date TEXT,
    crash_time TEXT,
    borough TEXT,
    zip_code TEXT,
    latitude TEXT,
    longitude TEXT,
    location TEXT,
    on_street_name TEXT,
    cross_street_name TEXT,
    off_street_name TEXT,
    number_of_persons_injured TEXT,
    number_of_persons_killed TEXT,
    number_of_pedestrians_injured TEXT,
    number_of_pedestrians_killed TEXT,
    number_of_cyclists_injured TEXT,
    number_of_cyclists_killed TEXT,
    number_of_motorists_injured TEXT,
    number_of_motorists_killed TEXT,
    contributing_factor_vehicle_1 TEXT,
    contributing_factor_vehicle_2 TEXT,
    contributing_factor_vehicle_3 TEXT,
    contributing_factor_vehicle_4 TEXT,
    contributing_factor_vehicle_5 TEXT,
    collision_id TEXT
);

CREATE TABLE IF NOT EXISTS persona(
    person_id TEXT,
    person_sex TEXT,
    person_lastName TEXT,
    person_firstName TEXT,
    person_phone TEXT,
    person_address TEXT,
    person_city TEXT,
    person_state TEXT,
    person_zip TEXT,
    person_ssn TEXT,
    person_dob TEXT
);

CREATE TABLE IF NOT EXISTS vehiculos(
    vehicle_id TEXT,
    state_registration TEXT,
    vehicle_type TEXT,
    vehicle_make TEXT,
    vehicle_model TEXT,
    vehicle_year TEXT
);

CREATE TABLE IF NOT EXISTS colision_persona(
    person_id TEXT,
    person_type TEXT,
    person_injury TEXT,
    vehicle_id TEXT,
    person_age TEXT,
    ejection TEXT,
    emotional_status TEXT,
    bodily_injury TEXT,
    position_in_vehicle TEXT,
    safety_equipment TEXT,
    ped_location TEXT,
    ped_action TEXT,
    complaint TEXT,
    ped_role TEXT,
    contributing_factor_1 TEXT,
    contributing_factor_2 TEXT,
    person_sex TEXT,
    collision_id TEXT
);

CREATE TABLE IF NOT EXISTS colision_vehiculos(
    vehicle_id TEXT,
    travel_direction TEXT,
    vehicle_occupants TEXT,
    driver_sex TEXT,
    driver_license_status TEXT,
    driver_license_jurisdiction TEXT,
    pre_crash TEXT,
    point_of_impact TEXT,
    vehicle_damage_1 TEXT,
    vehicle_damage_2 TEXT,
    vehicle_damage_3 TEXT,
    vehicle_damage_4 TEXT,
    public_property_damage TEXT,
    public_property_damage_type TEXT,
    contributing_factor_1 TEXT,
    contributing_factor_2 TEXT,
    collision_id TEXT
);

COPY accidentes
FROM 'C:\Collisions_Crashes_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';

COPY persona
FROM 'C:\personas2.csv'
WITH CSV HEADER NULL '' DELIMITER ';';

COPY vehiculos
FROM 'C:\Vehicles.csv'
WITH CSV HEADER NULL '' DELIMITER ';';

COPY colision_persona
FROM 'C:\Collisions_Person_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';

COPY colision_vehiculos
FROM 'C:\Collisions_Vehicles_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';