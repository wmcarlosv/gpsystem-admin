<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    protected $table = 'vendors';

    protected $fillable = ['name','phone','region_id','city_id','address','logo'];
}
