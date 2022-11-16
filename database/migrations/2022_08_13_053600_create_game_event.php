<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGameEvent extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::table('events', function($table) {
           
            $table->string('website_link')->after('age_group')->nullable();
            $table->string('facebook_link')->after('age_group')->nullable();
            $table->string('youtube_link')->after('age_group')->nullable();
            $table->string('language')->after('age_group')->nullable();
            $table->string('capacity')->after('age_group')->nullable();
           // $table->string('language')->after('age_group')->nullable();
           
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
