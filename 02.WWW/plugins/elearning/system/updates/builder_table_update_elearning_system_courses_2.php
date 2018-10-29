<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemCourses2 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->string('thumbnail');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->dropColumn('thumbnail');
        });
    }
}
