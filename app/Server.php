<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Server extends Model
{
    protected $table = 'servers';

    protected $fillable = ['ip','port','is_active'];

    public $additional_attributes = ['full_server'];

    public function getFullServerAttribute(){
    	return "{$this->ip}:{$this->port}";
    }
}