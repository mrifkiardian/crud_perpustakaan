<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\BookCategoryController;
use App\Http\Controllers\LoanController;


Route::get('/', function () {
    return view('welcome');
});

//CRUD Users
Route::resource('users', App\Http\Controllers\UserController::class);
Route::get('users-data', [App\Http\Controllers\UserController::class, 'data'])->name('users.data');

//CRUD Books
Route::get('/books/fetch', [BookController::class, 'fetch'])->name('books.fetch');
Route::resource('books', BookController::class);



//CRUD Categories
Route::prefix('categories')->name('categories.')->group(function () {
    Route::get('/', [\App\Http\Controllers\CategoryController::class, 'index'])->name('index');
    Route::get('/list', [\App\Http\Controllers\CategoryController::class, 'list'])->name('list');
    Route::post('/', [\App\Http\Controllers\CategoryController::class, 'store'])->name('store');
    Route::get('/{id}', [\App\Http\Controllers\CategoryController::class, 'edit'])->name('edit');
    Route::put('/{id}', [\App\Http\Controllers\CategoryController::class, 'update'])->name('update');
    Route::delete('/{id}', [\App\Http\Controllers\CategoryController::class, 'destroy'])->name('destroy');
});

//CRUD Book_Categories
Route::resource('book_categories', BookCategoryController::class);
//CRUD loans
Route::get('/loans', [LoanController::class, 'index'])->name('loans.index');
Route::get('/loans/ajax', [LoanController::class, 'ajax'])->name('loans.ajax');
Route::post('/loans/store', [LoanController::class, 'store'])->name('loans.store');
Route::get('/loans/{loan}', [LoanController::class, 'show'])->name('loans.show');
Route::post('/loans/update/{loan}', [LoanController::class, 'update'])->name('loans.update');
Route::delete('/loans/delete/{loan}', [LoanController::class, 'destroy'])->name('loans.destroy');