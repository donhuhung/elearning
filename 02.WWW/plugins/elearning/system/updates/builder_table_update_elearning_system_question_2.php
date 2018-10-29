<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemQuestion2 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_question', function($table)
        {
            $table->renameColumn('course_id', 'lesson_id');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_question', function($table)
        {
            $table->renameColumn('lesson_id', 'course_id');
        });
    }
}
