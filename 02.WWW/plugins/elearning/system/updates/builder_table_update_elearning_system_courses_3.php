<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemCourses3 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->integer('is_highlight');
            $table->integer('total_lesson');
            $table->integer('total_time_learn');
            $table->string('thumbnail')->change();
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->dropColumn('is_highlight');
            $table->dropColumn('total_lesson');
            $table->dropColumn('total_time_learn');
            $table->string('thumbnail', 191)->change();
        });
    }
}
