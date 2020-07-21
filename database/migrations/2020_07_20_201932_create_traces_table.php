<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTracesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('traces', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('vendor_id');
            $table->unsignedBigInteger('vehicle_id');
            $table->unsignedBigInteger('device_id');
            $table->decimal('latitude')->nullable(false);
            $table->decimal('longitude')->nullable(false);
            $table->double('speed')->nullable(false);
            $table->timestamps();

            $table->foreign('vendor_id')->references('id')->on('vendors')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('vehicle_id')->references('id')->on('vehicles')->onUpdate('cascade')->onDelete('restrict');
            $table->foreign('device_id')->references('id')->on('devices')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('traces');
    }
}
