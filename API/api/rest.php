<?php
require '../src/vendor/autoload.php';

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use Ramsey\Uuid\Uuid;
use Ramsey\Uuid\Exception\UnsatisfiedDependencyException;

$settings = require_once '../src/conf/api_settings.php';
$errors = require_once '../src/conf/api_errors.php';
$dependencies = require_once '../src/conf/api_deps.php';

$config = parse_ini_file("../src/conf/geo.db.conf.ini");

$db = new Illuminate\Database\Capsule\Manager();

$db->addConnection($config);
$db->setAsGlobal();
$db->bootEloquent();

$configuration = array_merge($settings, $errors, $dependencies);
$c = new \Slim\Container($configuration);
$app = new \Slim\App($c);

$app->get('/series/{id}[/]','\geo\control\PlayerController:getSerieId');

$app->get('/series[/]','\geo\control\PlayerController:getSeries');

$app->get('/series/{id}/photos[/]','\geo\control\PlayerController:getPhotos');

$app->get('/parties[/]','\geo\control\PlayerController:getParties');

$app->get('/parties/{id}[/]','\geo\control\PlayerController:getPartieId');

$app->post('/parties[/]','\geo\control\PlayerController:postPartie');

$app->put('/parties[/]','\geo\control\PlayerController:putPartie');

$app->run();