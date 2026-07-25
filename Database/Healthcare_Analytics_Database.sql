-- Creating the Database

CREATE DATABASE Healthcare_Analytics;
USE Healthcare_Analytics;

-- Creating the Tables

CREATE TABLE PatientRecords (
    PatientID INTEGER PRIMARY KEY,
    Name TEXT,
    Age INTEGER,
    Gender TEXT,
    DiabetesType TEXT,
    LastConsultation DATE,
    HbA1c FLOAT
);

   CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY,
    FullName TEXT,
    DateOfBirth DATE,
    Address TEXT,
    PhoneNumber TEXT,
    Email TEXT,
    MedicalHistorySummary TEXT
);

    CREATE TABLE AppointmentDetails (
    AppointmentID INTEGER PRIMARY KEY,
    PatientID INTEGER,
    AppointmentDate DATE,
    HealthcareProfessional TEXT,
    VisitPurpose TEXT,
    ConsultationNotes TEXT,
    FOREIGN KEY (PatientID) REFERENCES PatientRecords(PatientID)
);

CREATE TABLE HealthcareProfessionals (
    ProfessionalID INTEGER PRIMARY KEY,
    Name TEXT,
    Specialty TEXT,
    ContactInfo TEXT
);

CREATE TABLE MedicationsPrescribed (
 PrescriptionID INTEGER PRIMARY KEY,
    AppointmentID INTEGER,
    MedicationName TEXT,
    Dosage TEXT,
    Instructions TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES AppointmentDetails(AppointmentID)
);

CREATE TABLE Transactions (
    TransactionID INTEGER PRIMARY KEY,
    PatientID INTEGER,
    TransactionDate DATE,
    ServiceProvided TEXT,
    AmountCharged FLOAT,
    FOREIGN KEY (PatientID) REFERENCES PatientRecords(PatientID)
);

-- Inserting Sample Data

INSERT INTO Patients (...);
