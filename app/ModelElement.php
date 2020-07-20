<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelElement extends Model
{
    protected $table = 'model_elements';

    protected $fillable = ['name','brand_id','is_vehicle','is_device'];
}
