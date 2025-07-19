<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    public function run(): void
    {
        User::updateOrCreate(
            ['email' => 'admin@example.com'],
            [
                'name' => 'Administrator',
                'email' => 'admin@example.com',
                'phone' => '081234567890',
                'address' => 'Alamat admin',
                'role' => 'admin',
                'password' => Hash::make('password'),
            ]
        );

        User::updateOrCreate(
            ['email' => 'librarian@example.com'],
            [
                'name' => 'Librarian',
                'email' => 'librarian@example.com',
                'phone' => '081234567891',
                'address' => 'Alamat librarian',
                'role' => 'librarian',
                'password' => Hash::make('password'),
            ]
        );

        User::updateOrCreate(
        ['email' => 'member@example.com'],
        [
            'name' => 'Test',
            'email' => 'member@example.com',
            'phone' => '08123456781',
            'address' => 'Member Address 1',
            'role' => 'member',
            'password' => Hash::make('password'),
        ]
    );
    }
}
