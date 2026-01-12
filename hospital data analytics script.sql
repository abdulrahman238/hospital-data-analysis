use hospital;
--- view tables
select * from encounters;
select * from patients;
select * from payers;
select * from procedures;
select * from organizations;


-- Total patient encounters per year
SELECT 
    YEAR(Start) AS year,
    COUNT(ï»¿Id) AS total_encounters
FROM encounters
GROUP BY YEAR(Start)
ORDER BY year;

-- Unique patients admitted per year
SELECT 
    YEAR(Start) AS year,
    COUNT(DISTINCT Patient) AS unique_patients
FROM encounters
GROUP BY YEAR(Start)
ORDER BY year;

-- Patients with more than one hospital encounter (readmissions)
SELECT 
    Patient,
    COUNT(ï»¿Id) AS num_encounters
FROM encounters
GROUP BY Patient
HAVING COUNT(ï»¿Id) > 1
ORDER BY num_encounters DESC;

-- Number of readmissions per year
SELECT 
    YEAR(Start) AS year,
    COUNT(*) AS readmissions
FROM encounters
GROUP BY YEAR(Start)
HAVING COUNT(Patient) > 1
ORDER BY year;


-- Total number of procedures
SELECT COUNT(*) AS total_procedures
FROM procedures;




