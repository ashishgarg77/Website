<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    
    protected $table = 'news';

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array $dates
     */
   // public $dates = ['deleted_at'];

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
        'url'
       
    ];
}
