<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateElearningSystemCourseStudent extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_course_student', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->integer('course_id');
            $table->integer('student_id');
            $table->integer('is_active');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('elearning_system_course_student');
    }
}
