-- USER INFO
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


-- DROP TABLE IF EXISTS Products;
-- CREATE TABLE Products (
--     serialNum INTEGER PRIMARY KEY AUTOINCREMENT,
--     name TEXT,
--     category TEXT, -- 'weapon', 'drug', 'property', 'service', etc.
--     price REAL,
--     image BLOB,
--     description TEXT
-- );

-- DROP TABLE IF EXISTS Weapons ;
-- CREATE TABLE Weapons (
--     serialNum INTEGER,
--     caliber TEXT,
--     weight TEXT,
--     barrel_length TEXT,
--     -- etc.
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




-- Insert products (weapons)
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

-- Insert matching weapon details (based on serialNum order)
-- INSERT INTO Weapons (serialNum, caliber, weight, barrel_length) VALUES
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




-- ALTER TABLE Products
-- ADD image BLOB;

-- UPDATE Music
-- SET image = 'static/1973_Colt_AR15.jpeg'
-- WHERE artist = 'Yes';
