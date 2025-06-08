    -- USER INFO --

-- DROP TABLE IF EXISTS UserInfo;
-- CREATE TABLE UserInfo(
--     user_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     first_name TEXT,
--     last_name TEXT,
--     birthday DATE,
--     username TEXT,
--     funds TEXT DEFAULT '0.01234456',
--     password TEXT NOT NULL
-- );
-- DROP TABLE UserInfo;



          -- PRODUCTS --
    -- // MAIN PRODUCT TABLE \\ --

-- DROP TABLE Products;
-- DROP TABLE Firearms;
-- DROP TABLE Explosives;


-- DROP TABLE IF EXISTS Products;
-- CREATE TABLE Products (
--     serialNum INTEGER PRIMARY KEY AUTOINCREMENT,
--     name TEXT,
--     category TEXT, -- 'weapon', 'drug', 'property', 'service', etc.
--     price REAL,
--     image BLOB,
--     description TEXT
-- );

--     -- FOREIGN KEY PRODUCTS --
--         -- // WEAPONS \\ --

-- DROP TABLE IF EXISTS Firearms ;
-- CREATE TABLE Firearms (
--     serialNum INTEGER,
--     caliber TEXT,
--     weight TEXT,
--     barrel_length TEXT,
--     FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
-- );


-- DROP TABLE IF EXISTS Exlposives ;
-- CREATE TABLE Explosives (
--     serialNum INTEGER,
--     density TEXT,
--     chemical_composition TEXT,
--     weight TEXT,
--     sensitivity TEXT,
--     detonation_velocity TEXT,
--     water_resistance TEXT,
--     FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
-- );

-- DROP TABLE IF EXISTS Ammunition;
-- CREATE TABLE Ammunition (
--     serialNum INTEGER,
--     caliber TEXT,
--     bullet_weight TEXT,
--     shape TEXT,
--     charge TEXT,
--     material TEXT,
--     FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
-- );

-- DROP TABLE IF EXISTS TacticalGear;
-- CREATE TABLE Tactical_Gear (
--     serialNum INTEGER,
--     weight TEXT,
--     material TEXT,
--     color TEXT,
--     size TEXT,
--     protection_level TEXT,
--     FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
-- );

-- DROP TABLE IF EXISTS MilitaryEquipment;
-- CREATE TABLE Military_Equipment (
--     serialNum INTEGER,
--     weight TEXT,
--     country_of_origin TEXT,
--     effective_range TEXT,
--     crew_required INTEGER,
--     year_of_service TEXT,
--     FOREIGN KEY (serialNum) REFERENCES Products(serialNum)
-- );









-- ORDERS
-- DROP TABLE IF EXISTS Orders;
-- CREATE TABLE Orders(
--     order_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     order_delivery_address TEXT,
--     order_total_price REAL,
--     order_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );




    -- // INSERTS (WEAPONS) \\ --

-- -- Insert products (weapons)
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('1973 Colt AR-15', 'weapon', 1340, 'static/images/1973_Colt_AR15.jpeg', 'Classic semi-automatic rifle developed from the original M16 platform.'),
-- ('AK-74 Assault Rifle', 'weapon', 1799, 'static/images/Ak74assault.jpg', 'Iconic Soviet assault rifle, widely used in the Eastern Bloc.'),
-- ('Remington Model 700', 'weapon', 515, 'static/images/Remington_Model_700.jpeg', 'Highly accurate bolt-action rifle commonly used for hunting and sniping.'),
-- ('Walther WA 2000', 'weapon', 0.8, 'static/images/Walther_WA_2000.jpeg', 'Extremely rare German sniper rifle, used for high-precision shooting.'),
-- ('Thompson Submachine Gun', 'weapon', 0.4, 'static/images/Campbell_Thompson.jpg', 'Famous WWII-era submachine gun also known as the "Tommy Gun".'),
-- ('MP 40', 'weapon', 0.48, 'static/images/MP_40_AYF_2.JPG', 'German WWII submachine gun favored by infantry and paratroopers.'),
-- ('Grizzly Big Boar', 'weapon', 0.0624, 'static/images/big_boar.jpeg', 'Heavy-duty anti-materiel rifle with massive stopping power.'),
-- ('FN SCAR 17S', 'weapon', 0.056, 'static/images/scar.jpg', 'Modern modular battle rifle used by special operations forces.'),
-- ('Smith & Wesson 686 SSR', 'weapon', 0.032, 'static/images/Smith_Wesson_686_The_Presidents.jpeg', 'Precision revolver known for reliability and performance.');

-- -- Insert matching firearms details (based on serialNum order)
-- INSERT INTO Firearms (serialNum, caliber, weight, barrel_length) VALUES
-- (1, '5.56×45mm NATO', '3.1 kg', '508 mm'),
-- (2, '5.45×39mm', '3.3 kg', '415 mm'),
-- (3, '.308 Winchester', '4.0 kg', '660 mm'),
-- (4, '7.62×51mm NATO', '6.95 kg', '650 mm'),
-- (5, '.45 ACP', '4.8 kg', '267 mm'),
-- (6, '9×19mm Parabellum', '3.97 kg', '251 mm'),
-- (7, '.50 BMG', '13.6 kg', '914 mm'),
-- (8, '7.62×51mm NATO', '3.58 kg', '406 mm'),
-- (9, '.357 Magnum', '1.25 kg', '102 mm');
-- DROP TABLE Products;



-- Weapons
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('1973 Colt AR-15', 'firearm', 0.0383, 'static/images/1973_Colt_AR15.jpeg', 'Classic semi-automatic rifle developed from the original M16 platform.'),
-- ('AK-74 Assault Rifle', 'firearm', 0.0514, 'static/images/Ak74assault.jpg', 'Iconic Soviet assault rifle, widely used in the Eastern Bloc.'),
-- ('Remington Model 700', 'firearm', 0.0147, 'static/images/Remington_Model_700.jpeg', 'Highly accurate bolt-action rifle commonly used for hunting and sniping.'),
-- ('Walther WA 2000', 'firearm', 0.2286, 'static/images/Walther_WA_2000.jpeg', 'Extremely rare German sniper rifle, used for high-precision shooting.'),
-- ('Thompson Submachine Gun', 'firearm', 0.1143, 'static/images/Campbell_Thompson.jpg', 'Famous WWII-era submachine gun also known as the "Tommy Gun".'),
-- ('MP 40', 'firearm', 0.1371, 'static/images/MP_40_AYF_2.JPG', 'German WWII submachine gun favored by infantry and paratroopers.'),
-- ('Grizzly Big Boar', 'firearm', 0.2429, 'static/images/big_boar.jpeg', 'Heavy-duty anti-materiel rifle with massive stopping power.'),
-- ('FN SCAR 17S', 'firearm', 0.1, 'static/images/scar.jpg', 'Modern modular battle rifle used by special operations forces.'),
-- ('Smith & Wesson 686 SSR', 'firearm', 0.0257, 'static/images/Smith_Wesson_686_The_Presidents.jpeg', 'Precision revolver known for reliability and performance.');

--     -- Insert matching firearms details (based on serialNum order)
--     INSERT INTO Firearms (serialNum, caliber, weight, barrel_length) VALUES
--     (1, '5.56×45mm NATO', '3.1 kg', '508 mm'),
--     (2, '5.45×39mm', '3.3 kg', '415 mm'),
--     (3, '.308 Winchester', '4.0 kg', '660 mm'),
--     (4, '7.62×51mm NATO', '6.95 kg', '650 mm'),
--     (5, '.45 ACP', '4.8 kg', '267 mm'),
--     (6, '9×19mm Parabellum', '3.97 kg', '251 mm'),
--     (7, '.50 BMG', '13.6 kg', '914 mm'),
--     (8, '7.62×51mm NATO', '3.58 kg', '406 mm'),
--     (9, '.357 Magnum', '1.25 kg', '102 mm');

-- -- -- Explosives
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('C-4 Plastic Explosive', 'explosive', 0.0714, 'static/images/COMP-4-1lb-net-block_-_600-copy.jpg', 'Highly stable plastic explosive used in demolition and military operations.'),
-- ('M18 Claymore Mine', 'explosive', 0.0429, 'static/images/Repo-M18-Standing-front.jpg', 'Directional anti-personnel mine used for ambushes and perimeter defense.'),
-- ('M67 Fragmentation Grenade', 'explosive', 0.00857, 'static/images/2000w_q95.jpg', 'Standard-issue hand grenade designed to inflict casualties in enclosed areas.'),
-- ('AN/M14 Incendiary Grenade', 'explosive', 0.0114, 'static/images/AN-M14-TH3-Incendiary-Grenade-Inert-Replica-OTA-2990-copy.jpg', 'Incendiary grenade used for destroying equipment and creating fires.'),
-- ('M15 Anti-tank Mine', 'explosive', 0.0514, 'static/images/tank_mine.jpeg', 'Heavy anti-tank mine designed to disable armored vehicles.'),
-- ('RDX Explosive', 'explosive', 0.08, 'static/images/RDX_crystal.jpg', 'Powerful military explosive used in bomb-making and controlled demolitions.');
    
--     -- Insert matching explosives details (based on serialNum order)
--     INSERT INTO Explosives (serialNum, density, chemical_composition, weight, sensitivity, detonation_velocity, water_resistance) VALUES
--     (10, '1.6 g/cm³', 'RDX-based Composition C-4', '1.25 kg', 'Low', '8,040 m/s', 'Yes'),
--     (11, '1.5 g/cm³', 'Composition C-4 with steel balls', '1.6 kg', 'Medium', '7,920 m/s', 'Yes'),
--     (12, '1.35 g/cm³', 'TNT', '400 g', 'Medium', '6,900 m/s', 'Limited'),
--     (13, '1.3 g/cm³', 'Thermite mixture', '500 g', 'High', 'N/A (Incendiary)', 'Limited'),
--     (14, '1.7 g/cm³', 'TNT/RDX mix', '12 kg', 'Medium', '7,400 m/s', 'Yes'),
--     (15, '1.8 g/cm³', 'RDX', '2.5 kg', 'High', '8,750 m/s', 'No');


-- Ammunition
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('5.56×45mm NATO Ammo Box (500 rounds)', 'ammunition', 0.015, 'static/images/556_ammo.jpg', 'Standard NATO cartridge for rifles and carbines.'),
-- ('7.62×39mm FMJ Ammo Crate (640 rounds)', 'ammunition', 0.017, 'static/images/762_ammo.jpg', 'Soviet-era rifle cartridge, widely used in AK-pattern rifles.'),
-- ('.50 BMG Sniper Grade Ammo (50 rounds)', 'ammunition', 0.10, 'static/images/50_bmg_ammo.jpg', 'Heavy machine gun and sniper rifle cartridge with extreme range.'),
-- ('9×19mm Parabellum Ammo Pack (250 rounds)', 'ammunition', 0.008, 'static/images/parabellum_ammo.jpg', 'Popular handgun and submachine gun cartridge.'),
-- ('.357 Magnum Hollow Point (100 rounds)', 'ammunition', 0.02, 'static/images/357_ammo.jpg', 'High-powered revolver cartridge for defensive and hunting use.');

    -- INSERT INTO Ammunition (serialNum, caliber, bullet_weight, shape, charge, material) VALUES
    -- (16, '5.56×45mm NATO', '55 gr', 'Spitzer', 'Smokeless', 'Lead Core'),
    -- (17, '7.62×39mm', '123 gr', 'Full Metal Jacket', 'Smokeless', 'Steel Core'),
    -- (18, '.50 BMG', '750 gr', 'Boat-tail', 'Smokeless', 'Lead Core'),
    -- (19, '9×19mm Parabellum', '124 gr', 'Round Nose', 'Smokeless', 'Lead Core'),
    -- (20, '.357 Magnum', '158 gr', 'Semi-Wadcutter', 'Smokeless', 'Lead Core');


-- -- Tactical Gear
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('Tactical Vest', 'tactical_gear', 0.0143, 'static/images/Combat_Vest.jpeg', 'Ballistic-resistant vest with pouches for ammunition and equipment.'),
-- ('Night Vision Goggles', 'tactical_gear', 0.0714, 'static/images/night_vision.jpg', 'Electronic optical devices enabling vision in low-light conditions.'),
-- ('MOLLE Backpack', 'tactical_gear', 0.00429, 'static/images/molle_backpack.jpeg', 'Modular backpack system for carrying tactical gear and supplies.'),
-- ('Combat Helmet', 'tactical_gear', 0.01, 'static/images/combat_helmet.jpg', 'Ballistic-resistant helmet for protection against firearm projectiles and shrapnel.'),
-- ('Tactical Gloves', 'tactical_gear', 0.00229, 'static/images/tactical_gloves.jpeg', 'Reinforced gloves designed for durability and grip in combat situations.'),
-- ('Gas Mask', 'tactical_gear', 0.00857, 'static/images/gas_mask.jpg', 'Respiratory protective device for defense against toxic gases and airborne pollutants.');

--     INSERT INTO Tactical_Gear (serialNum, weight, material, color, size, protection_level) VALUES
--     (21, '3.5 kg', 'Kevlar/Nylon', 'Coyote Brown', 'Adjustable', 'NIJ Level IIIA'),
--     (22, '1.2 kg', 'Polycarbonate', 'Matte Black', 'One Size', 'N/A'),
--     (23, '2.0 kg', 'Cordura Nylon', 'Multicam', '45L', 'N/A'),
--     (24, '1.6 kg', 'Ballistic Composite', 'Olive Drab', 'Medium-Large', 'NIJ Level IIIA'),
--     (25, '0.35 kg', 'Kevlar/Leather', 'Black', 'Medium', 'Cut Resistant'),
--     (26, '0.9 kg', 'Butyl Rubber/Plastic', 'Dark Green', 'One Size', 'NBC Protective');




-- -- Military Equipment
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('M249 Squad Automatic Weapon (SAW)', 'military_equipment', 0.2286, 'static/images/m249_saw.jpg', 'Light machine gun used by infantry for suppressive fire and support.'),
-- ('Javelin Anti-tank Missile', 'military_equipment', 1.2857, 'static/images/javelin_missile.jpeg', 'Man-portable fire-and-forget anti-tank missile system.'),
-- ('M240B Machine Gun', 'military_equipment', 0.2857, 'static/images/m240b_machine_gun.jpg', 'General-purpose machine gun for infantry and vehicle-mounted use.'),
-- ('Humvee Armored Vehicle', 'military_equipment', 2.2857, 'static/images/humvee_armored_vehicle.jpeg', 'Light tactical vehicle designed for military operations and transport.'),
-- ('M203 Grenade Launcher', 'military_equipment', 0.0714, 'static/images/m203_grenade_launcher.jpg', 'Under-barrel grenade launcher attachment for rifles.'),
-- ('Aircraft Carrier Model (training/display)', 'military_equipment', 0.0057, 'static/images/aircraft_carrier_model.jpeg', 'Scale model of an aircraft carrier used for training and display purposes.');

--     INSERT INTO Military_Equipment (serialNum, weight, country_of_origin, effective_range, crew_required, year_of_service) VALUES
--     (27, '10.1 kg', 'USA', '800 m', 1, '1984'),
--     (28, '22.3 kg (launcher)', 'USA', '2500 m', 1, '1996'),
--     (29, '12.5 kg', 'USA', '1200 m', 2, '1977'),
--     (30, '4080 kg', 'USA', '600 km', 2, '1985'),
--     (31, '1.4 kg', 'USA', '400 m (grenade)', 1, '1969'),
--     (32, '65 kg', 'USA', 'Display/Training', 0, '2020');


-- UPDATE Products
-- SET image = 'static/images/aircraft_carrier_model.jpg'
-- WHERE serialNum = 32;


-- DROP TABLE IF EXISTS Prescription_Meds;
-- CREATE TABLE Prescription_Meds (
--     serialNum INTEGER,
--     drug_name TEXT,
--     dosage TEXT,
--     form TEXT,
--     controlled_substance BOOLEAN,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Prescription_Meds (serialNum, drug_name, dosage, form) VALUES
-- (32, 'Oxycodone', '10mg', 'Tablet'),
-- (33, 'Adderall XR', '20mg', 'Capsule');

-- DROP TABLE IF EXISTS Illicit_Drugs;
-- CREATE TABLE Illicit_Drugs (
--     serialNum INTEGER,
--     substance TEXT,
--     purity_percentage REAL,
--     packaging TEXT,
--     street_price_per_gram REAL,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Illicit_Drugs (serialNum, substance, purity_percentage, packaging, street_price_per_gram) VALUES
-- (34, 'Cocaine', 82.5, 'Ziplock Bag', 50.0),
-- (35, 'Methamphetamine', 95.0, 'Foil Wrap', 40.0);


-- DROP TABLE IF EXISTS Research_Chemicals;
-- CREATE TABLE Research_Chemicals (
--     serialNum INTEGER,
--     chemical_name TEXT,
--     purity TEXT,
--     quantity TEXT,
--     hazard_level TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Research_Chemicals (serialNum, chemical_name, purity, quantity, hazard_level) VALUES
-- (36, '2C-B', '99%', '5 grams', 'Moderate'),
-- (37, 'MXE', '98%', '10 grams', 'High');

-- DROP TABLE IF EXISTS Herbal_Natural_Substances;
-- CREATE TABLE Herbal_Natural_Substances (
--     serialNum INTEGER,
--     substance_name TEXT,
--     origin_country TEXT,
--     form TEXT,
--     typical_use TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Herbal_Natural_Substances (serialNum, substance_name, origin_country, form, typical_use) VALUES
-- (38, 'Kratom', 'Indonesia', 'Powder', 'Stimulant/Pain Relief'),
-- (39, 'Salvia Divinorum', 'Mexico', 'Leaves', 'Psychoactive');

-- DROP TABLE IF EXISTS Hacking_Cyber_Services;
-- CREATE TABLE Hacking_Cyber_Services (
--     serialNum INTEGER,
--     service_name TEXT,
--     description TEXT,
--     typical_duration TEXT,
--     risk_level TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Hacking_Cyber_Services (serialNum, service_name, description, typical_duration, risk_level) VALUES
-- (40, 'DDoS Attack', 'Distributed denial of service attack on target website', '24 hours', 'High'),
-- (41, 'Email Phishing', 'Crafted phishing emails to collect credentials', '1 week', 'Medium');


-- DROP TABLE IF EXISTS Forged_Documents;
-- CREATE TABLE Forged_Documents (
--     serialNum INTEGER,
--     document_type TEXT,
--     country_of_issue TEXT,
--     quality TEXT,
--     delivery_time TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Forged_Documents (serialNum, document_type, country_of_issue, quality, delivery_time) VALUES
-- (42, 'Passport', 'USA', 'High Quality', '7 days'),
-- (43, 'Driver’s License', 'Germany', 'Standard', '3 days');

-- DROP TABLE IF EXISTS Contractors_Protection;
-- CREATE TABLE Contractors_Protection (
--     serialNum INTEGER,
--     contractor_type TEXT,
--     experience_years INTEGER,
--     equipment_level TEXT,
--     availability TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Contractors_Protection (serialNum, contractor_type, experience_years, equipment_level, availability) VALUES
-- (44, 'Bodyguard', 10, 'High', 'Immediate'),
-- (45, 'Hacker-for-hire', 5, 'Advanced', 'Within 48 hours');

-- DROP TABLE IF EXISTS Blackmail_Info_Leaks;
-- CREATE TABLE Blackmail_Info_Leaks (
--     serialNum INTEGER,
--     target_name TEXT,
--     info_type TEXT,
--     leverage_level TEXT,
--     anonymity_guarantee TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Blackmail_Info_Leaks (serialNum, target_name, info_type, leverage_level, anonymity_guarantee) VALUES
-- (46, 'Corporate CEO', 'Financial records', 'High', 'Full'),
-- (47, 'Politician', 'Scandal photos', 'Medium', 'Partial');

-- DROP TABLE IF EXISTS Safehouses;
-- CREATE TABLE Safehouses (
--     serialNum INTEGER,
--     location TEXT,
--     capacity INTEGER,
--     security_level TEXT,
--     amenities TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Safehouses (serialNum, location, capacity, security_level, amenities) VALUES
-- (48, 'Berlin', 4, 'High', 'CCTV, Guard Dogs'),
-- (49, 'Bangkok', 6, 'Medium', 'Safe Room, Backup Power');


-- DROP TABLE IF EXISTS Underground_Bunkers;
-- CREATE TABLE Underground_Bunkers (
--     serialNum INTEGER,
--     location TEXT,
--     depth_meters INTEGER,
--     duration_capacity_days INTEGER,
--     equipment TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Underground_Bunkers (serialNum, location, depth_meters, duration_capacity_days, equipment) VALUES
-- (50, 'Nevada Desert', 30, 90, 'Air Filtration, Food Storage'),
-- (51, 'Siberia', 45, 120, 'Self-Sustaining Power, Communications');

-- DROP TABLE IF EXISTS Off_grid_Cabins;
-- CREATE TABLE Off_grid_Cabins (
--     serialNum INTEGER,
--     location TEXT,
--     size_sq_meters INTEGER,
--     utilities TEXT,
--     access_difficulty TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Off_grid_Cabins (serialNum, location, size_sq_meters, utilities, access_difficulty) VALUES
-- (52, 'Alps', 50, 'Solar Panels, Well Water', 'High'),
-- (53, 'Canadian Wilderness', 70, 'Generator, Rainwater Collection', 'Medium');


-- DROP TABLE IF EXISTS Alcohol;
-- CREATE TABLE Alcohol (
--     serialNum INTEGER,
--     type TEXT,
--     brand TEXT,
--     volume_ml INTEGER,
--     alcohol_percentage REAL,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Alcohol (serialNum, type, brand, volume_ml, alcohol_percentage) VALUES
-- (54, 'Whiskey', 'Macallan 18', 700, 43.0),
-- (55, 'Vodka', 'Beluga', 500, 40.0);


-- DROP TABLE IF EXISTS Rare_Cigars_Tobacco;
-- CREATE TABLE Rare_Cigars_Tobacco (
--     serialNum INTEGER,
--     cigar_brand TEXT,
--     origin TEXT,
--     quantity INTEGER,
--     packaging TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Rare_Cigars_Tobacco (serialNum, cigar_brand, origin, quantity, packaging) VALUES
-- (56, 'Cohiba Behike', 'Cuba', 20, 'Wooden Box'),
-- (57, 'Davidoff', 'Dominican Republic', 10, 'Humidor Box');

-- DROP TABLE IF EXISTS Jewelry_Rare_Gems;
-- CREATE TABLE Jewelry_Rare_Gems (
--     serialNum INTEGER,
--     item_type TEXT,
--     gemstone TEXT,
--     carat_weight REAL,
--     origin TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Jewelry_Rare_Gems (serialNum, item_type, gemstone, carat_weight, origin) VALUES
-- (58, 'Necklace', 'Diamond', 3.5, 'South Africa'),
-- (59, 'Ring', 'Sapphire', 2.1, 'Sri Lanka');

-- DROP TABLE IF EXISTS Artifacts_Antiquities;
-- CREATE TABLE Artifacts_Antiquities (
--     serialNum INTEGER,
--     item_name TEXT,
--     period TEXT,
--     origin_country TEXT,
--     condition TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Artifacts_Antiquities (serialNum, item_name, period, origin_country, condition) VALUES
-- (60, 'Ancient Vase', 'Han Dynasty', 'China', 'Good'),
-- (61, 'Roman Coin', '1st Century AD', 'Italy', 'Excellent');

-- DROP TABLE IF EXISTS Exotic_Animals;
-- CREATE TABLE Exotic_Animals (
--     serialNum INTEGER,
--     species TEXT,
--     age INTEGER,
--     origin TEXT,
--     legal_status TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Exotic_Animals (serialNum, species, age, origin, legal_status) VALUES
-- (62, 'Macaw Parrot', 3, 'Brazil', 'Illegal'),
-- (63, 'Fennec Fox', 2, 'Sahara', 'Legal');

-- DROP TABLE IF EXISTS Designer_Clothes;
-- CREATE TABLE Designer_Clothes (
--     serialNum INTEGER,
--     brand TEXT,
--     item_type TEXT,
--     size TEXT,
--     color TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Designer_Clothes (serialNum, brand, item_type, size, color) VALUES
-- (64, 'Gucci', 'Jacket', 'L', 'Black'),
-- (65, 'Prada', 'Dress', 'M', 'Red');

-- DROP TABLE IF EXISTS Software_Keys_Licenses;
-- CREATE TABLE Software_Keys_Licenses (
--     serialNum INTEGER,
--     software_name TEXT,
--     license_type TEXT,
--     expiry_date TEXT,
--     key_code TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Software_Keys_Licenses (serialNum, software_name, license_type, expiry_date, key_code) VALUES
-- (66, 'Adobe Photoshop', 'Annual', '2026-12-31', 'XXXX-XXXX-XXXX-1234'),
-- (67, 'Microsoft Office', 'Lifetime', 'N/A', 'YYYY-YYYY-YYYY-5678');


-- DROP TABLE IF EXISTS Malware_Exploits;
-- CREATE TABLE Malware_Exploits (
--     serialNum INTEGER,
--     malware_name TEXT,
--     exploit_type TEXT,
--     target_platform TEXT,
--     complexity_level TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Malware_Exploits (serialNum, malware_name, exploit_type, target_platform, complexity_level) VALUES
-- (68, 'Emotet', 'Trojan', 'Windows', 'High'),
-- (69, 'Spectre', 'Hardware Exploit', 'CPU', 'Very High');

-- DROP TABLE IF EXISTS Stolen_Data;
-- CREATE TABLE Stolen_Data (
--     serialNum INTEGER,
--     data_type TEXT,
--     source TEXT,
--     size_gb REAL,
--     sensitivity_level TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Stolen_Data (serialNum, data_type, source, size_gb, sensitivity_level) VALUES
-- (70, 'Credit Card Dump', 'Bank XYZ', 3.5, 'High'),
-- (71, 'Employee Records', 'Tech Company', 12.0, 'Medium');

-- DROP TABLE IF EXISTS Burner_Phones_SIM_Cards;
-- CREATE TABLE Burner_Phones_SIM_Cards (
--     serialNum INTEGER,
--     device_model TEXT,
--     sim_type TEXT,
--     prepaid_balance REAL,
--     network TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Burner_Phones_SIM_Cards (serialNum, device_model, sim_type, prepaid_balance, network) VALUES
-- (72, 'Nokia 105', 'Prepaid SIM', 20.0, 'T-Mobile'),
-- (73, 'Samsung Galaxy', 'Prepaid SIM', 15.0, 'AT&T');

-- DROP TABLE IF EXISTS Encrypted_Devices;
-- CREATE TABLE Encrypted_Devices (
--     serialNum INTEGER,
--     device_type TEXT,
--     encryption_type TEXT,
--     storage_capacity_gb INTEGER,
--     battery_life_hours INTEGER,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Encrypted_Devices (serialNum, device_type, encryption_type, storage_capacity_gb, battery_life_hours) VALUES
-- (74, 'Encrypted Phone', 'AES-256', 128, 24),
-- (75, 'Encrypted USB Drive', 'AES-256', 256, NULL);


-- DROP TABLE IF EXISTS Random;
-- CREATE TABLE Random (
--     serialNum INTEGER,
--     item_name TEXT,
--     description TEXT,
--     rarity TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Random (serialNum, item_name, description, rarity) VALUES
-- (76, 'Antique Compass', 'Brass compass from 19th century', 'Rare'),
-- (77, 'Mysterious Artifact', 'Unknown origin and use', 'Unique');

-- DROP TABLE IF EXISTS Curiosities;
-- CREATE TABLE Curiosities (
--     serialNum INTEGER,
--     item_name TEXT,
--     origin TEXT,
--     significance TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Curiosities (serialNum, item_name, origin, significance) VALUES
-- (78, 'Shrunken Head', 'Amazon', 'Cultural Artifact'),
-- (79, 'Fossilized Insect', 'Baltic Amber', 'Scientific Interest');

-- DROP TABLE IF EXISTS Black_Market_Organics;
-- CREATE TABLE Black_Market_Organics (
--     serialNum INTEGER,
--     product_name TEXT,
--     weight_grams REAL,
--     source TEXT,
--     legality_status TEXT,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Black_Market_Organics (serialNum, product_name, weight_grams, source, legality_status) VALUES
-- (80, 'Psychedelic Mushrooms', 100.0, 'Various', 'Illegal'),
-- (81, 'Cocaine Plant Extract', 50.0, 'South America', 'Illegal');


-- DROP TABLE IF EXISTS Lottery_Access_Codes;
-- CREATE TABLE Lottery_Access_Codes (
--     serialNum INTEGER,
--     lottery_name TEXT,
--     code TEXT,
--     expiry_date TEXT,
--     success_rate REAL,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Lottery_Access_Codes (serialNum, lottery_name, code, expiry_date, success_rate) VALUES
-- (82, 'Powerball', 'X7Y9Z1', '2026-12-31', 0.01),
-- (83, 'Mega Millions', 'A4B3C2', '2026-11-30', 0.02);

-- DROP TABLE IF EXISTS Underground_Events;
-- CREATE TABLE Underground_Events (
--     serialNum INTEGER,
--     event_name TEXT,
--     location TEXT,
--     date TEXT,
--     entry_fee REAL,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Underground_Events (serialNum, event_name, location, date, entry_fee) VALUES
-- (84, 'Secret Rave', 'Berlin', '2025-08-15', 100.0),
-- (85, 'Illegal Fight Night', 'Las Vegas', '2025-09-01', 500.0);

-- DROP TABLE IF EXISTS Custom_Requests;
-- CREATE TABLE Custom_Requests (
--     serialNum INTEGER,
--     request_description TEXT,
--     estimated_price REAL,
--     delivery_time_days INTEGER,
--     FOREIGN KEY(serialNum) REFERENCES Products(serialNum)
-- );

-- INSERT INTO Custom_Requests (serialNum, request_description, estimated_price, delivery_time_days) VALUES
-- (86, 'Custom encrypted messaging app', 5000.0, 30),
-- (87, 'Tailored protection detail', 12000.0, 7);


-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('Oxycodone', 'Prescription Meds', 0.008333, 'static/images/prescription_meds_ox.jpg', 'Controlled pain relief medication'),
-- ('Adderall XR', 'Prescription Meds', 0.007333, 'static/images/adderal_xr.jpg', 'Extended-release ADHD medication'),
-- ('Cocaine', 'Illicit Drugs', 0.050000, 'static/images/cocaine.jpg', 'High purity street cocaine'),
-- ('Methamphetamine', 'Illicit Drugs', 0.040000, 'static/images/meth.jpg', 'Pure meth for stimulant use'),
-- ('2C-B', 'Research Chemicals', 0.010000, 'static/images/2c_b.jpg', 'Psychedelic research chemical'),
-- ('MXE', 'Research Chemicals', 0.011667, 'static/images/MXE.jpg', 'Dissociative research chemical'),
-- ('Kratom', 'Herbal/Natural Substances', 0.002500, 'static/images/kratom.jpg', 'Natural stimulant and pain relief'),
-- ('Salvia Divinorum', 'Herbal/Natural Substances', 0.001667, 'static/images//Salvia_Divinorum.jpg', 'Psychoactive plant leaves'),
-- ('DDoS Attack', 'Hacking/Cyber Services', 0.066667, 'static/images/DDOS.jpg', 'Targeted denial of service attack'),
-- ('Email Phishing', 'Hacking/Cyber Services', 0.050000, 'static/images/phishing.jpg', 'Phishing email campaign'),
-- ('Passport', 'Forged Documents', 0.166667, 'static/images/forged_passports.jpg', 'High-quality forged passport'),
-- ('Drivers License', 'Forged Documents', 0.100000, 'static/images/licenses.jpg', 'Forged driver license'),
-- ('Bodyguard', 'Contractors/Protection', 0.333333, 'static/images/bodyguard.jpg', 'Experienced personal bodyguard'),
-- ('Hacker-for-hire', 'Contractors/Protection', 0.266667, 'static/images/hacker.jpg', 'Skilled hacker-for-hire'),
-- ('Corporate CEO Blackmail', 'Blackmail/Info Leaks', 0.500000, 'static/images/blackmail_info.jpg', 'Financial leverage on CEO'),
-- ('Politician Blackmail', 'Blackmail/Info Leaks', 0.400000, 'static/images/blackmail_info.jpg', 'Scandal photos of politician'),
-- ('Safehouse Berlin', 'Safehouses', 0.833333, 'static/images/safehouses.jpg', 'Secure safehouse with CCTV'),
-- ('Safehouse Bangkok', 'Safehouses', 0.600000, 'static/images/safehouses.jpg', 'Safehouse with backup power'),
-- ('Nevada Desert Bunker', 'Underground Bunkers', 3.333333, 'static/images/underground_bunkers.jpg', 'Deep bunker with air filtration'),
-- ('Siberia Bunker', 'Underground Bunkers', 4.000000, 'static/images/underground_bunkers.jpg', 'Self-sustaining bunker in Siberia'),
-- ('Alps Off-grid Cabin', 'Off-grid Cabins', 5.000000, 'static/images/offgrid_cabins.jpg', 'Remote cabin with solar power'),
-- ('Canadian Wilderness Cabin', 'Off-grid Cabins', 4.333333, 'static/images/offgrid_cabins.jpg', 'Cabin with generator and rainwater'),
-- ('Macallan 18 Whiskey', 'Alcohol', 0.020000, 'static/images/macallan.jpg', 'Rare 18 year old whiskey'),
-- ('Cohiba Cigar', 'Rare Cigars & Tobacco', 0.013333, 'static/images/Cohiba_Cigar.jpg', 'Rare Cuban cigar'),
-- ('Diamond Necklace', 'Jewelry / Rare Gems', 0.666667, 'static/images/diamonds.jpg', '25 carat diamond necklace'),
-- ('Ancient Roman Coin', 'Artifacts / Antiquities', 0.400000, 'static/images/roman_coins.jpg', 'Coin from Roman Empire era'),
-- ('Exotic Parrot', 'Exotic Animals', 0.166667, 'static/images/parrots.jpg', 'Colorful tropical parrot'),
-- ('Designer Leather Jacket', 'Designer Clothes', 0.040000, 'static/images/jacket.jpg', 'Limited edition leather jacket'),
-- ('Adobe Photoshop License', 'Software Keys / Licenses', 0.020000, 'static/images/adobe.jpg', 'Annual license for Adobe Photoshop'),
-- ('Emotet Malware', 'Malware / Exploits', 0.050000, 'static/images/emotet.jpg', 'High risk Trojan malware'),
-- ('Credit Card Dump', 'Stolen Data', 0.116667, 'static/images/credit_cards.jpg', 'Large batch of stolen credit cards'),
-- ('Nokia 105', 'Burner Phones / SIM Cards', 0.002500, 'static/images/nokia.jpg', 'Basic prepaid phone'),
-- ('Encrypted Phone', 'Encrypted Devices', 0.030000, 'static/images/enc_phone.jpg', 'Phone with AES-256 encryption'),
-- ('Antique Compass', 'Random', 0.083333, 'static/images/compass.jpg', 'Rare 19th century compass');









