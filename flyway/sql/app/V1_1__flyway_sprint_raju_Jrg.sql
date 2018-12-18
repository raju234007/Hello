CREATE DATABASE IF NOT EXISTS `jenkins_flyway`;

USE `jenkins_flyway`;

/*Table structure for table `raju` */

DROP TABLE IF EXISTS `raju`;

CREATE TABLE raju (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);
