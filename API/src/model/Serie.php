<?php
/**
 *
 */
namespace geo\model;

class Serie extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'serie';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    public $keyType = "string";
}