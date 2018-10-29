<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateElearningSystemProvice extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_provice', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name')->nullable();
            $table->string('type')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('elearning_system_provice');
    }
}
