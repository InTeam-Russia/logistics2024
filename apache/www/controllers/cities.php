<?php

namespace controllers;

class geo
{
    /**
     * Получает массив городов
     * @return array массив городов
     * @throws \Exception
     */
    public function all() {
        $result = \models\city::getAll();
        return $result;
    }
}