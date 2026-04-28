/*
7 Question:

Wite a query to find the average salary both 
yearly (salary year avg )and hourly
 (salary hour avg) for job postings that were
  posted after June 1, 2023. 
  
Group the results by Job schedule type

*/


SELECT 
    job_schedule_type,
   AVG(salary_year_avg) AS yearly_avg,
    AVG(salary_hour_avg) AS hourly_avg
FROM
    job_postings_fact 
WHERE 
    job_posted_date  > '2023-06-01' 
GROUP BY 
job_schedule_type;  

--2
SELECT 
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month,
    COUNT(*) AS Job_count
FROM 
    job_postings_fact 
WHERE EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') = 2023 
GROUP BY month 
ORDER BY month;  

-- 3 

SELECT *
FROM job_postings_fact
LIMIT 5;

SELECT * 
FROM company_dim
LIMIT 5; 

SELECT 
    company.name AS companies
FROM company_dim as company
LEFT JOIN job_postings_fact AS job_postings
ON company.company_id = job_postings.company_id 
WHERE job_postings.job_health_insurence = TRUE 
AND EXTRACT(YEAR FROM job_postings.job_posted_date) = 2023 
AND EXTRACT(QUARTER FROM job_postings.job_posted_date) =2 
GROUP BY companies 

(QUARTER FROM job_postings.job_posted_date) = 2  

  SELECT 
    company.name AS companies
FROM company_dim AS company
LEFT JOIN job_postings_fact AS job_postings
    ON company.company_id = job_postings.company_id 
WHERE job_postings.job_health_insurance = TRUE 
  AND EXTRACT(YEAR FROM job_postings.job_posted_date) = 2023 
  AND EXTRACT(QUARTER FROM job_postings.job_posted_date) = 2
GROUP BY companies; 

-- Practice Problem 6 