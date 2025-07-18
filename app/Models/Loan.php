<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Loan extends Model
{
    protected $table = 'loans';

    protected $fillable = [
        'book_id',
        'librarian_id',
        'member_id',
        'loan_at',
        'returned_at',
        'note',
    ];

    protected $casts = [
        'loan_at' => 'datetime',
        'returned_at' => 'datetime',
    ];


    
    // Relasi: Loan -> Book
    public function book()
    {
        return $this->belongsTo(Book::class);
    }


    // Relasi: Loan -> Librarian
    public function librarian()
    {
        return $this->belongsTo(User::class, 'librarian_id');
    }


    // Relasi: Loan -> Member
    public function member()
    {
        return $this->belongsTo(User::class, 'member_id');
    }
}
