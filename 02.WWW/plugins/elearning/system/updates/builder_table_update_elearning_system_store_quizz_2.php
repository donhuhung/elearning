<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemStoreQuizz2 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_store_quizz', function($table)
        {
            $table->renameColumn('lesson_id', 'subject_id');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_store_quizz', function($table)
        {
            $table->renameColumn('subject_id', 'lesson_id');
        });
    }
}
