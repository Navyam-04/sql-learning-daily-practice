============================================================================
-- Problem: Patients With a Condition
--
-- Table: Patients
--   - patient_id    INT        : Primary key
--   - patient_name  VARCHAR    : Name of the patient
--   - conditions    VARCHAR    : Space-separated list of medical conditions
--
-- Requirement:
--   - Return all patients who have a condition where the name starts with "DIAB1".
--   - "DIAB1" may appear at the start or after a space in the conditions string.
--   - Must NOT match conditions like "DIAB201" or "ADIAB100" (partial matches).
--   - Output columns: patient_id, patient_name, conditions.
--
-- Expected Output:
--   patient_id | patient_name | conditions
--   -----------+--------------+------------------
--   <int>      | <string>     | <string>
--
-- Notes:
--   - We simulate "word boundaries" in SQL Server by checking two cases:
--       1. Condition starts with "DIAB1"
--       2. Condition contains " DIAB1" (space before it)
============================================================================

-- Drop the Patients table if it already exists
IF OBJECT_ID('dbo.Patients', 'U') IS NOT NULL
    DROP TABLE dbo.Patients;
GO

-- Create the Patients table
CREATE TABLE Patients (
    patient_id   INT PRIMARY KEY,
    patient_name VARCHAR(50),
    conditions   VARCHAR(255)
);
GO

-- Insert sample data
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES
(1, 'George', 'ACNE DIAB100'),
(2, 'Alain',  'DIAB201'),
(3, 'Bob',    'DIAB100 MYOP'),
(4, 'George', 'ACNE DIAB100');
GO

-- Verify inserted data
SELECT * FROM Patients;
GO

-- =======================
-- Solution Query
-- =======================
/*
Logic:
  - Match patients where conditions start with 'DIAB1'       --> LIKE 'DIAB1%'
  - Or conditions have ' DIAB1' preceded by a space          --> LIKE '% DIAB1%'
  - This ensures we match only correct words, not partial IDs
*/
SELECT patient_id,
       patient_name,
       conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';
GO
