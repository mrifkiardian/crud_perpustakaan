<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\BookCategoryController;
use App\Http\Controllers\LoanController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Ini adalah routes aplikasi perpustakaan Anda.
| Sudah mendukung Auth (Breeze) + Middleware Role.
|
*/

// Halaman depan
Route::get('/', function () {
    return view('welcome');
});

// Dashboard setelah login (disiapkan oleh Breeze)
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

// Routes auth Breeze
require __DIR__.'/auth.php';

/*
|--------------------------------------------------------------------------
| Routes CRUD sesuai Role
|--------------------------------------------------------------------------
*/

// CRUD Users → hanya admin
Route::middleware(['auth', 'role:admin,librarian'])->group(function () {
    Route::resource('users', UserController::class);
    Route::get('users-data', [UserController::class, 'data'])->name('users.data');
});

// CRUD Books → admin & librarian
Route::middleware(['auth'])->group(function () {
    Route::get('/books/fetch', [BookController::class, 'fetch'])->name('books.fetch');
    Route::resource('books', BookController::class);
});

// CRUD Categories → admin & librarian
Route::middleware(['auth', 'role:admin,librarian'])->prefix('categories')->name('categories.')->group(function () {
    Route::get('/', [CategoryController::class, 'index'])->name('index');
    Route::get('/list', [CategoryController::class, 'list'])->name('list');
    Route::post('/', [CategoryController::class, 'store'])->name('store');
    Route::get('/{id}', [CategoryController::class, 'edit'])->name('edit');
    Route::put('/{id}', [CategoryController::class, 'update'])->name('update');
    Route::delete('/{id}', [CategoryController::class, 'destroy'])->name('destroy');
});

// CRUD Book_Categories → admin & librarian
Route::middleware(['auth', 'role:admin,librarian'])->group(function () {
    Route::resource('book_categories', BookCategoryController::class);
});

// CRUD Loans → semua role
Route::middleware(['auth'])->group(function () {
    Route::get('/loans', [LoanController::class, 'index'])->name('loans.index');
    Route::get('/loans/ajax', [LoanController::class, 'ajax'])->name('loans.ajax');
    Route::post('/loans/store', [LoanController::class, 'store'])->name('loans.store');
    Route::get('/loans/{loan}', [LoanController::class, 'show'])->name('loans.show');
    Route::post('/loans/update/{loan}', [LoanController::class, 'update'])->name('loans.update');
    Route::delete('/loans/delete/{loan}', [LoanController::class, 'destroy'])->name('loans.destroy');
});
