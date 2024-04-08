<?php

namespace core;
use core\singleton;

class pythonApi
{
    use singleton;
    private $api_host = '10.1.0.101';
    private $api_port = '8002';
    public function createRequest() {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_URL, $this->api_host . ':' . $this->api_port);
        curl_setopt($ch, CURLOPT_COOKIE, http_build_query($_COOKIE));
        return $ch;
    }
    public function sendRequest($ch) {
        $result = curl_exec($ch);
        curl_close($ch);
        return json_decode($result, true);
    }
}