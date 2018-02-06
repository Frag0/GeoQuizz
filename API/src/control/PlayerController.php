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
use Firebase\JWT\JWT;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException ;
use Firebase\JWT\BeforeValidException;

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

    public function getSerieId(Request $req, Response $resp, $args){
        
        $serie = Serie::find($args['id']);
        $resp = $resp->withJson($serie);
        return $resp;
    }

    public function getPhotos(Request $req, Response $resp, $args){
        $photos = Photo::where('id_ville', '=', $args['id'])->get();    
        $t = count($photos);
        $resp = $resp->withHeader('Content-Type', "application/json;charset=utf-8");
        $tabphoto = [
            "type"=>'collection',
            "meta"=>[$date=date('d/m/y'),"count"=>$t],
            "photos"=>$photos
        ];
        $resp = $resp->withStatus(201);
        $resp = $resp->withJson($tabphoto);        
        return $resp;
    }

    public function getParties(Request $req, Response $resp, $args){
        $parties = Partie::all();
        $resp = $resp->withJson($parties);
        return $resp;
    }

    public function getPartieId(Request $req, Response $resp, $args){
        
        $partie = Partie::find($args['id']);
        $resp = $resp->withJson($partie);
        return $resp;
    }

    public function postPartie(Request $req, Response $resp, $args) {
            $parsedBody = $req->getParsedBody();
            $partie = new Partie;
            $uuid4 = Uuid::uuid4();
            $partie->id = $uuid4;
            $secret = 'geoquizz';
            $token =JWT::encode( ['iss'=>'http://api.geoquizz.local:10101/parties/'.$partie->id,
                'aud'=>'http://api.geoquizz.local:10101/',
                'iat'=>time(),
                'exp'=>time()+3600,
                'id'=>(string) $partie->id],
                $secret,'HS512');
            $resp = $resp->withStatus(200);
            
            $partie->token = $token;
            $partie->pseudo = filter_var($parsedBody['pseudo'], FILTER_SANITIZE_SPECIAL_CHARS);
            $partie->statut = filter_var($parsedBody['statut'],FILTER_SANITIZE_SPECIAL_CHARS);
            $partie->id_serie = filter_var($parsedBody['id_serie'],FILTER_SANITIZE_SPECIAL_CHARS);
            $partie->save();
            return $resp;
    }

    public function putPartie(Request $req, Response $resp, $args) {

        $parsedBody = $req->getParsedBody();
        $partie = Partie::find($parsedBody['id']);
        $partie->score = filter_var($parsedBody['score'],FILTER_SANITIZE_SPECIAL_CHARS);
        $partie->statut = filter_var($parsedBody['statut'],FILTER_SANITIZE_SPECIAL_CHARS);
        $partie->save();
        return $resp;
    }
}