<?php
use Pecee\SimpleRouter\SimpleRouter;
use Pecee\Http\Request;
use core\frontend;

// https://github.com/skipperbent/simple-php-router/tree/master?tab=readme-ov-file#getting-restresource-controller-urls

SimpleRouter::get('/', function() {
    $front = frontend::getInstance();
    return $front->getResponseJson(["messaage" => "Hello world"]);
});

SimpleRouter::error(function(Request $request, \Exception $exception) {

    switch($exception->getCode()) {
        // Page not found
        case 404:
            response()->redirect('/not-found');
        // Forbidden
        case 403:
            response()->redirect('/forbidden');
    }

});