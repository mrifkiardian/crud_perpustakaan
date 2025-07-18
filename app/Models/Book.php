<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{
    use SoftDeletes;

    protected $table = 'books';

    protected $fillable = [
        'title',
        'description',
        'authors',
        'isbn',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];


    // Relasi: Book -> BookCategories
    public function categories()
    {
        return $this->belongsToMany(Category::class, 'book_categories');
    }


    // Relasi: Book -> Loans
    public function loans()
    {
        return $this->hasMany(Loan::class);
    }
}
