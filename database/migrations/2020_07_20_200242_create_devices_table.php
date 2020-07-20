<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDevicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('devices', function (Blueprint $table) {
            $table->id();
            $table->string('imei',100)->nullable(false);
            $table->unsignedBigInteger('brand_id');
            $table->unsignedBigInteger('model_element_id');
            $table->unsignedBigInteger('server_id');
            $table->timestamps();

            $table->foreign('brand_id')->references('id')->on('brands')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('model_element_id')->references('id')->on('model_elements')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('server_id')->references('id')->on('servers')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('devices');
    }
}
