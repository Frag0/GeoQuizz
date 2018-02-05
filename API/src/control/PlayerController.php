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

class PlayerController {

    public function getVilles(Request $req, Response $resp, $args){

        $villes = Ville::all();
        $resp = $resp->withJson($villes);
        return $resp;
    }
}