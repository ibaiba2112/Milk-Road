-- // USER INFO \\ --
DROP TABLE IF EXISTS UserInfo;
CREATE TABLE UserInfo(
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    birthday DATE,
    username TEXT,
    funds TEXT DEFAULT '0.01234456',
    password TEXT NOT NULL
);