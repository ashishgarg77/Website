<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Str;
use Superbalist\Money\Money;
use URL;

/**
 * @property int start_date
 */
class EventDate extends \Illuminate\Database\Eloquent\Model
{
   // use SoftDeletes;

    protected $table = 'event_date'; 

    protected $dates = ['start_date', 'end_date'];
    protected $fillable = ['event_id','start_date', 'end_date'];
    /**
     * The validation error messages.
     *
     * @var array $messages
     */
   
    /**
     * The validation rules.
     *
     * @return array $rules
     */
   
}
