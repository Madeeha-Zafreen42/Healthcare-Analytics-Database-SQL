# Medication Analysis

## Objective

Identify the most commonly prescribed medication for each type of diabetes represented in the dataset.

## SQL Query

```sql
-- What's the most common medication for each type of diabetes we treat?

WITH MEDICINE_COUNT AS (
SELECT M.MEDICATIONNAME,P.DIABETESTYPE, COUNT(M.PRESCRIPTIONID) AS MOSTCOMMON
FROM PATIENTRECORDS P 
JOIN AppointmentDetails A ON P.PatientID = A.PatientID
JOIN MedicationsPrescribed M ON A.AppointmentID = M.AppointmentID
GROUP BY M.MEDICATIONNAME,P.DIABETESTYPE 
), 
COMMON_MEDICATIONS AS (
SELECT DIABETESTYPE, MEDICATIONNAME, MOSTCOMMON,
RANK() OVER (PARTITION BY DiabetesType ORDER BY MOSTCOMMON DESC) AS RANKING
FROM MEDICINE_COUNT
)
SELECT DiabetesType, MedicationName
FROM COMMON_MEDICATIONS
WHERE RANkING = 1;
```

## Output

![Medication Analysis](../Images/medication_analysis.png)

## Insight

Within this dataset, the most commonly prescribed medication varies by diabetes type. Simvastatin is the most common medication associated with Gestational diabetes, while Metformin is the most common for both Type 1 and Type 2 diabetes.
