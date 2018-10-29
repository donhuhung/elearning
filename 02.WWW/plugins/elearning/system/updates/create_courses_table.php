<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateCoursesTable extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_courses', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');            
            $table->string('name')->unique();
            $table->string('slug')->unique()->index();
            $table->boolean('publish');
           
            $table->timestamps();

           
            $table->integer('level_id')->unsigned()->nullable();
            $table->foreign('level_id')->references('id')->on('elearning_system_levels');             
    

            $table->integer('subject_id')->unsigned()->nullable();
            $table->foreign('subject_id')->references('id')->on('elearning_system_subjects');            
         
            
        });
    }

    public function down()
    {
        Schema::dropIfExists('elearning_system_courses');
    }
}
