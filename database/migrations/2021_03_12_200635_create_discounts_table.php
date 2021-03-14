<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDiscountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('discounts', function (Blueprint $table) {
            $table->id();
            $table->string('title', 255);
            $table->bigInteger('product_id')->unsigned()->nullable();
            $table->smallInteger('quantity');
            $table->tinyInteger('discount_percent');
            $table->tinyInteger('status');
            $table->timestamps();
        });

        Schema::table('discounts', function($table) {
            $table->foreign('product_id')->references('id')->on('discounts');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('discounts');
    }
}
