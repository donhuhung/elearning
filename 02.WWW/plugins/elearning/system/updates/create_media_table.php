<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateMediaTable extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_media', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('path');
            $table->string('type'); //this feild to explain media type
            $table->timestamps();


            $table->integer('lesson_id')->unsigned();
            $table->foreign('lesson_id')->references('id')->on('elearning_system_lessons');             
        });
    }

    public function down()
    {
        Schema::dropIfExists('elearning_system_media');
    }
}
