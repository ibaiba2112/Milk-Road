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





-- CREATE TABLE DrugDetails (
--     product_id INTEGER,
--     dosage TEXT,
--     ingredients TEXT,
--     side_effects TEXT,
--     -- etc.
--     FOREIGN KEY (product_id) REFERENCES Products(id)
-- );

-- CREATE TABLE PropertyDetails (
--     product_id INTEGER,
--     address TEXT,
--     size TEXT,
--     num_rooms INTEGER,
--     -- etc.
--     FOREIGN KEY (product_id) REFERENCES Products(id)
-- );

-- And so on for Services, Clothes, RandomStuff, etc.

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

UPDATE Products
SET image = '/static/images/AN-M14-TH3-Incendiary-Grenade-Inert-Replica-OTA-2990-copy.jpg'
WHERE serialNum= 13;

-- -- Ammunition
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('7.62×39mm FMJ Ammunition', 'ammunition', 0.00214, 'static/images/762x39mm_ammo.jpeg', 'Standard full metal jacket ammunition for AK-47 rifles.'),
-- ('5.56×45mm NATO Ammunition', 'ammunition', 0.00229, 'static/images/556x45mm_ammo.jpeg', 'Military-grade ammunition used in AR-15 and M16 rifles.'),
-- ('.50 BMG Ammunition', 'ammunition', 0.00357, 'static/images/50bmg_ammo.jpg', 'Large caliber ammunition for heavy machine guns and sniper rifles.'),
-- ('9×19mm Parabellum Ammunition', 'ammunition', 0.00171, 'static/images/9mm_ammo.jpeg', 'Standard pistol and submachine gun ammunition used worldwide.'),
-- ('12 Gauge Buckshot Shells', 'ammunition', 0.00257, 'static/images/12gauge_buckshot_shells.jpeg', 'Shotgun shells loaded with multiple large projectiles for close-range combat.'),
-- ('.338 Lapua Magnum Ammunition', 'ammunition', 0.00857, 'static/images/338_lapua_ammo.jpg', 'High-performance sniper ammunition for long-range precision shooting.');



-- -- Tactical Gear
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('Tactical Vest', 'tactical gear', 0.0143, 'static/images/tactical_vest.jpeg', 'Ballistic-resistant vest with pouches for ammunition and equipment.'),
-- ('Night Vision Goggles', 'tactical gear', 0.0714, 'static/images/night_vision_goggles.jpg', 'Electronic optical devices enabling vision in low-light conditions.'),
-- ('MOLLE Backpack', 'tactical gear', 0.00429, 'static/images/molle_backpack.jpeg', 'Modular backpack system for carrying tactical gear and supplies.'),
-- ('Combat Helmet', 'tactical gear', 0.01, 'static/images/combat_helmet.jpg', 'Ballistic-resistant helmet for protection against firearm projectiles and shrapnel.'),
-- ('Tactical Gloves', 'tactical gear', 0.00229, 'static/images/tactical_gloves.jpeg', 'Reinforced gloves designed for durability and grip in combat situations.'),
-- ('Gas Mask', 'tactical gear', 0.00857, 'static/images/gas_mask.jpg', 'Respiratory protective device for defense against toxic gases and airborne pollutants.');



-- -- Military Equipment
-- INSERT INTO Products (name, category, price, image, description) VALUES
-- ('M249 Squad Automatic Weapon (SAW)', 'military equipment', 0.2286, 'static/images/m249_saw.jpeg', 'Light machine gun used by infantry for suppressive fire and support.'),
-- ('Javelin Anti-tank Missile', 'military equipment', 1.2857, 'static/images/javelin_missile.jpeg', 'Man-portable fire-and-forget anti-tank missile system.'),
-- ('M240B Machine Gun', 'military equipment', 0.2857, 'static/images/m240b_machine_gun.jpg', 'General-purpose machine gun for infantry and vehicle-mounted use.'),
-- ('Humvee Armored Vehicle', 'military equipment', 2.2857, 'static/images/humvee_armored_vehicle.jpeg', 'Light tactical vehicle designed for military operations and transport.'),
-- ('M203 Grenade Launcher', 'military equipment', 0.0714, 'static/images/m203_grenade_launcher.jpg', 'Under-barrel grenade launcher attachment for rifles.'),
-- ('Aircraft Carrier Model (training/display)', 'military equipment', 14.2857, 'static/images/aircraft_carrier_model.jpeg', 'Scale model of an aircraft carrier used for training and display purposes.');
