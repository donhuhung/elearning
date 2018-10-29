<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateElearningSystemDistrict extends Migration
{
    public function up()
    {
        Schema::create('elearning_system_district', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('name')->nullable();
            $table->string('type')->nullable();
            $table->string('province_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('elearning_system_district');
    }
}
