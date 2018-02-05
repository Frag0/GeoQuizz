<?php

namespace geo\control;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use \geo\model\Photo;
use \geo\model\Partie;
use \geo\model\User;
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
        $resp = $resp->withJson(array('user' => array('id' => $user->id, 'nom' => $user->identifiant, 'mail' => $user->mail)));
        return $resp;
    }

    public function user(Request $req, Response $resp, $args){
        try{
            $user = User::findorFail($args['id']);
        } catch (ModelNotFoundException $e) {
            $resp = $resp->withStatus(404);
            $resp = $resp->withJson(array('type' => 'error', 'error' => 404, 'message' => 'Ressource non disponible : /user/'.$args['id']));
            return $resp;
        }
        $resp = $resp->withJson(array('id' => $user->id, 'identifiant' => $user->identifiant, 'mail' => $user->mail));
        return $resp;
    }

    public function addSerie(Request $req, Response $resp, $args){

        $parsedBody = $req->getParsedBody();
        $serie = new Serie;
        $uuid4 = Uuid::uuid4();
        $serie->id = $uuid4;
        $serie->ville = filter_var($parsedBody['ville'], FILTER_SANITIZE_SPECIAL_CHARS);
        $serie->longitude = filter_var($parsedBody['longitude'], FILTER_SANITIZE_SPECIAL_CHARS);
        $serie->latitude = filter_var($parsedBody['latitude'], FILTER_SANITIZE_SPECIAL_CHARS);
        $serie->save();
        return $resp;
    }

    public function addPhotos(Request $req, Response $resp, $args){

        $parsedBody = $req->getParsedBody();
        $photo = new Photo;
        $photo->url = filter_var($parsedBody['url'], FILTER_SANITIZE_SPECIAL_CHARS);
        $photo->longitude = filter_var($parsedBody['longitude'], FILTER_SANITIZE_SPECIAL_CHARS);
        $photo->latitude = filter_var($parsedBody['latitude'], FILTER_SANITIZE_SPECIAL_CHARS);
        $photo->id_ville = $args['id'];
        $photo->save();
        return $resp;
    }
}