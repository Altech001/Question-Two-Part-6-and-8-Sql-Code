CREATE DATABASE IF NOT EXISTS vu_hospital;
USE vu_hospital;

-- 1. Table for Geographical Location
CREATE TABLE IF NOT EXISTS geographical_location (
    Location_ID INT PRIMARY KEY,
    Village VARCHAR(100),
    Parish VARCHAR(100),
    Sub_County VARCHAR(100),
    County VARCHAR(100),
    Region VARCHAR(50),
    Population INT,
    Coordinates VARCHAR(100),
    ITN_Coverage DECIMAL(5,2),
    Reported_Cases INT
);

-- 2. Table for Patient Data
CREATE TABLE IF NOT EXISTS patient_data (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Date_of_Birth DATE,
    Phone_Number VARCHAR(15),
    Next_of_Kin VARCHAR(100),
    Location_ID INT,
    Date_Added DATE,
    Update_Date DATE,
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

-- 3. Table for Health Facility
CREATE TABLE IF NOT EXISTS health_facility (
    Facility_ID INT PRIMARY KEY,
    Facility_Name VARCHAR(100),
    Location_ID INT,
    Capacity INT,
    Contact_Details VARCHAR(100),
    Date_Added DATE,
    Date_Updated DATE,
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

-- 4. Table for Visit Records
CREATE TABLE IF NOT EXISTS visit_record (
    Visit_ID INT PRIMARY KEY,
    Patient_ID INT,
    Facility_ID INT,
    Visit_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

-- 5. Table for Treatment
CREATE TABLE IF NOT EXISTS treatment (
    Treatment_ID INT PRIMARY KEY,
    Treatment_Name VARCHAR(50),
    Description TEXT,
    Dosage VARCHAR(50),
    Side_Effects TEXT,
    Visit_ID INT,
    FOREIGN KEY (Visit_ID) REFERENCES visit_record(Visit_ID)
);

-- 6. Table for Laboratory Tests
CREATE TABLE IF NOT EXISTS laboratory_tests (
    Test_ID INT PRIMARY KEY,
    Test_Type VARCHAR(50),
    Test_Result VARCHAR(50),
    Technician_ID INT,
    Visit_ID INT,
    FOREIGN KEY (Visit_ID) REFERENCES visit_record(Visit_ID)
);

-- 7. Table for Resource Management
CREATE TABLE IF NOT EXISTS resource (
    Resource_ID INT PRIMARY KEY,
    Facility_ID INT,
    Resource_Type VARCHAR(50),
    Quantity INT,
    Date_Added DATE,
    Update_Date DATE,
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

-- 8. Table for Supply Chain
CREATE TABLE IF NOT EXISTS supply_chain (
    Supply_ID INT PRIMARY KEY,
    Facility_ID INT,
    Resource_ID INT,
    Shipment_Date DATE,
    Expected_Arrival_Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Resource_ID) REFERENCES resource(Resource_ID)
);

-- 9. Table for Malaria Cases
CREATE TABLE IF NOT EXISTS malaria_cases (
    Case_ID INT PRIMARY KEY,
    Patient_ID INT,
    Facility_ID INT,
    Date_of_Diagnosis DATE,
    Type_of_Malaria VARCHAR(50),
    Treatment_ID INT,
    Outcome_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES treatment(Treatment_ID)
);

-- 10. Table for Epidemiological Data
CREATE TABLE IF NOT EXISTS epidemiological_data (
    Data_ID INT PRIMARY KEY,
    Location_ID INT,
    Recorded_Date DATE,
    Cases_Per_Thousand_People INT,
    ITN_Coverage DECIMAL(5,2),
    FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

-- 11. Table for Treatment Outcome
CREATE TABLE IF NOT EXISTS treatment_outcome (
    Outcome_ID INT PRIMARY KEY,
    Outcome_Name VARCHAR(50),
    Outcome_Description TEXT,
    Date_Added DATE,
    Update_Date DATE
);

-- 12. Table for User Role
CREATE TABLE IF NOT EXISTS user_role (
    Role_ID INT PRIMARY KEY,
    Role_Name VARCHAR(50),
    Role_Description TEXT
);

-- 13. Table for User Management
CREATE TABLE IF NOT EXISTS user (
    User_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Role_ID INT,
    Username VARCHAR(50),
    Password VARCHAR(100),
    Date_Added DATE,
    FOREIGN KEY (Role_ID) REFERENCES user_role(Role_ID)
);

-- 14. Table for System Log
CREATE TABLE IF NOT EXISTS system_log (
    Log_ID INT PRIMARY KEY,
    User_ID INT,
    Activity TEXT,
    Timestamp DATETIME,
    IP_Address VARCHAR(15),
    FOREIGN KEY (User_ID) REFERENCES user(User_ID)
);

-- 15. Table for Facility Type
CREATE TABLE IF NOT EXISTS facility_type (
    Facility_Type_ID INT PRIMARY KEY,
    Type_Name VARCHAR(50),
    Description TEXT,
    Date_Added DATE,
    Date_Updated DATE
);

-- 16. Table for Referral Records
CREATE TABLE IF NOT EXISTS referral (
    Referral_ID INT PRIMARY KEY,
    Referred_From INT,
    Referred_To INT,
    Patient_ID INT,
    Referral_Date DATE,
    Reason TEXT,
    FOREIGN KEY (Referred_From) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Referred_To) REFERENCES health_facility(Facility_ID),
    FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID)
);
