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

    public function photos() {
       return $this->hasMany('geo\model\Photo', 'id_ville');
	}

	public function parties() {
       return $this->hasMany('geo\model\Partie', 'id_serie');
	}
}