<?php
namespace geo\control ;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

class LbsController{

    private $c = null;

    public function __construct($container)
    {
        $this->c = $container;
    }
}