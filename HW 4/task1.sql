-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45) ,
  species VARCHAR(45) ,
  gender ENUM('M', 'F'),
  birth CHAR(10),
  death VARCHAR(10)
);

CREATE TABLE petEvent (
  petname VARCHAR(20),
  eventdate CHAR(10),
  eventtype VARCHAR(45),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (petname,eventdate)
);
