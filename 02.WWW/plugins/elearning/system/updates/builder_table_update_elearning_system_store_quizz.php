<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemStoreQuizz extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_store_quizz', function($table)
        {
            $table->integer('is_active')->default(1);
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_store_quizz', function($table)
        {
            $table->dropColumn('is_active');
        });
    }
}
