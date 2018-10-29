<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemSubjects3 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_subjects', function($table)
        {
            $table->string('thumbnail')->change();
            $table->renameColumn('ia_active', 'is_active');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_subjects', function($table)
        {
            $table->string('thumbnail', 191)->change();
            $table->renameColumn('is_active', 'ia_active');
        });
    }
}
