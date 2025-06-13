          -- PRODUCTS --
    -- // MAIN PRODUCT TABLE \\ --
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    serialNum INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    category TEXT, -- 'weapon', 'drug', 'property', 'service', etc.
    price REAL,
    image BLOB,
    description TEXT
);

   -- // QUICK COMMANDS \\ --
-- DROP TABLE Products;



   -- // INSERTS  \\ --

-- Weapons -- --
INSERT INTO Products (name, category, price, image, description) VALUES
-- ('1973 Colt AR-15', 'weapon', 1340, 'static/images/1973_Colt_AR15.jpeg', 'Classic semi-automatic rifle developed from the original M16 platform.'),
-- ('AK-74 Assault Rifle', 'weapon', 1799, 'static/images/Ak74assault.jpg', 'Iconic Soviet assault rifle, widely used in the Eastern Bloc.'),
-- ('Remington Model 700', 'weapon', 515, 'static/images/Remington_Model_700.jpeg', 'Highly accurate bolt-action rifle commonly used for hunting and sniping.'),
-- ('Walther WA 2000', 'weapon', 0.8, 'static/images/Walther_WA_2000.jpeg', 'Extremely rare German sniper rifle, used for high-precision shooting.'),
-- ('Thompson Submachine Gun', 'weapon', 0.4, 'static/images/Campbell_Thompson.jpg', 'Famous WWII-era submachine gun also known as the "Tommy Gun".'),
-- ('MP 40', 'weapon', 0.48, 'static/images/MP_40_AYF_2.JPG', 'German WWII submachine gun favored by infantry and paratroopers.'),
-- ('Grizzly Big Boar', 'weapon', 0.0624, 'static/images/big_boar.jpeg', 'Heavy-duty anti-materiel rifle with massive stopping power.'),
-- ('FN SCAR 17S', 'weapon', 0.056, 'static/images/scar.jpg', 'Modern modular battle rifle used by special operations forces.'),
-- ('Smith & Wesson 686 SSR', 'weapon', 0.032, 'static/images/Smith_Wesson_686_The_Presidents.jpeg', 'Precision revolver known for reliability and performance.'),
('1973 Colt AR-15', 'firearm', 0.0383, 'static/images/1973_Colt_AR15.jpg', 'Classic semi-automatic rifle developed from the original M16 platform.'),
('AK-74 Assault Rifle', 'firearm', 0.0514, 'static/images/Ak74assault.jpg', 'Iconic Soviet assault rifle, widely used in the Eastern Bloc.'),
('Remington Model 700', 'firearm', 0.0147, 'static/images/Remington_Model_700.jpg', 'Highly accurate bolt-action rifle commonly used for hunting and sniping.'),
('Walther WA 2000', 'firearm', 0.2286, 'static/images/Walther_WA_2000.jpg', 'Extremely rare German sniper rifle, used for high-precision shooting.'),
('Thompson Submachine Gun', 'firearm', 0.1143, 'static/images/Campbell_Thompson.jpg', 'Famous WWII-era submachine gun also known as the "Tommy Gun".'),
('MP 40', 'firearm', 0.1371, 'static/images/MP_40_AYF_2.JPG', 'German WWII submachine gun favored by infantry and paratroopers.'),
('Grizzly Big Boar', 'firearm', 0.2429, 'static/images/big_boar.jpg', 'Heavy-duty anti-materiel rifle with massive stopping power.'),
('FN SCAR 17S', 'firearm', 0.1, 'static/images/scar.jpg', 'Modern modular battle rifle used by special operations forces.'),
('Smith & Wesson 686 SSR', 'firearm', 0.0257, 'static/images/Smith_Wesson_686_The_Presidents.jpg', 'Precision revolver known for reliability and performance.');

-- Explosives -- --
INSERT INTO Products (name, category, price, image, description) VALUES
('C-4 Plastic Explosive', 'explosive', 0.0714, 'static/images/COMP-4-1lb-net-block_-_600-copy.jpg', 'Highly stable plastic explosive used in demolition and military operations.'),
('M18 Claymore Mine', 'explosive', 0.0429, 'static/images/Repo-M18-Standing-front.jpg', 'Directional anti-personnel mine used for ambushes and perimeter defense.'),
('M67 Fragmentation Grenade', 'explosive', 0.00857, 'static/images/2000w_q95.jpg', 'Standard-issue hand grenade designed to inflict casualties in enclosed areas.'),
('AN/M14 Incendiary Grenade', 'explosive', 0.0114, 'static/images/AN-M14-TH3-Incendiary-Grenade-Inert-Replica-OTA-2990-copy.jpg', 'Incendiary grenade used for destroying equipment and creating fires.'),
('M15 Anti-tank Mine', 'explosive', 0.0514, 'static/images/tank_mine.jpg', 'Heavy anti-tank mine designed to disable armored vehicles.'),
('RDX Explosive', 'explosive', 0.08, 'static/images/RDX_crystal.jpg', 'Powerful military explosive used in bomb-making and controlled demolitions.');
    
-- Ammunition -- --
INSERT INTO Products (name, category, price, image, description) VALUES
('5.56×45mm NATO Ammo Box (500 rounds)', 'ammunition', 0.015, 'static/images/556_ammo.jpg', 'Standard NATO cartridge for rifles and carbines.'),
('7.62×39mm FMJ Ammo Crate (640 rounds)', 'ammunition', 0.017, 'static/images/762_ammo.jpg', 'Soviet-era rifle cartridge, widely used in AK-pattern rifles.'),
('.50 BMG Sniper Grade Ammo (50 rounds)', 'ammunition', 0.10, 'static/images/50_bmg_ammo.jpg', 'Heavy machine gun and sniper rifle cartridge with extreme range.'),
('9×19mm Parabellum Ammo Pack (250 rounds)', 'ammunition', 0.008, 'static/images/parabellum_ammo.jpg', 'Popular handgun and submachine gun cartridge.'),
('.357 Magnum Hollow Point (100 rounds)', 'ammunition', 0.02, 'static/images/357_ammo.jpg', 'High-powered revolver cartridge for defensive and hunting use.');

-- Tactical Gear -- --
INSERT INTO Products (name, category, price, image, description) VALUES
('Tactical Vest', 'tactical_gear', 0.0143, 'static/images/Combat_Vest.jpg', 'Ballistic-resistant vest with pouches for ammunition and equipment.'),
('Night Vision Goggles', 'tactical_gear', 0.0714, 'static/images/night_vision.jpg', 'Electronic optical devices enabling vision in low-light conditions.'),
('MOLLE Backpack', 'tactical_gear', 0.00429, 'static/images/molle_backpack.jpg', 'Modular backpack system for carrying tactical gear and supplies.'),
('Combat Helmet', 'tactical_gear', 0.01, 'static/images/combat_helmet.jpg', 'Ballistic-resistant helmet for protection against firearm projectiles and shrapnel.'),
('Tactical Gloves', 'tactical_gear', 0.00229, 'static/images/tactical_gloves.jpg', 'Reinforced gloves designed for durability and grip in combat situations.'),
('Gas Mask', 'tactical_gear', 0.00857, 'static/images/gas_mask.jpg', 'Respiratory protective device for defense against toxic gases and airborne pollutants.');


-- Military Equipment -- -- 
INSERT INTO Products (name, category, price, image, description) VALUES
('M249 Squad Automatic Weapon (SAW)', 'military_equipment', 0.2286, 'static/images/m249_saw.jpg', 'Light machine gun used by infantry for suppressive fire and support.'),
('Javelin Anti-tank Missile', 'military_equipment', 1.2857, 'static/images/javelin_missile.jpg', 'Man-portable fire-and-forget anti-tank missile system.'),
('M240B Machine Gun', 'military_equipment', 0.2857, 'static/images/m240b_machine_gun.jpg', 'General-purpose machine gun for infantry and vehicle-mounted use.'),
('Humvee Armored Vehicle', 'military_equipment', 2.2857, 'static/images/humvee_armored_vehicle.jpg', 'Light tactical vehicle designed for military operations and transport.'),
('M203 Grenade Launcher', 'military_equipment', 0.0714, 'static/images/m203_grenade_launcher.jpg', 'Under-barrel grenade launcher attachment for rifles.'),
('Aircraft Carrier Model (training/display)', 'military_equipment', 0.0057, 'static/images/aircraft_carrier_model.jpg', 'Scale model of an aircraft carrier used for training and display purposes.');

-- Everything else -- -- 
INSERT INTO Products (name, category, price, image, description) VALUES
('Oxycodone', 'Prescription Meds', 0.008333, 'static/images/prescription_meds_ox.jpg', 'Controlled pain relief medication'),
('Adderall XR', 'Prescription Meds', 0.007333, 'static/images/adderall_xr.jpg', 'Extended-release ADHD medication'),
('Cocaine', 'Illicit Drugs', 0.050000, 'static/images/cocaine.jpg', 'High purity street cocaine'),
('Methamphetamine', 'Illicit Drugs', 0.040000, 'static/images/meth.jpg', 'Pure meth for stimulant use'),
('2C-B', 'Research Chemicals', 0.010000, 'static/images/2c_b.jpg', 'Psychedelic research chemical'),
('MXE', 'Research Chemicals', 0.011667, 'static/images/MXE.jpg', 'Dissociative research chemical'),
('Kratom', 'Herbal/Natural Substances', 0.002500, 'static/images/kratom.jpg', 'Natural stimulant and pain relief'),
('Salvia Divinorum', 'Herbal/Natural Substances', 0.001667, 'static/images//Salvia_Divinorum.jpg', 'Psychoactive plant leaves'),
('DDoS Attack', 'Hacking/Cyber Services', 0.066667, 'static/images/DDOS.jpg', 'Targeted denial of service attack'),
('Email Phishing', 'Hacking/Cyber Services', 0.050000, 'static/images/phishing.jpg', 'Phishing email campaign'),
('Passport', 'Forged Documents', 0.166667, 'static/images/forged_passports.jpg', 'High-quality forged passport'),
('Drivers License', 'Forged Documents', 0.100000, 'static/images/licenses.jpg', 'Forged driver license'),
('Bodyguard', 'Contractors/Protection', 0.333333, 'static/images/bodyguard.jpg', 'Experienced personal bodyguard'),
('Hacker-for-hire', 'Contractors/Protection', 0.266667, 'static/images/hacker.jpg', 'Skilled hacker-for-hire'),
('Corporate CEO Blackmail', 'Blackmail/Info Leaks', 0.500000, 'static/images/blackmail_info.jpg', 'Financial leverage on CEO'),
('Politician Blackmail', 'Blackmail/Info Leaks', 0.400000, 'static/images/blackmail_info.jpg', 'Scandal photos of politician'),
('Safehouse Berlin', 'Safehouses', 0.833333, 'static/images/safehouses.jpg', 'Secure safehouse with CCTV'),
('Safehouse Bangkok', 'Safehouses', 0.600000, 'static/images/safehouses.jpg', 'Safehouse with backup power'),
('Nevada Desert Bunker', 'Underground Bunkers', 3.333333, 'static/images/underground_bunkers.jpg', 'Deep bunker with air filtration'),
('Siberia Bunker', 'Underground Bunkers', 4.000000, 'static/images/underground_bunkers.jpg', 'Self-sustaining bunker in Siberia'),
('Alps Off-grid Cabin', 'Off-grid Cabins', 5.000000, 'static/images/offgrid_cabins.jpg', 'Remote cabin with solar power'),
('Canadian Wilderness Cabin', 'Off-grid Cabins', 4.333333, 'static/images/offgrid_cabins.jpg', 'Cabin with generator and rainwater'),
('Macallan 18 Whiskey', 'Alcohol', 0.020000, 'static/images/macallan.jpg', 'Rare 18 year old whiskey'),
('Cohiba Cigar', 'Rare Cigars & Tobacco', 0.013333, 'static/images/Cohiba_Cigar.jpg', 'Rare Cuban cigar'),
('Diamond Necklace', 'Jewelry / Rare Gems', 0.666667, 'static/images/diamonds.jpg', '25 carat diamond necklace'),
('Ancient Roman Coin', 'Artifacts / Antiquities', 0.400000, 'static/images/roman_coins.jpg', 'Coin from Roman Empire era'),
('Exotic Parrot', 'Exotic Animals', 0.166667, 'static/images/parrots.jpg', 'Colorful tropical parrot'),
('Designer Leather Jacket', 'Designer Clothes', 0.040000, 'static/images/jacket.jpg', 'Limited edition leather jacket'),
('Adobe Photoshop License', 'Software Keys / Licenses', 0.020000, 'static/images/adobe.jpg', 'Annual license for Adobe Photoshop'),
('Emotet Malware', 'Malware / Exploits', 0.050000, 'static/images/emotet.jpg', 'High risk Trojan malware'),
('Credit Card Dump', 'Stolen Data', 0.116667, 'static/images/credit_cards.jpg', 'Large batch of stolen credit cards'),
('Nokia 105', 'Burner Phones / SIM Cards', 0.002500, 'static/images/nokia.jpg', 'Basic prepaid phone'),
('Encrypted Phone', 'Encrypted Devices', 0.030000, 'static/images/enc_phone.jpg', 'Phone with AES-256 encryption'),
('Antique Compass', 'Random', 0.083333, 'static/images/compass.jpg', 'Rare 19th century compass');
