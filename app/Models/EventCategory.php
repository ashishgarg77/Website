<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventCategory extends Model
{
    

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'event_categories';

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array $dates
     */
  

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
   
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'descrption',
       
    ];
}
