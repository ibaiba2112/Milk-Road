--     -- FOREIGN KEY PRODUCTS --

-- SAVED QUERIES --
-- DROP TABLE Firearms;
-- DROP TABLE Explosives;
-- DROP TABLE Ammunition;
-- DROP TABLE Tactical_Gear;
-- DROP TABLE Military_Equipment;

-- DROP TABLE Prescription_Meds;
-- DROP TABLE Illicit_Drugs;
-- DROP TABLE Herbal_Natural_Substances;
-- DROP TABLE Research_Chemicals;

-- DROP TABLE Hacking_Cyber_Services;
-- DROP TABLE Forged_Documents;
-- DROP TABLE Contractors_Protection;
-- DROP TABLE Blackmail_Info_Leaks;

-- DROP TABLE Safehouses;
-- DROP TABLE Underground_Bunkers;
-- DROP TABLE Off_grid_Cabins;

-- DROP TABLE Alcohol;
-- DROP TABLE Rare_Cigars_Tobacco;
-- DROP TABLE Jewelry_Rare_Gems;
-- DROP TABLE Artifacts_Antiquities;
-- DROP TABLE Exotic_Animals;
-- DROP TABLE Designer_Clothes;

-- DROP TABLE Software_Keys_Licenses;
-- DROP TABLE Malware_Exploits;
-- DROP TABLE Stolen_Data;
-- DROP TABLE Burner_Phones_SIM_Cards;
-- DROP TABLE Encrypted_Devices;

-- DROP TABLE Random;





--         -- // WEAPONS \\ --
DROP TABLE IF EXISTS Firearms;
CREATE TABLE Firearms (
    serialNum INTEGER,
    caliber TEXT,
    weight TEXT,
    barrel_length TEXT,
    FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Explosives;
CREATE TABLE Explosives (
    serialNum INTEGER,
    density TEXT,
    chemical_composition TEXT,
    weight TEXT,
    sensitivity TEXT,
    detonation_velocity TEXT,
    water_resistance TEXT,
    FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Ammunition;
CREATE TABLE Ammunition (
    serialNum INTEGER,
    caliber TEXT,
    bullet_weight TEXT,
    shape TEXT,
    charge TEXT,
    material TEXT,
    FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS TacticalGear;
CREATE TABLE Tactical_Gear (
    serialNum INTEGER,
    weight TEXT,
    material TEXT,
    color TEXT,
    size TEXT,
    protection_level TEXT,
    FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS MilitaryEquipment;
CREATE TABLE Military_Equipment (
    serialNum INTEGER,
    weight TEXT,
    country_of_origin TEXT,
    effective_range TEXT,
    crew_required INTEGER,
    year_of_service TEXT,
    FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
);

--      -- // INSERTS \\ --     -- 
-- -- Firearms
    INSERT INTO Firearms (serialNum, caliber, weight, barrel_length) VALUES
    (1, '5.56×45mm NATO', '3.1 kg', '508 mm'),
    (2, '5.45×39mm', '3.3 kg', '415 mm'),
    (3, '.308 Winchester', '4.0 kg', '660 mm'),
    (4, '7.62×51mm NATO', '6.95 kg', '650 mm'),
    (5, '.45 ACP', '4.8 kg', '267 mm'),
    (6, '9×19mm Parabellum', '3.97 kg', '251 mm'),
    (7, '.50 BMG', '13.6 kg', '914 mm'),
    (8, '7.62×51mm NATO', '3.58 kg', '406 mm'),
    (9, '.357 Magnum', '1.25 kg', '102 mm');
-- -- Explosives
    INSERT INTO Explosives (serialNum, density, chemical_composition, weight, sensitivity, detonation_velocity, water_resistance) VALUES
    (10, '1.6 g/cm³', 'RDX-based Composition C-4', '1.25 kg', 'Low', '8,040 m/s', 'Yes'),
    (11, '1.5 g/cm³', 'Composition C-4 with steel balls', '1.6 kg', 'Medium', '7,920 m/s', 'Yes'),
    (12, '1.35 g/cm³', 'TNT', '400 g', 'Medium', '6,900 m/s', 'Limited'),
    (13, '1.3 g/cm³', 'Thermite mixture', '500 g', 'High', 'N/A (Incendiary)', 'Limited'),
    (14, '1.7 g/cm³', 'TNT/RDX mix', '12 kg', 'Medium', '7,400 m/s', 'Yes'),
    (15, '1.8 g/cm³', 'RDX', '2.5 kg', 'High', '8,750 m/s', 'No');
-- -- Ammunition
    INSERT INTO Ammunition (serialNum, caliber, bullet_weight, shape, charge, material) VALUES
    (16, '5.56×45mm NATO', '55 gr', 'Spitzer', 'Smokeless', 'Lead Core'),
    (17, '7.62×39mm', '123 gr', 'Full Metal Jacket', 'Smokeless', 'Steel Core'),
    (18, '.50 BMG', '750 gr', 'Boat-tail', 'Smokeless', 'Lead Core'),
    (19, '9×19mm Parabellum', '124 gr', 'Round Nose', 'Smokeless', 'Lead Core'),
    (20, '.357 Magnum', '158 gr', 'Semi-Wadcutter', 'Smokeless', 'Lead Core');
-- -- Tactical_Gear
    INSERT INTO Tactical_Gear (serialNum, weight, material, color, size, protection_level) VALUES
    (21, '3.5 kg', 'Kevlar/Nylon', 'Coyote Brown', 'Adjustable', 'NIJ Level IIIA'),
    (22, '1.2 kg', 'Polycarbonate', 'Matte Black', 'One Size', 'N/A'),
    (23, '2.0 kg', 'Cordura Nylon', 'Multicam', '45L', 'N/A'),
    (24, '1.6 kg', 'Ballistic Composite', 'Olive Drab', 'Medium-Large', 'NIJ Level IIIA'),
    (25, '0.35 kg', 'Kevlar/Leather', 'Black', 'Medium', 'Cut Resistant'),
    (26, '0.9 kg', 'Butyl Rubber/Plastic', 'Dark Green', 'One Size', 'NBC Protective');
-- -- Military_Equipment
    INSERT INTO Military_Equipment (serialNum, weight, country_of_origin, effective_range, crew_required, year_of_service) VALUES
    (27, '10.1 kg', 'USA', '800 m', 1, '1984'),
    (28, '22.3 kg (launcher)', 'USA', '2500 m', 1, '1996'),
    (29, '12.5 kg', 'USA', '1200 m', 2, '1977'),
    (30, '4080 kg', 'USA', '600 km', 2, '1985'),
    (31, '1.4 kg', 'USA', '400 m (grenade)', 1, '1969'),
    (32, '65 kg', 'USA', 'Display/Training', 0, '2020');



--       -- // DRUGS \\ -- -- 
DROP TABLE IF EXISTS Prescription_Meds;
CREATE TABLE Prescription_Meds (
    serialNum INTEGER,
    dosage TEXT,
    form TEXT,
    controlled_substance BOOLEAN,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Illicit_Drugs;
CREATE TABLE Illicit_Drugs (
    serialNum INTEGER,
    substance TEXT,
    purity_percentage REAL,
    packaging TEXT,
    street_price_per_gram REAL,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Research_Chemicals;
CREATE TABLE Research_Chemicals (
    serialNum INTEGER,
    chemical_name TEXT,
    purity TEXT,
    quantity TEXT,
    hazard_level TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Herbal_Natural_Substances;
CREATE TABLE Herbal_Natural_Substances (
    serialNum INTEGER,
    substance_name TEXT,
    origin_country TEXT,
    form TEXT,
    typical_use TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);

--      -- // INSERTS \\ --     -- 
INSERT INTO Prescription_Meds (serialNum, dosage, form) VALUES
(33, '10mg', 'Tablet'),
(34,'20mg', 'Capsule');
INSERT INTO Illicit_Drugs (serialNum, substance, purity_percentage, packaging, street_price_per_gram) VALUES
(35, 'Cocaine', 82.5, 'Ziplock Bag', 50.0),
(36, 'Methamphetamine', 95.0, 'Foil Wrap', 40.0);
INSERT INTO Research_Chemicals (serialNum, chemical_name, purity, quantity, hazard_level) VALUES
(37, '2C-B', '99%', '5 grams', 'Moderate'),
(38, 'MXE', '98%', '10 grams', 'High');
INSERT INTO Herbal_Natural_Substances (serialNum, substance_name, origin_country, form, typical_use) VALUES
(39, 'Kratom', 'Indonesia', 'Powder', 'Stimulant/Pain Relief'),
(40, 'Salvia Divinorum', 'Mexico', 'Leaves', 'Psychoactive');



--       -- // SERVICES \\ -- -- 
DROP TABLE IF EXISTS Hacking_Cyber_Services;
CREATE TABLE Hacking_Cyber_Services (
    serialNum INTEGER,
    service_name TEXT,
    description TEXT,
    typical_duration TEXT,
    risk_level TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Forged_Documents;
CREATE TABLE Forged_Documents (
    serialNum INTEGER,
    document_type TEXT,
    country_of_issue TEXT,
    quality TEXT,
    delivery_time TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Contractors_Protection;
CREATE TABLE Contractors_Protection (
    serialNum INTEGER,
    contractor_type TEXT,
    experience_years INTEGER,
    equipment_level TEXT,
    availability TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Blackmail_Info_Leaks;
CREATE TABLE Blackmail_Info_Leaks (
    serialNum INTEGER,
    target_name TEXT,
    info_type TEXT,
    leverage_level TEXT,
    anonymity_guarantee TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);

--      -- // INSERTS \\ --     -- 
INSERT INTO Hacking_Cyber_Services (serialNum, service_name, description, typical_duration, risk_level) VALUES
(41, 'DDoS Attack', 'Distributed denial of service attack on target website', '24 hours', 'High'),
(42, 'Email Phishing', 'Crafted phishing emails to collect credentials', '1 week', 'Medium');
INSERT INTO Forged_Documents (serialNum, document_type, country_of_issue, quality, delivery_time) VALUES
(43, 'Passport', 'USA', 'High Quality', '7 days'),
(44, 'Driver’s License', 'Germany', 'Standard', '3 days');
INSERT INTO Contractors_Protection (serialNum, contractor_type, experience_years, equipment_level, availability) VALUES
(45, 'Bodyguard', 10, 'High', 'Immediate'),
(46, 'Hacker-for-hire', 5, 'Advanced', 'Within 48 hours');
INSERT INTO Blackmail_Info_Leaks (serialNum, target_name, info_type, leverage_level, anonymity_guarantee) VALUES
(47, 'Corporate CEO', 'Financial records', 'High', 'Full'),
(48, 'Politician', 'Scandal photos', 'Medium', 'Partial');



--      -- // REAL ESTATE \\ --     -- 
DROP TABLE IF EXISTS Safehouses;
CREATE TABLE Safehouses (
    serialNum INTEGER,
    location TEXT,
    capacity INTEGER,
    security_level TEXT,
    amenities TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Underground_Bunkers;
CREATE TABLE Underground_Bunkers (
    serialNum INTEGER,
    location TEXT,
    depth_meters INTEGER,
    duration_capacity_days INTEGER,
    equipment TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Off_grid_Cabins;
CREATE TABLE Off_grid_Cabins (
    serialNum INTEGER,
    location TEXT,
    size_sq_meters INTEGER,
    utilities TEXT,
    access_difficulty TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);

--      -- // INSERTS  \\ --     -- 
INSERT INTO Safehouses (serialNum, location, capacity, security_level, amenities) VALUES
(49, 'Berlin', 4, 'High', 'CCTV, Guard Dogs'),
(50, 'Bangkok', 6, 'Medium', 'Safe Room, Backup Power');
INSERT INTO Underground_Bunkers (serialNum, location, depth_meters, duration_capacity_days, equipment) VALUES
(51, 'Nevada Desert', 30, 90, 'Air Filtration, Food Storage'),
(52, 'Siberia', 45, 120, 'Self-Sustaining Power, Communications');
INSERT INTO Off_grid_Cabins (serialNum, location, size_sq_meters, utilities, access_difficulty) VALUES
(53, 'Alps', 50, 'Solar Panels, Well Water', 'High'),
(54, 'Canadian Wilderness', 70, 'Generator, Rainwater Collection', 'Medium');



--      -- // LIFESTYLE/LUXURY  \\ --     -- 
DROP TABLE IF EXISTS Alcohol;
CREATE TABLE Alcohol (
    serialNum INTEGER,
    type TEXT,
    brand TEXT,
    volume_ml INTEGER,
    alcohol_percentage REAL,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Rare_Cigars_Tobacco;
CREATE TABLE Rare_Cigars_Tobacco (
    serialNum INTEGER,
    cigar_brand TEXT,
    origin TEXT,
    quantity INTEGER,
    packaging TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Jewelry_Rare_Gems;
CREATE TABLE Jewelry_Rare_Gems (
    serialNum INTEGER,
    item_type TEXT,
    gemstone TEXT,
    carat_weight REAL,
    origin TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Artifacts_Antiquities;
CREATE TABLE Artifacts_Antiquities (
    serialNum INTEGER,
    item_name TEXT,
    period TEXT,
    origin_country TEXT,
    condition TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Exotic_Animals;
CREATE TABLE Exotic_Animals (
    serialNum INTEGER,
    species TEXT,
    age INTEGER,
    origin TEXT,
    legal_status TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Designer_Clothes;
CREATE TABLE Designer_Clothes (
    serialNum INTEGER,
    brand TEXT,
    item_type TEXT,
    size TEXT,
    color TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);

--      -- // INSERTS  \\ --     -- 
INSERT INTO Alcohol (serialNum, type, brand, volume_ml, alcohol_percentage) VALUES
(55, 'Whiskey', 'Macallan 18', 700, 43.0);
INSERT INTO Rare_Cigars_Tobacco (serialNum, cigar_brand, origin, quantity, packaging) VALUES
(56, 'Cohiba Behike', 'Cuba', 20, 'Wooden Box');
INSERT INTO Jewelry_Rare_Gems (serialNum, item_type, gemstone, carat_weight, origin) VALUES
(57, 'Necklace', 'Diamond', 3.5, 'South Africa');
INSERT INTO Artifacts_Antiquities (serialNum, item_name, period, origin_country, condition) VALUES
(58, 'Roman Coin', '1st Century AD', 'Italy', 'Excellent');
INSERT INTO Exotic_Animals (serialNum, species, age, origin, legal_status) VALUES
(59, 'Macaw Parrot', 3, 'Brazil', 'Illegal');
INSERT INTO Designer_Clothes (serialNum, brand, item_type, size, color) VALUES
(60, 'Gucci', 'Jacket', 'L', 'Black');



--      -- // DIGITAL/TECH  \\ --     -- 
DROP TABLE IF EXISTS Software_Keys_Licenses;
CREATE TABLE Software_Keys_Licenses (
    serialNum INTEGER,
    software_name TEXT,
    license_type TEXT,
    expiry_date TEXT,
    key_code TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Malware_Exploits;
CREATE TABLE Malware_Exploits (
    serialNum INTEGER,
    malware_name TEXT,
    exploit_type TEXT,
    target_platform TEXT,
    complexity_level TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Stolen_Data;
CREATE TABLE Stolen_Data (
    serialNum INTEGER,
    data_type TEXT,
    source TEXT,
    size_gb REAL,
    sensitivity_level TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Burner_Phones_SIM_Cards;
CREATE TABLE Burner_Phones_SIM_Cards (
    serialNum INTEGER,
    device_model TEXT,
    sim_type TEXT,
    prepaid_balance REAL,
    network TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);
DROP TABLE IF EXISTS Encrypted_Devices;
CREATE TABLE Encrypted_Devices (
    serialNum INTEGER,
    device_type TEXT,
    encryption_type TEXT,
    storage_capacity_gb INTEGER,
    battery_life_hours INTEGER,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);

--      -- // INSERTS  \\ --     -- 
INSERT INTO Software_Keys_Licenses (serialNum, software_name, license_type, expiry_date, key_code) VALUES
(61, 'Adobe Photoshop', 'Annual', '2026-12-31', 'XXXX-XXXX-XXXX-1234');
INSERT INTO Malware_Exploits (serialNum, malware_name, exploit_type, target_platform, complexity_level) VALUES
(62, 'Emotet', 'Trojan', 'Windows', 'High');
INSERT INTO Stolen_Data (serialNum, data_type, source, size_gb, sensitivity_level) VALUES
(63, 'Credit Card Dump', 'Bank XYZ', 3.5, 'High');
INSERT INTO Burner_Phones_SIM_Cards (serialNum, device_model, sim_type, prepaid_balance, network) VALUES
(64, 'Nokia 105', 'Prepaid SIM', 20.0, 'T-Mobile');
INSERT INTO Encrypted_Devices (serialNum, device_type, encryption_type, storage_capacity_gb, battery_life_hours) VALUES
(65, 'Encrypted Phone', 'AES-256', 128, 24);



--      -- // RANDOM  \\ --     -- 
DROP TABLE IF EXISTS Random;
CREATE TABLE Random (
    serialNum INTEGER,
    item_name TEXT,
    description TEXT,
    rarity TEXT,
    FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
);


--      -- // INSERTS  \\ --     -- 
INSERT INTO Random (serialNum, item_name, description, rarity) VALUES
(66, 'Antique Compass', 'Brass compass from 19th century', 'Rare');