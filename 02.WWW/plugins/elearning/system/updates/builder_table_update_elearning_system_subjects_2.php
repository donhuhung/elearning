<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateElearningSystemSubjects2 extends Migration
{
    public function up()
    {
        Schema::table('elearning_system_subjects', function($table)
        {
            $table->integer('ia_active');
            $table->string('thumbnail')->change();
            $table->dropColumn('parent_id');
        });
    }
    
    public function down()
    {
        Schema::table('elearning_system_subjects', function($table)
        {
            $table->dropColumn('ia_active');
            $table->string('thumbnail', 191)->change();
            $table->integer('parent_id')->nullable()->unsigned()->default(0);
        });
    }
}
