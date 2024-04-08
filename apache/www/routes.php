<?php
use Pecee\SimpleRouter\SimpleRouter;
use Pecee\Http\Request;
use core\frontend;
use core\responseType;
use core\db;

// https://github.com/skipperbent/simple-php-router/tree/master?tab=readme-ov-file#getting-restresource-controller-urls

SimpleRouter::get('/', function() {
    $front = frontend::getInstance();
    return $front->getResponseJson(["messaage" => "Hello world"]);
});

//SimpleRouter::controller('/images', 'ImagesController');
SimpleRouter::put('/products/add', [\controllers\Products::class, 'add']);

SimpleRouter::error(function(Request $request, \Exception $exception) {
    $front = frontend::getInstance();
    switch($exception->getCode()) {
        // Page not found
        case 404:
            echo $front->getErrorJson(responseType::InvalidMethod);
            break;
        // Forbidden
        case 403:
            echo $front->getErrorJson(responseType::NoAccess);
            break;
    }

});