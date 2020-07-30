<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class Role extends \TCG\Voyager\Models\Role
{
    public function scopeNoAdmin($query){
        if(Auth::user()->role->name != 'admin'){
            return $query->select('roles.*')->join('users','roles.id','=','users.role_id')->where('roles.name','<>','admin');
        }else{
            return $query;
        }
    }
}
