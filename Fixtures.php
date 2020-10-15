<?php
declare(strict_types=1);

class Fixtures
{
    /**
     * @var PDO $connection
     */
    private static $connection;

    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();

        try {
            $connection->beginTransaction();
            $this->cleanup();
            $connection->commit();

            $connection->beginTransaction();
            $this->generateEmployees(100000);
            $this->generateSalaries();
            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function getRandomFirstName(): string
    {
        static $randomFirstNames = ['Norbert','Damon','Laverna','Annice','Brandie','Emogene','Cinthia','Magaret','Daria','Ellyn','Rhoda','Debbra','Reid','Desire','Sueann','Shemeka','Julian','Winona','Billie','Michaela','Loren','Zoraida','Jacalyn','Lovella','Bernice','Kassie','Natalya','Whitley','Katelin','Danica','Willow','Noah','Tamera','Veronique','Cathrine','Jolynn','Meridith','Moira','Vince','Fransisca','Irvin','Catina','Jackelyn','Laurine','Freida','Torri','Terese','Dorothea','Landon','Emelia'];
        return $randomFirstNames[array_rand($randomFirstNames)];
    }

    private function getRandomLastName(): string
    {
        static $randomLastNames = ['Armstrong','Fleming','Crane','Hendrix','Ruiz','Herring','Butler','Parrish','Young','Ferguson','Levine','Bryan','Dennis','Zimmerman','Mcgrath','Gonzalez','Hogan','Adams','Simon','Yu','Richards','Munoz','Anthony','Moss','Park','Ho','Hughes','Adkins','Woodward','Mcintyre','Simon','Anthony','Hester','Sosa','Cardenas','Freeman','Acevedo','Avila','Logan','Bradshaw','Paul','Drake','Dalton','Pruitt','Richardson','Torri','Jackson','Wolfe','Barton','Fletcher'];
        return $randomLastNames[array_rand($randomLastNames)];
    }

    private function getRandomSalary(): string
    {
        static $randomSalary = ['800','1000','1500','2000','2500','3000', '3200'];
        return $randomSalary[array_rand($randomSalary)];
    }

    private function getRandomProduct(): string
    {
        return uniqid();
    }

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=CherkasyElectroTrans', 'root', 'root', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        return self::$connection;
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();
        $connection->exec('DELETE FROM employe WHERE employe_id > 12');
        $connection->exec('ALTER TABLE employe AUTO_INCREMENT = 13');
        $connection->exec('DELETE FROM salary');
        $connection->exec('ALTER TABLE salary AUTO_INCREMENT = 1');
    }

    /**
     * @param int $employeesCount
     * @throws Exception
     */
    public function generateEmployees(int $employeesCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE USERS ===
        $start = microtime(true);

        $firstName = $lastName = $empoyeedSince = $positionId = $currentSalary = $dob = '';
        $minAgeTimestamp = $currentTimestamp - (31556952 * 45);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 21);
        $minEmpoyeedSinceTimestamp = $currentTimestamp - (31556952 * 1);
        $maxEmpoyeedSinceTimestamp = $currentTimestamp - (31556952 * 5);
        $statement = $connection->prepare(<<<SQL
    INSERT INTO employe (first_name, last_name, empoyeed_since, position_id, current_salary, dob)
    VALUES (:firstName, :lastName, :empoyeedSince, :positionId, :currentSalary, :dob)
    ON DUPLICATE KEY UPDATE dob=VALUES(dob);
SQL
        );
        $statement->bindParam(':firstName', $firstName);
        $statement->bindParam(':lastName', $lastName);
        $statement->bindParam(':empoyeedSince', $empoyeedSince);
        $statement->bindParam(':positionId', $positionId);
        $statement->bindParam(':currentSalary', $currentSalary);
        $statement->bindParam(':dob', $dob);

        for ($employeeId = 7; $employeeId < $employeesCount; $employeeId++) {
            $firstName = $this->getRandomFirstName();
            $lastName = $this->getRandomLastName();
            $timestamp = random_int($minAgeTimestamp, $maxAgeTimestamp);
            $EmpoyeedSincetimestamp = random_int($maxEmpoyeedSinceTimestamp, $minEmpoyeedSinceTimestamp);
            $empoyeedSince = date('Y-m-d', $EmpoyeedSincetimestamp);
            $positionId = random_int(1, 3);
            $currentSalary = $this->getRandomSalary();
            $dob = date('Y-m-d', $timestamp);
            $statement->execute();
        }

        echo 'Create Employees: ' . (microtime(true) - $start) . "\n";
    }


    public function generateSalaries()
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE SALARIES ===
        $start = microtime(true);
        $employeeId = $date = $salarySum = $price = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO salary (employe_id, date, salary_sum)
    VALUES (:employeeId, :date, :salarySum)
    ON DUPLICATE KEY UPDATE salary_sum=VALUES(salary_sum);
SQL
        );
        $statement->bindParam(':employeeId', $employeeId, PDO::PARAM_INT);
        $statement->bindParam(':date', $date);
        $statement->bindParam(':salarySum', $salarySum, PDO::PARAM_INT);

        $employeeIdsStatement = $connection->query('SELECT employe_id FROM employe ORDER BY employe_id ASC');
        $employeeIds = $employeeIdsStatement->fetchAll(PDO::FETCH_COLUMN);

        foreach ($employeeIds as $employeeId) {
            for ($i = 0; $i < 10; $i++) {
                $timestamp = random_int($currentTimestamp - 31556952, $currentTimestamp);
                $date = date('Y-m-d', $timestamp);
                $salarySum = random_int(500, 1000);
                $statement->execute();
            }
        }

        echo 'Create salaries: ' . (microtime(true) - $start) . "\n";
    }
}

$fixturesGenerator = new Fixtures();
$fixturesGenerator->generate();