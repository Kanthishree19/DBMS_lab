CREATE TABLE PatientRecords (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    bill_amount DECIMAL(10,2),
    admission_date DATE,
    discharge_date DATE
);

INSERT INTO PatientRecords VALUES
(301, 'Ananya', 12500.50, '2026-01-10', '2026-01-15'),
(302, 'Rahul', 18750.75, '2026-02-05', '2026-02-12'),
(303, 'Meera', 9500.00, '2026-03-18', '2026-03-22'),
(304, 'Karthik', 22000.25, '2026-04-01', '2026-04-10');


SELECT patient_name,
       CAST(bill_amount AS SIGNED) AS Converted_Bill
FROM PatientRecords;

SELECT patient_name,
       CONVERT(patient_id, CHAR) AS Patient_ID_Text
FROM PatientRecords;

SELECT CAST('2026-10-13' AS DATE) AS Converted_Date;

SELECT CAST('4567.89' AS DECIMAL(10,2)) AS Converted_Amount;


SELECT CURRENT_DATE() AS Today;

SELECT NOW() AS Current_Date_Time;

SELECT patient_name,
       YEAR(admission_date) AS Admission_Year
FROM PatientRecords;

SELECT patient_name,
       MONTH(admission_date) AS Admission_Month
FROM PatientRecords;

SELECT patient_name,
       DAY(admission_date) AS Admission_Day
FROM PatientRecords;

SELECT patient_name,
       DATE_ADD(admission_date, INTERVAL 7 DAY) AS After_7_Days
FROM PatientRecords;

SELECT patient_name,
       DATE_SUB(admission_date, INTERVAL 3 DAY) AS Before_3_Days
FROM PatientRecords;

SELECT patient_name,
       DATEDIFF(discharge_date, admission_date) AS Stay_Days
FROM PatientRecords;

SELECT patient_name,
       DATE_FORMAT(admission_date, '%d-%m-%Y') AS Formatted_Admission_Date
FROM PatientRecords;

SELECT patient_name,
       LAST_DAY(admission_date) AS Month_End_Date
FROM PatientRecords;

SELECT patient_name,
       DAYNAME(admission_date) AS Admission_Weekday
FROM PatientRecords;

SELECT patient_name,
       MONTHNAME(admission_date) AS Admission_Month_Name
FROM PatientRecords;

SELECT * FROM PatientRecords;
