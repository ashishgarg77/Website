<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ModifyEventTable extends Migration
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
            $table->string('event_category')->after('barcode_type')->nullable();
            $table->string('age_group')->after('event_category')->nullable();
            $table->string('my_organiser_name')->after('age_group')->nullable();
            $table->string('my_organiser_about')->after('my_organiser_name')->nullable();

            $table->string('website_link')->after('website_link')->nullable();
            $table->string('facebook_link')->after('facebook_link')->nullable();
            $table->string('twitter_link')->after('twitter_link')->nullable();
            $table->string('youtube_link')->after('youtube_link')->nullable();
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
