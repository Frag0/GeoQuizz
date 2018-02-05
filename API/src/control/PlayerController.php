<?php

namespace geo\control;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use \geo\model\Photo;
use \geo\model\Partie;
use \geo\model\User;
use \geo\model\Serie;

class PlayerController {

    public function getSeries(Request $req, Response $resp, $args){
        
        $series = Serie::all();
        $resp = $resp->withJson($series);
        return $resp;
    }

    public function getPhotos(Request $req, Response $resp, $args){
        
        $photos = Photo::where('id_ville', '=', $args['id'])->get();
        $resp = $resp->withJson($photos);
        return $resp;
    }

    public function getParties(Request $req, Response $resp, $args){
        
        $parties = Partie::all();
        $resp = $resp->withJson($parties);
        return $resp;
    }
}