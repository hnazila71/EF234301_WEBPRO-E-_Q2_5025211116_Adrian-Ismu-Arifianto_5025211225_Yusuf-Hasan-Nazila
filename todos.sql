DROP DATABASE IF EXISTS todos;

CREATE DATABASE IF NOT EXISTS todos;

USE todos;

CREATE TABLE users (
user_name VARCHAR(50) NOT NULL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50) ,
password VARCHAR(50)
);

CREATE TABLE todo (
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(50),
description VARCHAR(300),
status BOOLEAN,
target_date VARCHAR(20),
user_name VARCHAR(50),
FOREIGN KEY(user_name) REFERENCES users (user_name)
);

INSERT INTO users VALUES('adrian', 'adrian', 'wanto', 'wantoganteng');
INSERT INTO users VALUES('hasan12', 'hasan', 'iwan', 'hasan123');
INSERT INTO todo (title, description, status, target_date, user_name)
VALUES ('do learning', 'rsbp', true, '2023-07-04', 'adrian');



SELECT * FROM users;
SELECT * FROM todo;
