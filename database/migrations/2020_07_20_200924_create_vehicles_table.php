<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVehiclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehicles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('vendor_id');
            $table->string('vehicle_number',120)->nullable(false);
            $table->unsignedBigInteger('brand_id');
            $table->unsignedBigInteger('model_element_id');
            $table->unsignedBigInteger('vehicle_type_id');
            $table->string('photo',150)->nullable();
            $table->boolean('is_active')->nullable(false)->default(1);
            $table->timestamps();

            $table->foreign('vendor_id')->references('id')->on('vendors')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('brand_id')->references('id')->on('brands')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('model_element_id')->references('id')->on('model_elements')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('vehicle_type_id')->references('id')->on('vehicle_types')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vehicles');
    }
}
