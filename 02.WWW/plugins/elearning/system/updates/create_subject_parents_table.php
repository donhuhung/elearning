<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateSubjectParentsTable extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_subject_parents', function(Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name')->unique();
            $table->timestamps();
       
        });
    }

    public function down()
    {
        Schema::dropIfExists('elearning_system_subject_parents');
    }
}
