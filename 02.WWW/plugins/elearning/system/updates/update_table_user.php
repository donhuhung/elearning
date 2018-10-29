<?php namespace Elearning\System\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class UpdateTableUser extends Migration
{

    public function up()
    {
        Schema::table('users', function($table)
        {
            $table->string('birthday');
            $table->string('address');
            $table->string('phone');
            $table->string('description');
            $table->integer('gender');
            $table->integer('province_id');
            $table->integer('district_id');
        });
    }

    public function down()
    {
        Schema::table('users', function($table)
        {
            $table->dropColumn('birthday');
            $table->dropColumn('address');
            $table->dropColumn('phone');
            $table->dropColumn('description');
            $table->dropColumn('gender');
            $table->dropColumn('province_id');
            $table->dropColumn('district_id');
        });
    }

}
