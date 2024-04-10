<?php
use Pecee\SimpleRouter\SimpleRouter;
use Pecee\Http\Request;
use core\frontend;
use core\responseType;
use core\db;

// https://github.com/skipperbent/simple-php-router/tree/master?tab=readme-ov-file#getting-restresource-controller-urls

/*SimpleRouter::get('/', function() {
    $front = frontend::getInstance();
    echo $front->getResponseJson(["messaage" => "Hello world"]);
});*/

//SimpleRouter::controller('/images', 'ImagesController');
SimpleRouter::post('/products/add', [\controllers\products::class, 'add']);
SimpleRouter::get('/products/{id}', [\controllers\products::class, 'get']);
SimpleRouter::get('/categories/all', [\controllers\categories::class, 'getAllCategories']);
SimpleRouter::get('/categories/exists/{id}', [\controllers\categories::class, 'categoryExists']);
SimpleRouter::get('/categories/find/{name}', [\controllers\categories::class, 'find']);
SimpleRouter::get('/categories/{id}', [\controllers\categories::class, 'getCategory']);

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