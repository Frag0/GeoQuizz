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
        $t = count($series);
        $resp = $resp->withHeader('Content-Type', "application/json;charset=utf-8");
        $tabseries = [
            "type"=>'collection',
            "meta"=>[$date=date('d/m/y'),"count"=>$t],
            "series"=>$series
        ];
        $resp = $resp->withStatus(201);
        $resp = $resp->withJson($tabseries);
        
        return $resp;
    }

    public function getPhotos(Request $req, Response $resp, $args){
        try {
            $photos = Photo::where('id_ville', '=', $args['id'])->get();    
        } catch (ModelNotFoundException $e) {
            $resp = $resp->withStatus(404);
            $resp = $resp->withJson(array('type' => 'error', 'error' => 404, 'message' => 'Ressource non disponible : /series/'.$args['id']));
            return $resp;
        }

        $t = count($photos);
        $resp = $resp->withHeader('Content-Type', "application/json;charset=utf-8");
        $tabphoto = [
            "type"=>'collection',
            "meta"=>[$date=date('d/m/y'),"count"=>$t],
            "photos"=>$photos
        ]
        $resp = $resp->withStatus(201);
        $resp = $resp->withJson($tabphoto);
        return $resp;
    }

    public function getParties(Request $req, Response $resp, $args){
        
        $parties = Partie::all();
        $resp = $resp->withJson($parties);
        return $resp;
    }
}