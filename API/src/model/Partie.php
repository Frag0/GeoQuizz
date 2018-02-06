<?php
/**
 *
 */
namespace geo\model;

class Partie extends \Illuminate\Database\Eloquent\Model
{
    protected $table = 'partie';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    public $keyType = "string";

    public function serie() {
       return $this->belongsTo('geo\model\Serie', 'id_serie');
	}
}