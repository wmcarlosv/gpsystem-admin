<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModelElementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('model_elements', function (Blueprint $table) {
            $table->id();
            $table->string('name',120)->nullable(false);
            $table->unsignedBigInteger('brand_id');
            $table->boolean('is_vehicle')->nullable()->default(1);
            $table->boolean('is_device')->nullable()->default(1);
            $table->timestamps();

            $table->foreign('brand_id')->references('id')->on('brands')->onUpdate('cascade')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('model_elements');
    }
}
