SELECT em.first_name, em.last_name FROM employe AS em ORDER BY em.last_name;

SELECT em.employe_id,
       em.first_name,
       em.last_name,
       AVG(sa.salary_sum) AS avarage_empoyees_salary
FROM employe AS em
    INNER JOIN salary AS sa ON em.employe_id = sa.employe_id
GROUP BY em.employe_id
ORDER BY avarage_empoyees_salary DESC;

SELECT po.position,
       MAX(s.salary_sum) as max_salary,
       MIN(s.salary_sum) AS min_salary
FROM position as po
    INNER JOIN employe AS em ON po.position_id = em.position_id
    INNER JOIN salary AS s on s.employe_id = po.position_id
GROUP BY position;

SELECT e.employe_id,
       CONCAT(e.first_name, ' ',e.last_name)fullname,
       COUNT(inc.employe_id)amount_of_days,
       SUM(inc.profit_per_day) AS sum_income
FROM income AS inc
    INNER JOIN employe AS e on inc.employe_id = e.employe_id
GROUP BY inc.employe_id;

SELECT t.transport_id as transport,
       SUM(inc.profit_per_day) AS sum_income,
       AVG(inc.profit_per_day)avg_income,
       COUNT(inc.transport_id)amount_of_days
FROM income AS inc
    JOIN transport AS t on inc.transport_id = t.transport_id
GROUP BY inc.transport_id
ORDER BY amount_of_days DESC;

SELECT CONCAT(e.first_name, ' ',e.last_name)fullname
FROM employe as e
WHERE MONTH(dob) = 5;

SELECT CONCAT(e.first_name, ' ',e.last_name)fullname,
       e.come_date,
       (datediff(CURRENT_DATE, e.come_date)/366) AS time_in_company
FROM employe as e