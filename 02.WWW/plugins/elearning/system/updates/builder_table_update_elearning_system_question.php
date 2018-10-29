<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemQuestion extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_question', function($table)
        {
            $table->integer('user_id');
            $table->string('question')->change();
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_question', function($table)
        {
            $table->dropColumn('user_id');
            $table->string('question', 191)->change();
        });
    }
}
