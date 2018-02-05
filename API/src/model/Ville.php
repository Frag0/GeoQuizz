<?php
/**
 *
 */
namespace geo\model;

class Ville extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'ville';
    protected $primaryKey = 'id';
    public $timestamps = false;
}