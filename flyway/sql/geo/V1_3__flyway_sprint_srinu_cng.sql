CREATE DATABASE IF NOT EXISTS `jenkins_flyway`;

USE `jenkins_flyway`;

/*Table structure for table `srinu` */

DROP TABLE IF EXISTS `srinu`;

CREATE TABLE srinu (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);
