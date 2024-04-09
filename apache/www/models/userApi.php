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
        $data = json_decode('{ "id": 1, "email": "company@example.org", "role": "company", "data": { "name": "test_company", "img": "/static/companies/10/dasfs.jpg" } }', true);
        return $data;
    }
}