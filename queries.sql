SELECT em.first_name, em.last_name FROM employe AS em ORDER BY em.last_name;

SELECT em.employe_id,
       em.first_name,
       em.last_name,
       AVG(sa.salary_sum) AS avarage_empoyees_salary
FROM employe AS em
    INNER JOIN salary AS sa ON em.employe_id = sa.employe_id
GROUP BY em.employe_id
ORDER BY avarage_empoyees_salary DESC;

SELECT p.position,
       MAX(e.current_salary) as highest_salary,
       AVG(e.current_salary) AS average_salary
FROM employe as e
    INNER JOIN position AS p ON p.position_id = e.position_id
GROUP BY position;

SELECT e.employe_id,
       CONCAT(e.first_name, ' ',e.last_name) AS fullname,
       COUNT(i.employe_id) AS amount_of_days,
       SUM(i.profit_per_day) AS sum_income
FROM income AS i
    INNER JOIN employe AS e on i.employe_id = e.employe_id
GROUP BY i.employe_id;

SELECT t.transport_id as transport,
       SUM(i.profit_per_day) AS sum_income,
       AVG(i.profit_per_day) AS avg_income,
       COUNT(i.transport_id) AS number_of_days
FROM income AS i
    INNER JOIN transport AS t on i.transport_id = t.transport_id
GROUP BY i.transport_id
ORDER BY number_of_days DESC;

SELECT CONCAT(e.first_name, ' ',e.last_name) AS fullname
FROM employe as e
WHERE MONTH(dob) = 5;

SELECT CONCAT(e.first_name, ' ',e.last_name) AS fullname,
       e.empoyeed_since,
       (datediff(CURRENT_DATE, e.empoyeed_since)/366) AS time_in_company
FROM employe as e;


SELECT CONCAT(e.first_name, ' ',e.last_name) AS fullname,
       e.empoyeed_since,
       TIMESTAMPDIFF(YEAR, e.empoyeed_since, CURDATE()) AS number_of_years
FROM employe as e
ORDER BY number_of_years DESC;

ALTER TABLE employe ADD UNIQUE INDEX `EMPLOYEE_DOB`  (dob);

ALTER TABLE employe DROP INDEX `EMPLOYEE_DOB`;

ALTER TABLE salary ADD INDEX `SALARY_SUM`  (salary_sum);

ALTER TABLE employe DROP INDEX `SALARY_SUM`;


SELECT * FROM employe WHERE dob <= CURRENT_DATE AND dob >= '1990-01-01';

SELECT * FROM salary WHERE salary_sum > 500;


DELETE FROM salary;
SHOW CREATE TABLE employe;