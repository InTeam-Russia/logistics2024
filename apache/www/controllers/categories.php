<?php

namespace controllers;

use core\frontend;
use core\responseType;
use core\singleton;
use core\db;
use models\category;

class categories
{
    use singleton;
    public function categoryExists($id) {
        $frontend = frontend::getInstance();
        if(!isset($id) || !is_numeric($id)) {
            echo $frontend->getErrorJson(responseType::InvalidProperty, ['message' => 'Необходим ID категории']);
            return;
        }
        try {
            $cat = category::exists((int)$id);
            echo $frontend->getResponseJson([ 'result' => $cat ]);
        } catch(\Exception $ex) {
            echo frontend::getInstance()->getErrorJson(responseType::InternalError, [
                'data' => $ex->getMessage()
            ]);
        }
    }

    public function getCategory($id) {
        $frontend = frontend::getInstance();
        if(!isset($id) || !is_numeric($id)) {
            echo $frontend->getErrorJson(responseType::InvalidProperty, ['message' => 'Необходим ID категории']);
            return;
        }
        try {
            if(!category::exists((int)$id)) {
                echo frontend::getInstance()->getErrorJson(responseType::NotFound, [
                    'data' => "Категория не существует"
                ]);
                return;
            }
            $cat = category::getById((int)$id);
            echo $frontend->getResponseJson($cat);
        } catch(\Exception $ex) {
            echo frontend::getInstance()->getErrorJson(responseType::InternalError, [
                'data' => $ex->getMessage()
            ]);
        }
    }

    public function getAllCategories() {
        try {
            $cats = category::getAll();
            echo frontend::getInstance()->getResponseJson($cats);
        } catch (\Exception $ex) {
            echo frontend::getInstance()->getErrorJson(responseType::InternalError, [
                'data' => $ex->getMessage()
            ]);
        }
    }
}