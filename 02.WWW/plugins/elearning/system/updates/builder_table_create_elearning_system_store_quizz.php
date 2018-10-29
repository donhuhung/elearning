<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateElearningSystemStoreQuizz extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_store_quizz', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->integer('lesson_id');
            $table->integer('number_question');
            $table->string('time_quizz');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('elearning_system_store_quizz');
    }
}
