<?php

namespace core;
use \core\singleton;

class db
{
    use singleton;
    public \PDO $pdo;
    public function __construct() {
        $conStr = sprintf(
            "pgsql:host=%s;port=%d;dbname=%s;user=%s;password=%s",
            '10.1.0.100',
            '5432',
            'logistic',
            'postgres',
            'postgres'
        );

        $this->pdo = new \PDO($conStr);
        $this->pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }
}