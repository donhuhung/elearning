<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemSubjects extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_subjects', function($table)
        {
            $table->text('description')->nullable();
            $table->string('thumbnail')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_subjects', function($table)
        {
            $table->dropColumn('description');
            $table->dropColumn('thumbnail');
        });
    }
}
