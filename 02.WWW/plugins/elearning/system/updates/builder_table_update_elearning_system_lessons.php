<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemLessons extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_lessons', function($table)
        {
            $table->integer('user_id');
            $table->integer('is_active');
            $table->text('parameters')->nullable();
            $table->string('thumbnail')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_lessons', function($table)
        {
            $table->dropColumn('user_id');
            $table->dropColumn('is_active');
            $table->dropColumn('parameters');
            $table->dropColumn('thumbnail');
        });
    }
}
