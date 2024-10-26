-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet (
  petname varchar (20),
  owner varchar (45),
  species varchar (45),
  gender varchar (15),
  birth date,
  death date
);

CREATE TABLE petEvent (
  petname varchar (20),
  eventdate date,
  eventtype varchar (15),
  remark varchar (255),
  FOREIGN KEY petEvent,
  PRIMARY KEY petname
);
