<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemCourses extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->double('rating', 10, 0);
            $table->integer('total_student');
            $table->integer('user_id');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_courses', function($table)
        {
            $table->dropColumn('rating');
            $table->dropColumn('total_student');
            $table->dropColumn('user_id');
        });
    }
}
