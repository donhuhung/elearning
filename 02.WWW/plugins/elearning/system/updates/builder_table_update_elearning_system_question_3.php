<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemQuestion3 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_question', function($table)
        {
            $table->dropColumn('lesson_id');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_question', function($table)
        {
            $table->integer('lesson_id');
        });
    }
}
