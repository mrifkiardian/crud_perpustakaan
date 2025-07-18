<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BookCategory extends Model
{
    protected $table = 'book_categories';

    public $timestamps = true;

    protected $fillable = [
        'book_id',
        'category_id',
    ];

    
    // Relasi: BookCategory -> Book
    public function book()
    {
        return $this->belongsTo(Book::class);
    }

    
    // Relasi: BookCategory -> Category
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
