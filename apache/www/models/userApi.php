<?php

namespace models;

use core\pythonApi;
use core\singleton;

class userApi extends pythonApi
{
    use singleton;
    public function whoami() {
        $cu = $this->createRequest();
        /* todo дописать api
        $data = $this->sendRequest($cu);
        */
        $data = json_decode('{ "role": "company", "data": { "id": 10, "email": "company@example.org", "name": "test_company", "img": "/static/companies/10/dasfs.jpg" } }', true);
        return $data;
    }
}