<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateElearningSystemResultQuizz extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_result_quizz', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->integer('quizz_id');
            $table->integer('user_id');
            $table->integer('total_correct');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('elearning_system_result_quizz');
    }
}
