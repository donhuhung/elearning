<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemStoreQuizz3 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_store_quizz', function($table)
        {
            $table->renameColumn('subject_id', 'course_id');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_store_quizz', function($table)
        {
            $table->renameColumn('course_id', 'subject_id');
        });
    }
}
