<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemCourses4 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->text('content');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->dropColumn('content');
        });
    }
}
