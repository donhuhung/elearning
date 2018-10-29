<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateElearningSystemQuestion extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_question', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('question');
            $table->integer('course_id');
            $table->smallInteger('is_active');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('elearning_system_question');
    }
}
