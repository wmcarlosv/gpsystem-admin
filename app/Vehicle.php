<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    protected $table = 'vehicles';

    protected $fillable = ['vendor_id','vehicle_number','brand_id','model_id','vehicle_type_id','photo','is_active'];
}
