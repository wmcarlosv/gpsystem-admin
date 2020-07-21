<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VehicleDevice extends Model
{
    protected $table = 'vehicle_devices';

    protected $fillable = ['vehicle_id','device_id','date_active','date_inactive','is_active'];
}
