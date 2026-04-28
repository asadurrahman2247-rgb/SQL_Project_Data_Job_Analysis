CREATE TABLE january_jobs AS 
SELECT *
FROM job_postings_fact   
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS 
SELECT *
FROM job_postings_fact   
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS 
SELECT *
FROM job_postings_fact   
WHERE EXTRACT(MONTH FROM job_posted_date) = 3; 

SELECT job_posted_date 
FROM march_jobs  

SELECT 
    job_title_short,
    job_location
FROM job_postings_fact;

/* label new column as follows:
- 'Anywhere' jobs as 'Remote'
-'New York, NY' jobs as 'Local'
- Otherwise 'Onsite'

*/  
SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY    
    location_category;  

/*  
-- CASE Practice Problem
I want to categorize the salaries from each 
job posting. To see if it fits in my desired
 salary range
Put salary into different buckets
Define what's a high, standard, or low salary
 with our own conditions
Why? It is easy to determine which job
 postings are worth looking at based on 
 salary. Bucketing is a common practice 
 in data analysis when viewing categories.
I only want to look at data analyst roles
Order from highest 

-- There were too much null values so i excluded the null using NOT 
*/  

SELECT
    Salary_year_avg,
    CASE
        WHEN salary_year_avg >= 85000 THEN 'High'
        WHEN salary_year_avg BETWEEN 55000 AND 84999 THEN 'Standard'
        WHEN salary_year_avg < 55000 THEN 'Low'
        -- ELSE 'Undifined'
    END AS salary_range
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;