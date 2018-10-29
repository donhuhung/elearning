<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemCourses5 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->string('price')->nullable();
            $table->string('discount')->nullable();
            $table->string('description', 200)->nullable()->change();
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->dropColumn('price');
            $table->dropColumn('discount');
            $table->string('description', 200)->nullable(false)->change();
        });
    }
}
