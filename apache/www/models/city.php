<?php

namespace models;

use core\db;

/**
 * Модель города
 */
class city
{
    /**
     * @var int id города
     */
    public int $id;
    /**
     * @var string Название города
     */
    public string $name;
    /**
     * @var string Ссылка на герб города
     */
    public string $arms;

    /**
     * @return array Массив с городами
     * @throws \Exception pdo->prepare: Не могу подготовить запрос
     * @throws \Exception pdo->execute: Не могу выполнить запрос
     * @throws \Exception pdo->fetchAll: Не могу прочесть список городов
     */
    public static function getAll() : array {
        $db = db::getInstance();
        $sth = $db->pdo->prepare("SELECT * FROM cities");
        if(!$sth) {
            throw new \Exception("Не могу подготовить запрос");
        }
        if(!$sth->execute()) {
            throw new \Exception("Не могу выполнить запрос");
        }
        $sth->setFetchMode(\PDO::FETCH_CLASS, '\models\city');
        $result = $sth->fetchAll();
        if($result === false) {
            throw new \Exception("Не могу прочесть список городов");
        }
        return $result;
    }
}