<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemQuizzLog extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_quizz_log', function($table)
        {
            $table->renameColumn('quizz_id', 'quizz_result_id');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_quizz_log', function($table)
        {
            $table->renameColumn('quizz_result_id', 'quizz_id');
        });
    }
}
