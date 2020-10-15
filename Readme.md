## For analyze queries performance ##

Drop indexes:

```bash
ALTER TABLE employe DROP INDEX `EMPLOYEE_DOB`;
ALTER TABLE employe DROP INDEX `SALARY_SUM`;
#clean db
DELETE FROM salary
DELETE FROM employe WHERE employe_id > 12
#run Fixtures.php
```

Run queries
```bash
SELECT * FROM employe WHERE dob <= CURRENT_DATE AND dob >= '1990-01-01';

SELECT * FROM salary WHERE salary_sum > 500;
```

Add indexes and run queries again:
```bash
ALTER TABLE employe ADD UNIQUE INDEX `EMPLOYEE_DOB`  (dob);
ALTER TABLE salary ADD INDEX `SALARY_SUM`  (salary_sum);
#clean db
DELETE FROM salary
DELETE FROM employe WHERE employe_id > 12
#run Fixtures.php
```