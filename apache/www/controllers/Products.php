<?php

namespace controllers;
use core\responseType;
use models\userApi;
use core\frontend;

class Products
{
    public function add() {
        $user = userApi::getInstance();
        $frontend = frontend::getInstance();
        $whoami = $user->whoami();
        var_dump($whoami);
        if($whoami['role'] == 'company') {
            // обязательно: name, price, amount,
            // дополнительно: size, img, category
            $frontend->getResponseJson([]);
        } else if($whoami['role'] == 'guest') {
            echo $frontend->getErrorJson(\core\responseType::NotAuthorized);
        } else {
            echo $frontend->getErrorJson(\core\responseType::NoAccess);
        }
    }
}