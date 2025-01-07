-- create database vu_clinc;
-- use vu_clinc;
-- show tables;

-- Table: Location
-- CREATE TABLE Location (
--     Location_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Village VARCHAR(100) NOT NULL,
--     Parish VARCHAR(100) NOT NULL,
--     Sub_County VARCHAR(100) NOT NULL,
--     County VARCHAR(100) NOT NULL,
--     Region VARCHAR(50) NOT NULL,
--     Population INT NOT NULL,
--     Coordinates VARCHAR(100) NOT NULL,
--     Malaria_Risk_Level VARCHAR(50) NOT NULL,
--     Health_Facilities_Count INT NOT NULL,
--     TNT_Coverage DECIMAL(5,2) NOT NULL
-- );

-- -- Table: Facility_Type
-- CREATE TABLE Facility_Type (
--     Facility_Type_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Name VARCHAR(50) NOT NULL,
--     Description TEXT,
--     Date_Added DATE NOT NULL,
--     Date_Updated DATE NOT NULL
-- );

-- -- Table: Health_Facility
-- CREATE TABLE Health_Facility (
--     Facility_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Facility_Name VARCHAR(100) NOT NULL,
--     Location_ID INT NOT NULL,
--     Facility_Type INT NOT NULL,
--     Contact_Details VARCHAR(10) NOT NULL,
--     Date_Added DATE NOT NULL,
--     Facility_Head VARCHAR(100) NOT NULL,
--     FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Facility_Type) REFERENCES Facility_Type(Facility_Type_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Resource_Type
-- CREATE TABLE Resource_Type (
--     Type_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Type_Name VARCHAR(50) NOT NULL,
--     Description TEXT,
--     Date_Added DATE NOT NULL,
--     Added_By INT NOT NULL,
--     Update_Date DATE NOT NULL
-- );

-- -- Table: Resource
-- CREATE TABLE Resource (
--     Resource_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Facility_ID INT NOT NULL,
--     Resource_Type VARCHAR(50) NOT NULL,
--     Quantity INT NOT NULL,
--     Last_Updated_Date DATE NOT NULL,
--     Description TEXT,
--     Date_Added DATE NOT NULL,
--     Update_Date DATE NOT NULL,
--     FOREIGN KEY (Facility_ID) REFERENCES Health_Facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Supply_Chain
-- CREATE TABLE Supply_Chain (
--     Supply_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Resource_ID INT NOT NULL,
--     Facility_ID INT NOT NULL,
--     Quantity_Shipped INT NOT NULL,
--     Expected_Arrival_Date DATE NOT NULL,
--     Shipped_By INT NOT NULL,
--     FOREIGN KEY (Resource_ID) REFERENCES Resource(Resource_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Facility_ID) REFERENCES Health_Facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Treatment
-- CREATE TABLE Treatment (
--     Treatment_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Treatment_Name VARCHAR(50) NOT NULL,
--     Treatment_Description TEXT,
--     Dosage VARCHAR(50) NOT NULL,
--     Side_Effects TEXT,
--     Date_Added DATE NOT NULL,
--     Update_Date DATE NOT NULL
-- );

-- -- Table: Outcome
-- CREATE TABLE Outcome (
--     Outcome_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Outcome_Name VARCHAR(50) NOT NULL,
--     Outcome_Description TEXT
-- );

-- -- Table: Patient
-- CREATE TABLE Patient (
--     Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
--     First_Name VARCHAR(50) NOT NULL,
--     Last_Name VARCHAR(50) NOT NULL,
--     Date_of_Birth DATE NOT NULL,
--     Gender VARCHAR(10) NOT NULL,
--     Phone_Number VARCHAR(15) NOT NULL,
--     Next_of_Kin VARCHAR(100) NOT NULL,
--     Location_ID INT NOT NULL,
--     Date_Added DATE NOT NULL,
--     Update_Date DATE NOT NULL,
--     FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Role
-- CREATE TABLE Role (
--     Role_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Role_Name VARCHAR(50) NOT NULL,
--     Date_Added DATE NOT NULL,
--     Update_Date DATE NOT NULL
-- );

-- -- Table: User
-- CREATE TABLE User (
--     User_ID INT PRIMARY KEY AUTO_INCREMENT,
--     First_Name VARCHAR(50) NOT NULL,
--     Last_Name VARCHAR(50) NOT NULL,
--     Username VARCHAR(50) NOT NULL UNIQUE,
--     Password VARCHAR(100) NOT NULL,
--     Facility_ID INT NOT NULL,
--     Preferred_Name VARCHAR(50),
--     Role_ID INT NOT NULL,
--     FOREIGN KEY (Facility_ID) REFERENCES Health_Facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Role_ID) REFERENCES Role(Role_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Training
-- CREATE TABLE Training (
--     Training_ID INT PRIMARY KEY AUTO_INCREMENT,
--     User_ID INT NOT NULL,
--     Training_Type VARCHAR(100) NOT NULL,
--     Training_Date DATE NOT NULL,
--     Completion_Status VARCHAR(50) NOT NULL,
--     FOREIGN KEY (User_ID) REFERENCES User(User_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Epidemiological_Data
-- CREATE TABLE Epidemiological_Data (
--     Data_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Location_ID INT NOT NULL,
--     Recorded_Date DATE NOT NULL,
--     Cases_Per_Thousand_People INT NOT NULL,
--     Rainfall INT NOT NULL,
--     Average_Temperature DECIMAL(5,2) NOT NULL,
--     Update_Date DATE NOT NULL,
--     Added_By INT NOT NULL,
--     FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Intervention
-- CREATE TABLE Intervention (
--     Intervention_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Type VARCHAR(50) NOT NULL,
--     Location_ID INT NOT NULL,
--     Start_Date DATE NOT NULL,
--     End_Date DATE NOT NULL,
--     Outcome VARCHAR(50) NOT NULL,
--     Date_Added DATE NOT NULL,
--     Update_Date DATE NOT NULL,
--     FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Malaria_Case
-- CREATE TABLE Malaria_Case (
--     Case_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Facility_ID INT NOT NULL,
--     Type_of_Malaria VARCHAR(50) NOT NULL,
--     Treatment_ID INT NOT NULL,
--     Outcome_ID INT NOT NULL,
--     FOREIGN KEY (Facility_ID) REFERENCES Health_Facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Outcome_ID) REFERENCES Outcome(Outcome_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Laboratory_Tests
-- CREATE TABLE Laboratory_Tests (
--     Test_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Case_ID INT NOT NULL,
--     Test_Type VARCHAR(50) NOT NULL,
--     Test_Date DATE NOT NULL,
--     Test_Result VARCHAR(50) NOT NULL,
--     Technician_ID INT NOT NULL,
--     Date_Added DATE NOT NULL,
--     Added_By INT NOT NULL,
--     Update_Date DATE NOT NULL,
--     FOREIGN KEY (Case_ID) REFERENCES Malaria_Case(Case_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Visit_Record
-- CREATE TABLE Visit_Record (
--     Visit_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Patient_ID INT NOT NULL,
--     Visit_Number INT NOT NULL,
--     Visit_Date DATE NOT NULL,
--     Date_Added DATE NOT NULL,
--     Update_Date DATE NOT NULL,
--     Facility_ID INT NOT NULL,
--     FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Facility_ID) REFERENCES Health_Facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: Referral
-- CREATE TABLE Referral (
--     Referral_ID INT PRIMARY KEY AUTO_INCREMENT,
--     Case_ID INT NOT NULL,
--     Referred_From INT NOT NULL,
--     Referred_To INT NOT NULL,
--     Referral_Date DATE NOT NULL,
--     Reason TEXT NOT NULL,
--     Outcome_ID INT NOT NULL,
--     Update_Date DATE NOT NULL,
--     Referred_By INT NOT NULL,
--     FOREIGN KEY (Case_ID) REFERENCES Malaria_Case(Case_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Referred_From) REFERENCES Health_Facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Referred_To) REFERENCES Health_Facility(Facility_ID) ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (Outcome_ID) REFERENCES Outcome(Outcome_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- -- Table: System_Log
-- CREATE TABLE System_Log (
--     Log_ID INT PRIMARY KEY AUTO_INCREMENT,
--     User_ID INT NOT NULL,
--     Activity TEXT NOT NULL,
--     Timestamp DATETIME NOT NULL,
--     IP_Address VARCHAR(15) NOT NULL,
--     Location VARCHAR(100) NOT NULL,
--     FOREIGN KEY (User_ID) REFERENCES User(User_ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );

-- Table for Non-Malaria Diesease;
desc Disease_Type;

CREATE TABLE Disease_Type (
    Disease_ID INT PRIMARY KEY,
    Disease_Name VARCHAR(100),
    Description TEXT
);

ALTER TABLE Treatment 
ADD COLUMN Disease_ID INT, 
ADD FOREIGN KEY (Disease_ID) 
REFERENCES Disease_Type(Disease_ID);






