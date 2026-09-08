DROP DATABASE recruitment_analytics;
CREATE DATABASE recruitment_analytics;
USE recruitment_analytics;
CREATE TABLE company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(50),
    location VARCHAR(50),
    company_size INT
);
SHOW TABLES;
DESC company;
CREATE TABLE candidate (
    candidate_id INT PRIMARY KEY,
    candidate_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    qualification VARCHAR(50),
    experience INT,
    skills VARCHAR(200),
    city VARCHAR(50)
);
SHOW TABLES;
DESC candidate;
USE recruitment_analytics;
CREATE TABLE recruiter (
    recruiter_id INT PRIMARY KEY,
    recruiter_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    company_id INT,
    CONSTRAINT fk_recruiter_company
        FOREIGN KEY (company_id)
        REFERENCES company(company_id)
);
SHOW TABLES;
DESC recruiter;
USE recruitment_analytics;

CREATE TABLE job (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    company_id INT,
    recruiter_id INT,
    location VARCHAR(50),
    salary DECIMAL(10,2),
    experience_required INT,
    job_type VARCHAR(30),
    CONSTRAINT fk_job_company
        FOREIGN KEY (company_id)
        REFERENCES company(company_id),
    CONSTRAINT fk_job_recruiter
        FOREIGN KEY (recruiter_id)
        REFERENCES recruiter(recruiter_id)
);
SHOW TABLES;
DESC job;
USE recruitment_analytics;

CREATE TABLE application (
    application_id INT PRIMARY KEY,
    candidate_id INT,
    job_id INT,
    application_date DATE,
    status VARCHAR(30),
    CONSTRAINT fk_application_candidate
        FOREIGN KEY (candidate_id)
        REFERENCES candidate(candidate_id),
    CONSTRAINT fk_application_job
        FOREIGN KEY (job_id)
        REFERENCES job(job_id)
);
SHOW TABLES;
DESC application;
USE recruitment_analytics;

INSERT INTO company
(company_id, company_name, industry, location, company_size)
VALUES
(1, 'TCS', 'IT Services', 'Hyderabad', 5000),
(2, 'Infosys', 'IT Services', 'Bangalore', 4500),
(3, 'Wipro', 'IT Services', 'Pune', 4000),
(4, 'Accenture', 'Consulting', 'Hyderabad', 6000),
(5, 'Deloitte', 'Consulting', 'Mumbai', 3500),
(6, 'Amazon', 'E-Commerce', 'Bangalore', 7000),
(7, 'Microsoft', 'Technology', 'Hyderabad', 8000),
(8, 'Google', 'Technology', 'Bangalore', 9000),
(9, 'Capgemini', 'IT Services', 'Chennai', 3000),
(10, 'Tech Mahindra', 'IT Services', 'Pune', 2500);
SELECT * FROM company;
USE recruitment_analytics;

INSERT INTO candidate
(candidate_id, candidate_name, email, phone, qualification, experience, skills, city)
VALUES
(1, 'Rahul', 'rahul@gmail.com', '9876543210', 'B.Tech', 2, 'Python, SQL', 'Hyderabad'),
(2, 'Priya', 'priya@gmail.com', '9876543211', 'MCA', 3, 'Java, SQL', 'Bangalore'),
(3, 'Anjali', 'anjali@gmail.com', '9876543212', 'B.Tech', 1, 'Python, Excel', 'Pune'),
(4, 'Kiran', 'kiran@gmail.com', '9876543213', 'B.Sc', 4, 'Java, SQL', 'Chennai'),
(5, 'Sneha', 'sneha@gmail.com', '9876543214', 'MCA', 2, 'Python, Power BI', 'Hyderabad'),
(6, 'Arjun', 'arjun@gmail.com', '9876543215', 'B.Tech', 5, 'AWS, Python', 'Mumbai'),
(7, 'Divya', 'divya@gmail.com', '9876543216', 'B.Tech', 3, 'SQL, Power BI', 'Bangalore'),
(8, 'Vikram', 'vikram@gmail.com', '9876543217', 'MCA', 6, 'Python, Machine Learning', 'Hyderabad'),
(9, 'Pooja', 'pooja@gmail.com', '9876543218', 'B.Tech', 1, 'SQL, Excel', 'Pune'),
(10, 'Suresh', 'suresh@gmail.com', '9876543219', 'BCA', 4, 'Java, Python', 'Chennai');
SELECT * FROM candidate;
USE recruitment_analytics;

INSERT INTO recruiter
(recruiter_id, recruiter_name, email, company_id)
VALUES
(1, 'Amit Sharma', 'amit@tcs.com', 1),
(2, 'Neha Reddy', 'neha@infosys.com', 2),
(3, 'Ravi Kumar', 'ravi@wipro.com', 3),
(4, 'Meena Rao', 'meena@accenture.com', 4),
(5, 'Sanjay Patel', 'sanjay@deloitte.com', 5),
(6, 'Anita Singh', 'anita@amazon.com', 6),
(7, 'Rahul Verma', 'rahul@microsoft.com', 7),
(8, 'Kavya Nair', 'kavya@google.com', 8),
(9, 'Manoj Das', 'manoj@capgemini.com', 9),
(10, 'Swathi Rao', 'swathi@techmahindra.com', 10);
SELECT * FROM recruiter;
USE recruitment_analytics;

INSERT INTO job
(job_id, job_title, company_id, recruiter_id, location, salary, experience_required, job_type)
VALUES
(1, 'Python Developer', 1, 1, 'Hyderabad', 600000.00, 1, 'Full-Time'),
(2, 'Data Analyst', 2, 2, 'Bangalore', 550000.00, 2, 'Full-Time'),
(3, 'Java Developer', 3, 3, 'Pune', 650000.00, 2, 'Full-Time'),
(4, 'Business Analyst', 4, 4, 'Hyderabad', 700000.00, 3, 'Full-Time'),
(5, 'Software Engineer', 5, 5, 'Mumbai', 750000.00, 2, 'Full-Time'),
(6, 'Cloud Engineer', 6, 6, 'Bangalore', 850000.00, 3, 'Full-Time'),
(7, 'SQL Developer', 7, 7, 'Hyderabad', 650000.00, 2, 'Full-Time'),
(8, 'Data Scientist', 8, 8, 'Bangalore', 900000.00, 3, 'Full-Time'),
(9, 'Web Developer', 9, 9, 'Chennai', 500000.00, 1, 'Part-Time'),
(10, 'System Engineer', 10, 10, 'Pune', 580000.00, 2, 'Full-Time');
SELECT * FROM job;
USE recruitment_analytics;

INSERT INTO application
(application_id, candidate_id, job_id, application_date, status)
VALUES
(1, 1, 1, '2026-08-01', 'Applied'),
(2, 2, 2, '2026-08-02', 'Shortlisted'),
(3, 3, 3, '2026-08-03', 'Applied'),
(4, 4, 4, '2026-08-04', 'Interview'),
(5, 5, 5, '2026-08-05', 'Selected'),
(6, 6, 6, '2026-08-06', 'Rejected'),
(7, 7, 7, '2026-08-07', 'Shortlisted'),
(8, 8, 8, '2026-08-08', 'Interview'),
(9, 1, 2, '2026-08-09', 'Applied'),
(10, 2, 4, '2026-08-10', 'Selected');
SELECT * FROM application;
SHOW TABLES;
SELECT COUNT(*) AS total_companies FROM company;

SELECT COUNT(*) AS total_candidates FROM candidate;

SELECT COUNT(*) AS total_recruiters FROM recruiter;

SELECT COUNT(*) AS total_jobs FROM job;

SELECT COUNT(*) AS total_applications FROM application;
SELECT * FROM company;
SELECT company_name
FROM company;
SELECT *
FROM company
WHERE location = 'Hyderabad';
SELECT *
FROM company
WHERE company_size > 5000;
SELECT *
FROM company
ORDER BY company_size DESC;
SELECT COUNT(*) AS total_companies
FROM company;

SELECT *
FROM company
WHERE industry = 'IT Services';

SELECT *
FROM company
WHERE location IN ('Hyderabad', 'Bangalore');

SELECT *
FROM company
WHERE company_size BETWEEN 3000 AND 6000;

SELECT *
FROM company
WHERE company_name LIKE 'T%';

SELECT * FROM candidate;

SELECT candidate_name, qualification
FROM candidate;

SELECT *
FROM candidate
WHERE experience > 3;

SELECT *
FROM candidate
WHERE experience >= 2;

SELECT *
FROM candidate
WHERE city = 'Hyderabad';

SELECT *
FROM candidate
WHERE skills LIKE '%Python%';

SELECT *
FROM candidate
WHERE skills LIKE '%SQL%';

SELECT candidate_name, experience
FROM candidate
ORDER BY experience DESC
LIMIT 1;

SELECT COUNT(*) AS total_candidates
FROM candidate;

SELECT * FROM job;

SELECT job_title, salary
FROM job;

SELECT *
FROM job
WHERE salary > 600000;

SELECT *
FROM job
WHERE experience_required >= 2;

SELECT *
FROM job
WHERE location = 'Hyderabad';

SELECT *
FROM job
WHERE job_type = 'Full-Time';

SELECT job_title, salary
FROM job
ORDER BY salary DESC;

SELECT job_title, salary
FROM job
ORDER BY salary DESC
LIMIT 1;

SELECT job_title, salary
FROM job
ORDER BY salary ASC
LIMIT 1;

SELECT AVG(salary) AS average_salary
FROM job;

SELECT COUNT(*) AS total_jobs
FROM job;

SELECT job_title, salary
FROM job
WHERE salary BETWEEN 600000 AND 800000;

SELECT COUNT(*) AS total_candidates
FROM candidate;

SELECT AVG(experience) AS average_experience
FROM candidate;

SELECT MAX(experience) AS maximum_experience
FROM candidate;

SELECT MIN(experience) AS minimum_experience
FROM candidate;

SELECT SUM(salary) AS total_salary
FROM job;

SELECT AVG(salary) AS average_salary
FROM job;

SELECT qualification, COUNT(*) AS total_candidates
FROM candidate
GROUP BY qualification;

SELECT city, COUNT(*) AS total_candidates
FROM candidate
GROUP BY city;

SELECT job_type, COUNT(*) AS total_jobs
FROM job
GROUP BY job_type;

SELECT location, COUNT(*) AS total_jobs
FROM job
GROUP BY location;

SELECT job_type, AVG(salary) AS average_salary
FROM job
GROUP BY job_type;

SELECT job_type, MAX(salary) AS highest_salary
FROM job
GROUP BY job_type;

SELECT city, COUNT(*) AS total_candidates
FROM candidate
GROUP BY city
HAVING COUNT(*) > 2;

SELECT qualification, COUNT(*) AS total_candidates
FROM candidate
GROUP BY qualification
HAVING COUNT(*) >= 2;

SELECT
    c.candidate_id,
    c.candidate_name,
    a.application_id,
    a.application_date,
    a.status
FROM candidate c
INNER JOIN application a
ON c.candidate_id = a.candidate_id;

SELECT
    a.application_id,
    j.job_title,
    a.application_date,
    a.status
FROM application a
INNER JOIN job j
ON a.job_id = j.job_id;

SELECT
    c.candidate_name,
    j.job_title,
    a.application_date,
    a.status
FROM candidate c
INNER JOIN application a
ON c.candidate_id = a.candidate_id
INNER JOIN job j
ON a.job_id = j.job_id;

SELECT
    j.job_title,
    c.company_name,
    j.location,
    j.salary
FROM job j
INNER JOIN company c
ON j.company_id = c.company_id;

SELECT
    r.recruiter_name,
    r.email,
    c.company_name
FROM recruiter r
INNER JOIN company c
ON r.company_id = c.company_id;


SELECT
    c.candidate_name,
    j.job_title,
    co.company_name,
    a.application_date,
    a.status
FROM application a
INNER JOIN candidate c
ON a.candidate_id = c.candidate_id
INNER JOIN job j
ON a.job_id = j.job_id
INNER JOIN company co
ON j.company_id = co.company_id;

SELECT
    c.candidate_name,
    a.application_id,
    a.status
FROM candidate c
LEFT JOIN application a
ON c.candidate_id = a.candidate_id;


SELECT
    c.candidate_id,
    c.candidate_name
FROM candidate c
LEFT JOIN application a
ON c.candidate_id = a.candidate_id
WHERE a.application_id IS NULL;


SELECT
    j.job_title,
    r.recruiter_name,
    c.company_name
FROM job j
INNER JOIN recruiter r
ON j.recruiter_id = r.recruiter_id
INNER JOIN company c
ON j.company_id = c.company_id;


SELECT
    c.candidate_name,
    c.qualification,
    c.experience,
    j.job_title,
    j.salary,
    co.company_name,
    r.recruiter_name,
    a.application_date,
    a.status
FROM application a
INNER JOIN candidate c
ON a.candidate_id = c.candidate_id
INNER JOIN job j
ON a.job_id = j.job_id
INNER JOIN company co
ON j.company_id = co.company_id
INNER JOIN recruiter r
ON j.recruiter_id = r.recruiter_id;


SELECT
    candidate_name,
    experience
FROM candidate
WHERE experience > (
    SELECT AVG(experience)
    FROM candidate
);

SELECT
    job_title,
    salary
FROM job
WHERE salary > (
    SELECT AVG(salary)
    FROM job
);


SELECT
    job_title,
    salary
FROM job
WHERE salary = (
    SELECT MAX(salary)
    FROM job
);


SELECT
    candidate_name
FROM candidate
WHERE candidate_id IN (
    SELECT candidate_id
    FROM application
);

SELECT
    candidate_name
FROM candidate
WHERE candidate_id NOT IN (
    SELECT candidate_id
    FROM application
);

SELECT
    job_title
FROM job
WHERE job_id IN (
    SELECT job_id
    FROM application
);

SELECT
    candidate_name,
    experience
FROM candidate
WHERE experience = (
    SELECT MAX(experience)
    FROM candidate
);

SELECT
    c.candidate_name,
    c.experience
FROM candidate c
WHERE EXISTS (
    SELECT 1
    FROM job j
    WHERE c.experience >= j.experience_required
);


SELECT
    candidate_name,
    experience
FROM candidate
WHERE experience >= (
    SELECT experience_required
    FROM job
    WHERE job_title = 'Python Developer'
);


USE recruitment_analytics;

SELECT *
FROM candidate_application_view;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

CREATE VIEW complete_recruitment_view AS
SELECT
    c.candidate_id,
    c.candidate_name,
    c.qualification,
    c.experience,
    j.job_title,
    j.salary,
    co.company_name,
    r.recruiter_name,
    a.application_date,
    a.status
FROM application a
INNER JOIN candidate c
    ON a.candidate_id = c.candidate_id
INNER JOIN job j
    ON a.job_id = j.job_id
INNER JOIN company co
    ON j.company_id = co.company_id
INNER JOIN recruiter r
    ON j.recruiter_id = r.recruiter_id;
    
    
    
SELECT *
FROM complete_recruitment_view;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';


SELECT *
FROM complete_recruitment_view;

CREATE VIEW application_status_summary AS
SELECT
    status,
    COUNT(*) AS total_applications
FROM application
GROUP BY status;


SELECT *
FROM application_status_summary;


SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';


CREATE VIEW job_application_summary AS
SELECT
    j.job_id,
    j.job_title,
    COUNT(a.application_id) AS total_applications
FROM job j
LEFT JOIN application a
    ON j.job_id = a.job_id
GROUP BY
    j.job_id,
    j.job_title;
    

SELECT *
FROM job_application_summary;


SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

CREATE VIEW company_job_summary AS
SELECT
    c.company_id,
    c.company_name,
    COUNT(j.job_id) AS total_jobs,
    AVG(j.salary) AS average_salary
FROM company c
LEFT JOIN job j
    ON c.company_id = j.company_id
GROUP BY
    c.company_id,
    c.company_name;
    
SELECT *
FROM company_job_summary;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

DELIMITER //

CREATE PROCEDURE get_all_candidates()
BEGIN
    SELECT *
    FROM candidate;
END //

DELIMITER ;


CALL get_all_candidates();


SHOW PROCEDURE STATUS
WHERE Db = 'recruitment_analytics';


DELIMITER //

CREATE PROCEDURE get_candidates_by_city(IN p_city VARCHAR(50))
BEGIN
    SELECT
        candidate_id,
        candidate_name,
        qualification,
        experience,
        skills,
        city
    FROM candidate
    WHERE city = p_city;
END //

DELIMITER ;


CALL get_candidates_by_city('Hyderabad');

CALL get_candidates_by_city('Bangalore');

DELIMITER //

CREATE PROCEDURE get_jobs_by_min_salary(IN p_salary DECIMAL(10,2))
BEGIN
    SELECT
        job_id,
        job_title,
        location,
        salary,
        experience_required,
        job_type
    FROM job
    WHERE salary >= p_salary;
END //

DELIMITER ;

CALL get_jobs_by_min_salary(600000);

CALL get_jobs_by_min_salary(800000);


DELIMITER //

CREATE PROCEDURE get_applications_by_status(IN p_status VARCHAR(30))
BEGIN
    SELECT
        a.application_id,
        c.candidate_name,
        j.job_title,
        a.application_date,
        a.status
    FROM application a
    INNER JOIN candidate c
        ON a.candidate_id = c.candidate_id
    INNER JOIN job j
        ON a.job_id = j.job_id
    WHERE a.status = p_status;
END //

DELIMITER ;


CALL get_applications_by_status('Shortlisted');


DELIMITER //

CREATE PROCEDURE get_candidate_applications(IN p_candidate_id INT)
BEGIN
    SELECT
        c.candidate_name,
        j.job_title,
        co.company_name,
        a.application_date,
        a.status
    FROM application a
    INNER JOIN candidate c
        ON a.candidate_id = c.candidate_id
    INNER JOIN job j
        ON a.job_id = j.job_id
    INNER JOIN company co
        ON j.company_id = co.company_id
    WHERE c.candidate_id = p_candidate_id;
END //

DELIMITER ;


CALL get_candidate_applications(1);


DELIMITER //

CREATE PROCEDURE get_jobs_by_location(IN p_location VARCHAR(50))
BEGIN
    SELECT
        job_id,
        job_title,
        location,
        salary,
        experience_required,
        job_type
    FROM job
    WHERE location = p_location;
END //

DELIMITER ;

CALL get_jobs_by_location('Hyderabad');

DELIMITER //

CREATE PROCEDURE get_candidates_by_experience(IN p_experience INT)
BEGIN
    SELECT
        candidate_id,
        candidate_name,
        qualification,
        experience,
        skills,
        city
    FROM candidate
    WHERE experience >= p_experience;
END //

DELIMITER ;

CALL get_candidates_by_experience(3);

CALL get_candidates_by_experience(5);

DELIMITER //

CREATE PROCEDURE get_jobs_by_experience(IN p_experience INT)
BEGIN
    SELECT
        job_id,
        job_title,
        location,
        salary,
        experience_required,
        job_type
    FROM job
    WHERE experience_required <= p_experience;
END //

DELIMITER ;

SHOW PROCEDURE STATUS
WHERE Db = 'recruitment_analytics';

CALL get_jobs_by_experience(2);

USE recruitment_analytics;

SHOW PROCEDURE STATUS
WHERE Db = 'recruitment_analytics';

DELIMITER $$

CREATE PROCEDURE get_jobs_by_experience(IN p_experience INT)
BEGIN
    SELECT
        job_id,
        job_title,
        location,
        salary,
        experience_required,
        job_type
    FROM job
    WHERE experience_required <= p_experience;
END$$

DELIMITER ;


SHOW PROCEDURE STATUS
WHERE Db = 'recruitment_analytics'
AND Name = 'get_jobs_by_experience';

CALL get_jobs_by_experience(2);

USE recruitment_analytics;

DROP PROCEDURE IF EXISTS get_jobs_by_experience;

DELIMITER $$

CREATE PROCEDURE get_jobs_by_experience(IN p_experience INT)
BEGIN
    SELECT
        job_id,
        job_title,
        location,
        salary,
        experience_required,
        job_type
    FROM job
    WHERE experience_required <= p_experience;
END$$

DELIMITER ;

CALL get_jobs_by_experience(2);


USE recruitment_analytics;

DROP PROCEDURE IF EXISTS get_selected_candidates;

DELIMITER $$

CREATE PROCEDURE get_selected_candidates()
BEGIN
    SELECT
        c.candidate_id,
        c.candidate_name,
        j.job_title,
        co.company_name,
        a.application_date,
        a.status
    FROM application a
    INNER JOIN candidate c
        ON a.candidate_id = c.candidate_id
    INNER JOIN job j
        ON a.job_id = j.job_id
    INNER JOIN company co
        ON j.company_id = co.company_id
    WHERE a.status = 'Selected';
END$$

DELIMITER ;


CALL get_selected_candidates();

USE recruitment_analytics;

DROP PROCEDURE IF EXISTS get_recruitment_report;

DELIMITER $$

CREATE PROCEDURE get_recruitment_report()
BEGIN
    SELECT
        c.candidate_name,
        c.qualification,
        c.experience,
        j.job_title,
        j.salary,
        co.company_name,
        r.recruiter_name,
        a.application_date,
        a.status
    FROM application a
    INNER JOIN candidate c
        ON a.candidate_id = c.candidate_id
    INNER JOIN job j
        ON a.job_id = j.job_id
    INNER JOIN company co
        ON j.company_id = co.company_id
    INNER JOIN recruiter r
        ON j.recruiter_id = r.recruiter_id;
END$$

DELIMITER ;

CALL get_recruitment_report();

SHOW PROCEDURE STATUS
WHERE Db = 'recruitment_analytics';

USE recruitment_analytics;

DROP FUNCTION IF EXISTS salary_in_lakhs;

DELIMITER $$

CREATE FUNCTION salary_in_lakhs(p_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_salary / 100000;
END$$

DELIMITER ;

SELECT salary_in_lakhs(600000) AS salary_in_lakhs;

SELECT
    job_title,
    salary,
    salary_in_lakhs(salary) AS salary_in_lakhs
FROM job;

USE recruitment_analytics;

DROP FUNCTION IF EXISTS experience_level;

DELIMITER $$

CREATE FUNCTION experience_level(p_experience INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(20);

    IF p_experience < 2 THEN
        SET result = 'Fresher';
    ELSEIF p_experience <= 4 THEN
        SET result = 'Mid-Level';
    ELSE
        SET result = 'Senior';
    END IF;

    RETURN result;
END$$

DELIMITER ;

SELECT experience_level(1) AS experience_level;

SELECT experience_level(5) AS experience_level;

SELECT
    candidate_name,
    experience,
    experience_level(experience) AS experience_category
FROM candidate;

USE recruitment_analytics;

DROP FUNCTION IF EXISTS experience_gap;

DELIMITER $$

CREATE FUNCTION experience_gap(
    p_candidate_experience INT,
    p_required_experience INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN p_candidate_experience - p_required_experience;
END$$

DELIMITER ;

SELECT experience_gap(5, 3) AS experience_gap;

SELECT
    c.candidate_name,
    j.job_title,
    c.experience AS candidate_experience,
    j.experience_required,
    experience_gap(c.experience, j.experience_required) AS experience_gap
FROM candidate c
INNER JOIN application a
    ON c.candidate_id = a.candidate_id
INNER JOIN job j
    ON a.job_id = j.job_id;
    
    
    
USE recruitment_analytics;

DROP FUNCTION IF EXISTS check_eligibility;

DELIMITER $$

CREATE FUNCTION check_eligibility(
    p_candidate_experience INT,
    p_required_experience INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF p_candidate_experience >= p_required_experience THEN
        RETURN 'Eligible';
    ELSE
        RETURN 'Not Eligible';
    END IF;
END$$

DELIMITER ;

SELECT check_eligibility(3, 2) AS eligibility;
SELECT check_eligibility(1, 3) AS eligibility;

SELECT
    c.candidate_name,
    j.job_title,
    c.experience AS candidate_experience,
    j.experience_required,
    check_eligibility(
        c.experience,
        j.experience_required
    ) AS eligibility
FROM candidate c
INNER JOIN application a
    ON c.candidate_id = a.candidate_id
INNER JOIN job j
    ON a.job_id = j.job_id;
    
    
USE recruitment_analytics;

DROP FUNCTION IF EXISTS experience_in_months;

DELIMITER $$

CREATE FUNCTION experience_in_months(p_experience INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN p_experience * 12;
END$$

DELIMITER ;

SELECT experience_in_months(3) AS experience_months;


SELECT
    candidate_name,
    experience AS experience_years,
    experience_in_months(experience) AS experience_months
FROM candidate;



USE recruitment_analytics;

DROP TRIGGER IF EXISTS before_application_insert;

DELIMITER $$

CREATE TRIGGER before_application_insert
BEFORE INSERT ON application
FOR EACH ROW
BEGIN
    IF NEW.status NOT IN
       ('Applied', 'Shortlisted', 'Interview', 'Selected', 'Rejected') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid application status';
    END IF;
END$$

DELIMITER ;

INSERT INTO application
(application_id, candidate_id, job_id, application_date, status)
VALUES
(11, 3, 5, '2026-09-05', 'Applied');

SELECT * FROM application
WHERE application_id = 11;

INSERT INTO application
(application_id, candidate_id, job_id, application_date, status)
VALUES
(12, 4, 6, '2026-09-05', 'Pending');

USE recruitment_analytics;

DROP TRIGGER IF EXISTS before_application_date;

DELIMITER $$

CREATE TRIGGER before_application_date
BEFORE INSERT ON application
FOR EACH ROW
BEGIN
    IF NEW.application_date IS NULL THEN
        SET NEW.application_date = CURDATE();
    END IF;
END$$

DELIMITER ;


INSERT INTO application
(application_id, candidate_id, job_id, application_date, status)
VALUES
(13, 5, 3, NULL, 'Applied');

SELECT
    application_id,
    candidate_id,
    job_id,
    application_date,
    status
FROM application
WHERE application_id = 13;


USE recruitment_analytics;

DROP TRIGGER IF EXISTS before_job_insert;

DELIMITER $$

CREATE TRIGGER before_job_insert
BEFORE INSERT ON job
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;

INSERT INTO job
(job_id, job_title, company_id, recruiter_id, location, salary, experience_required, job_type)
VALUES
(11, 'Test Developer', 1, 1, 'Hyderabad', -50000, 1, 'Full-Time');


SELECT *
FROM job
WHERE job_id = 11;


USE recruitment_analytics;

DROP TRIGGER IF EXISTS before_candidate_insert;

DELIMITER $$

CREATE TRIGGER before_candidate_insert
BEFORE INSERT ON candidate
FOR EACH ROW
BEGIN
    IF NEW.experience < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Experience cannot be negative';
    END IF;
END$$

DELIMITER ;

INSERT INTO candidate
(candidate_id, candidate_name, email, phone, qualification, experience, skills, city)
VALUES
(11, 'Test Candidate', 'testcandidate@gmail.com', '9876543220', 'B.Tech', -2, 'Python', 'Hyderabad');


SELECT *
FROM candidate
WHERE candidate_id = 11;


USE recruitment_analytics;

DROP TRIGGER IF EXISTS before_job_experience_insert;

DELIMITER $$

CREATE TRIGGER before_job_experience_insert
BEFORE INSERT ON job
FOR EACH ROW
BEGIN
    IF NEW.experience_required < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Required experience cannot be negative';
    END IF;
END$$

DELIMITER ;

INSERT INTO job
(job_id, job_title, company_id, recruiter_id, location, salary, experience_required, job_type)
VALUES
(11, 'Test Analyst', 1, 1, 'Hyderabad', 500000, -1, 'Full-Time');

SELECT *
FROM job
WHERE job_id = 11;


USE recruitment_analytics;

START TRANSACTION;

UPDATE application
SET status = 'Interview'
WHERE application_id = 11;

SELECT * FROM application
WHERE application_id = 11;

ROLLBACK;

SELECT * FROM application
WHERE application_id = 11;

USE recruitment_analytics;

START TRANSACTION;

UPDATE application
SET status = 'Shortlisted'
WHERE application_id = 11;

SELECT * FROM application
WHERE application_id = 11;

COMMIT;

SELECT * FROM application
WHERE application_id = 11;


USE recruitment_analytics;

START TRANSACTION;

UPDATE application
SET status = 'Interview'
WHERE application_id = 11;

UPDATE application
SET status = 'Shortlisted'
WHERE application_id = 13;

SELECT *
FROM application
WHERE application_id IN (11, 13);

ROLLBACK;

SELECT *
FROM application
WHERE application_id IN (11, 13);


USE recruitment_analytics;

START TRANSACTION;

UPDATE application
SET status = 'Interview'
WHERE application_id = 11;

UPDATE application
SET status = 'Interview'
WHERE application_id = 13;

COMMIT;

SELECT *
FROM application
WHERE application_id IN (11, 13);

USE recruitment_analytics;

CREATE INDEX idx_application_status
ON application(status);


SHOW INDEX FROM application;

SELECT *
FROM application
WHERE status = 'Selected';

USE recruitment_analytics;

CREATE INDEX idx_candidate_city
ON candidate(city);

SHOW INDEX FROM candidate;

SELECT *
FROM candidate
WHERE city = 'Hyderabad';

USE recruitment_analytics;

CREATE INDEX idx_job_location
ON job(location);

SHOW INDEX FROM job;

SELECT *
FROM job
WHERE location = 'Hyderabad';

USE recruitment_analytics;

CREATE INDEX idx_candidate_email
ON candidate(email);

SHOW INDEX FROM candidate;

SELECT *
FROM candidate
WHERE email = 'rahul@gmail.com';

USE recruitment_analytics;

EXPLAIN
SELECT *
FROM candidate
WHERE email = 'rahul@gmail.com';

USE recruitment_analytics;

SHOW INDEX FROM application;
SHOW INDEX FROM candidate;
SHOW INDEX FROM job;


USE recruitment_analytics;

SELECT
    status,
    COUNT(*) AS total_applications
FROM application
GROUP BY status;


USE recruitment_analytics;

SELECT
    j.job_title,
    COUNT(a.application_id) AS total_applications
FROM job j
LEFT JOIN application a
ON j.job_id = a.job_id
GROUP BY j.job_id, j.job_title
ORDER BY total_applications DESC;


USE recruitment_analytics;

SELECT
    job_title,
    location,
    salary
FROM job
ORDER BY salary DESC;



USE recruitment_analytics;

SELECT
    c.candidate_name,
    j.job_title,
    co.company_name,
    a.application_date
FROM application a
INNER JOIN candidate c
ON a.candidate_id = c.candidate_id
INNER JOIN job j
ON a.job_id = j.job_id
INNER JOIN company co
ON j.company_id = co.company_id
WHERE a.status = 'Selected';


USE recruitment_analytics;

SELECT
    co.company_name,
    AVG(j.salary) AS average_salary
FROM company co
INNER JOIN job j
ON co.company_id = j.company_id
GROUP BY co.company_id, co.company_name
ORDER BY average_salary DESC;



USE recruitment_analytics;

SELECT
    CASE
        WHEN experience < 2 THEN 'Fresher'
        WHEN experience <= 4 THEN 'Mid-Level'
        ELSE 'Senior'
    END AS experience_level,
    COUNT(*) AS total_candidates
FROM candidate
GROUP BY experience_level
ORDER BY total_candidates DESC;


USE recruitment_analytics;

SELECT
    co.company_name,
    COUNT(a.application_id) AS total_applications
FROM company co
INNER JOIN job j
ON co.company_id = j.company_id
LEFT JOIN application a
ON j.job_id = a.job_id
GROUP BY co.company_id, co.company_name
ORDER BY total_applications DESC;


USE recruitment_analytics;

SELECT
    j.job_id,
    j.job_title,
    co.company_name,
    j.location,
    j.salary
FROM job j
INNER JOIN company co
ON j.company_id = co.company_id
LEFT JOIN application a
ON j.job_id = a.job_id
WHERE a.application_id IS NULL;


USE recruitment_analytics;

SELECT
    j.location,
    COUNT(a.application_id) AS total_applications
FROM job j
LEFT JOIN application a
ON j.job_id = a.job_id
GROUP BY j.location
ORDER BY total_applications DESC;



USE recruitment_analytics;

SELECT
    COUNT(DISTINCT c.candidate_id) AS total_candidates,
    COUNT(DISTINCT j.job_id) AS total_jobs,
    COUNT(DISTINCT co.company_id) AS total_companies,
    COUNT(a.application_id) AS total_applications,
    SUM(a.status = 'Selected') AS selected_candidates,
    SUM(a.status = 'Rejected') AS rejected_candidates
FROM application a
INNER JOIN candidate c
ON a.candidate_id = c.candidate_id
INNER JOIN job j
ON a.job_id = j.job_id
INNER JOIN company co
ON j.company_id = co.company_id;

