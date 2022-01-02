-- CREATING DATABASE --
-- ***************** --

USE master
GO

DROP DATABASE IF EXISTS DemoDB
CREATE DATABASE DemoDB
GO

USE DemoDB
GO

-- CREATING TABLES --
-- *************** --

-- Creating 'person' table

DROP TABLE IF EXISTS dbo.person
CREATE TABLE dbo.person
(
	id int NOT NULL IDENTITY(100,1) PRIMARY KEY,
	name nvarchar(50) NOT NULL,
	age int,
	gender_id int,
	city nvarchar(50),
	email nvarchar(50) NOT NULL
)

-- creating gender table

DROP TABLE IF EXISTS dbo.gender
CREATE TABLE dbo.gender
(
	gender_id int NOT NULL PRIMARY KEY,
	gender nvarchar(50) NOT NULL,
)

-- creating 'characters' table

DROP TABLE IF EXISTS dbo.characters
CREATE TABLE dbo.characters
(
	id int NOT NULL IDENTITY(100,1) PRIMARY KEY,
	name nvarchar(50) NOT NULL,
	gender nvarchar(20) NOT NULL,
	city nvarchar(50) NOT NULL,
	salary int NOT NULL
)

-- ADDING TABLE CONSTRAINTS --
-- ************************ --

-- Adding foreign key constraints

ALTER TABLE dbo.person ADD CONSTRAINT FK_person_gender_id
FOREIGN KEY (gender_id) REFERENCES dbo.gender(gender_id)

-- Adding default constraint to 'gender_id' column in 'persons' table

ALTER TABLE dbo.person ADD CONSTRAINT DF_person_gender_id
DEFAULT 3 FOR gender_id

-- Adding check constraint to 'age' column in 'persons' table

ALTER TABLE dbo.person ADD CONSTRAINT CK_person_age
CHECK (age > 0 AND age < 150)

-- Adding unique constraint on 'gender' column in 'gender' table

ALTER TABLE dbo.gender ADD CONSTRAINT UQ_gender_gender
UNIQUE(gender)

-- INSERTING DATA INTO TABLES --
-- ************************** --

-- Inserting data into 'gender' table

INSERT INTO dbo.gender(gender_id,gender) VALUES (1,'Male')
INSERT INTO dbo.gender(gender_id,gender) VALUES (2,'Female')
INSERT INTO dbo.gender(gender_id,gender) VALUES (3,'Others')

-- Inserting data into 'person' table

INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Rockie',58,2,'New York','r@t.com')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Paul',25,3,'Chicago','schasmar1@artisteer.com')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Henka',88,2,'Houston','hhardwicke2$japanpost.jp')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Eolande',58,3,'Los Angeles','erapinett3@irs.gov')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Weston',86,2,'Dallas','wjewke4$desdev.cn')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Bernie',80,2,'Atlanta','bpauly5@ning.com')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Craggy',70,1,'Los Angeles','c@g.fr')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Giordano',65,2,'New York','gburgwyn7@spiegel.de')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Regen',84,3,'Saint Paul','roppery8@diigo.com')
INSERT INTO dbo.person(name,age,gender_id,city,email) VALUES ('Paul',41,2,'Chicago','pbeeson9@newsvine.com')

-- Inserting data into 'characters' table

INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Peter','Male','London',4688)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Mary','Female','New York',3518)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Gwen','Female','Sydney',5424)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Ben','Male','London',3893)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('May','Female','New York',2283)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Norman','Male','Sydney',6338)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Harry','Male','Sydney',5154)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Curt','Male','London',4763)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Betty','Female','New York',5982)
INSERT INTO dbo.characters(name,gender,city,salary) VALUES ('Lucy','Female','London',2395)