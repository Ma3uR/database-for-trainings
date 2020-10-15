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
       MAX(e.current_salary) AS highest_salary,
       AVG(e.current_salary) AS average_salary
FROM position AS p
         INNER JOIN employe AS e ON e.position_id = p.position_id
GROUP BY p.position_id
ORDER BY highest_salary DESC;
SELECT e.employe_id,
       CONCAT(e.first_name, ' ',e.last_name) AS fullname,
       COUNT(i.employe_id) AS amount_of_days,
       SUM(i.profit_per_day) AS sum_income
FROM employe AS e
         INNER JOIN income AS i on i.employe_id = e.employe_id
GROUP BY i.employe_id;
SELECT t.transport_id AS transport,
       SUM(i.profit_per_day) AS sum_income,
       AVG(i.profit_per_day) AS avg_income,
       COUNT(i.transport_id) AS number_of_days
FROM income AS i
         INNER JOIN transport AS t on i.transport_id = t.transport_id
GROUP BY i.transport_id
ORDER BY number_of_days DESC;
SELECT CONCAT(e.first_name, ' ',e.last_name) AS fullname
FROM employe AS e
WHERE MONTH(dob) = 5;
SELECT CONCAT(e.first_name, ' ',e.last_name) AS fullname,
       e.empoyeed_since,
       (datediff(CURRENT_DATE, e.empoyeed_since)/366) AS time_in_company
FROM employe AS e;
SELECT CONCAT(e.first_name, ' ',e.last_name) AS fullname,
       e.empoyeed_since,
       TIMESTAMPDIFF(YEAR, e.empoyeed_since, CURDATE()) AS number_of_years

FROM employe as e
ORDER BY number_of_years DESC;