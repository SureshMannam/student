-- DDL Scripts for student application --
-- as long as I've used In-memory data base , so to test application no need to execute this scrits --
-- these scripts only for my sql database --
create database IF NOT EXISTS testdb;
use testdb;
CREATE TABLE IF NOT EXISTS STUDENT (
  ID INTEGER(10) NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(45) NOT NULL,
  ADDRESS VARCHAR(45) DEFAULT NULL,
  GENDER CHAR(1) DEFAULT 'M',
  DOB DATE DEFAULT NULL,
  EMAIL VARCHAR(45) DEFAULT NULL,
  MOBILE VARCHAR(15) DEFAULT NULL, 
  PHONE VARCHAR(15) DEFAULT NULL,  
  PRIMARY KEY  (ID)
) ENGINE=INNODB AUTO_INCREMENT=1;