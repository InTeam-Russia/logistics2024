<?php

namespace controllers;

class cities
{
    /**
     * Получает массив городов
     * @return array массив городов
     * @throws \Exception
     */
    public function all() {
        $result = \models\city::getAll();
        return \core\frontend::getInstance()->getResponseJson($result);
    }
}