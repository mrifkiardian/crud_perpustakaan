<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Model
{
    use SoftDeletes;

    protected $table = 'users';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'address',
        'role',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];


    // Relasi: User sebagai member di loans
    public function memberLoans()
    {
        return $this->hasMany(Loan::class, 'member_id');
    }


    //Relasi: User sebagai librarian di loans
    public function librarianLoans()
    {
        return $this->hasMany(Loan::class, 'librarian_id');
    }
}
