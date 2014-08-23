<?php
ini_set('date.timezone', 'Pacific/Auckland');

define('SS_ENVIRONMENT_TYPE', 'dev');

define('SS_DATABASE_SERVER', '127.0.0.1');
define('SS_DATABASE_USERNAME', 'root');
define('SS_DATABASE_PASSWORD', '');

define('SS_DEFAULT_ADMIN_USERNAME', 'admin');
define('SS_DEFAULT_ADMIN_PASSWORD', 'password');

global $_FILE_TO_URL_MAPPING;
$_FILE_TO_URL_MAPPING['/var/www'] = 'http://localhost';

