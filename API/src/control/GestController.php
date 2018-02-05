<?php

namespace geo\control;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use \geo\model\Photo;
use \geo\model\Partie;
use \geo\model\Niveau;
use \geo\model\User;
use \geo\model\Ville;
use \geo\model\Serie;
use Ramsey\Uuid\Uuid;

class GestController {
    public function addUser(Request $req, Response $resp, $args){
        $parsedBody = $req->getParsedBody();
        $user = new User;
        $uuid4 = Uuid::uuid4();
        $user->id = $uuid4;
        $user->identifiant = filter_var($parsedBody['identifiant'], FILTER_SANITIZE_SPECIAL_CHARS);
        $user->password = password_hash($parsedBody['password'], PASSWORD_DEFAULT);
        $user->mail = filter_var($parsedBody['mail'], FILTER_SANITIZE_SPECIAL_CHARS);
        $user->save();
        $resp = $resp->withStatus(201);
        $resp = $resp->withHeader('Location', "/user/".$user->id);
        $resp = $resp->withJson(array('id' => $user->id, 'nom' => $user->identifiant, 'mail' => $user->mail));
        return $resp;
    }

     public function addSerie(Request $req, Response $resp, $args){

        $parsedBody = $req->getParsedBody();
        $serie = new Serie;
        $serie->ville = filter_var($parsedBody['ville'], FILTER_SANITIZE_SPECIAL_CHARS);
        $serie->lon = filter_var($parsedBody['lon'], FILTER_SANITIZE_SPECIAL_CHARS);
        $serie->lat = filter_var($parsedBody['lat'], FILTER_SANITIZE_SPECIAL_CHARS);
        $serie->save();
        return $resp;
    }

    public function Test(Request $req, Response $resp, $args){
        echo "test";
        return $resp;
    }
}