<?php
/**
 *
 */
namespace geo\model;

class Partie extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'score';
    protected $primaryKey = 'id';
    public $timestamps = false;
}