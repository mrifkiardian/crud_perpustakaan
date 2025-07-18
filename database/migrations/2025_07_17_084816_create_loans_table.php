<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('loans', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('book_id');
            $table->unsignedBigInteger('librarian_id');
            $table->unsignedBigInteger('member_id');
            $table->dateTime('loan_at');
            $table->dateTime('returned_at')->nullable();
            $table->string('note')->nullable();
            $table->timestamps();

            // Foreign Keys
            $table->foreign('book_id')->references('id')->on('books')->onDelete('cascade');
            $table->foreign('librarian_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('member_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('loans');
    }
};
