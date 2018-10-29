<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateLessonsTable extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_lessons', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name');
            $table->string('slug');
            $table->text('description');
            $table->integer('watched')->default(0);
            $table->timestamps();

            $table->integer('topic_id')->unsigned();
            $table->foreign('topic_id')->references('id')->on('elearning_system_topics');             
        });
    }

    public function down()
    {
        Schema::dropIfExists('elearning_system_lessons');
    }
}
