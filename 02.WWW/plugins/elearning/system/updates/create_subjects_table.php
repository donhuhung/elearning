<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateSubjectsTable extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_subjects', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');            
            $table->string('name')->unique();
            $table->string('slug')->unique()->index(); 
            $table->timestamps();

            $table->integer('parent_id')->unsigned();
            $table->foreign('parent_id')->references('id')->on('elearning_system_subject_parents');

           
                     
         
            
        });
    }

    public function down()
    {
        Schema::dropIfExists('elearning_system_subjects');
    }
}
