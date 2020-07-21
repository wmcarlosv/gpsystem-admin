<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendors', function (Blueprint $table) {
            $table->id();
            $table->string('name',120)->nullable(false);
            $table->string('phone',30)->nullable();
            $table->unsignedBigInteger('region_id');
            $table->unsignedBigInteger('city_id');
            $table->text('address')->nullable(false);
            $table->string('logo',150)->nullable();
            $table->timestamps();

            $table->foreign('region_id')->references('id')->on('regions')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('city_id')->references('id')->on('cities')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vendors');
    }
}
