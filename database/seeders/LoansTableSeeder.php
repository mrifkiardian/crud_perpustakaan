<?php

namespace Database\Seeders;

use App\Models\Loan;
use App\Models\Book;
use App\Models\User;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class LoansTableSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();

        $books = Book::all();
        $librarians = User::where('role', 'librarian')->get();
        $members = User::where('role', 'member')->get();

        for ($i = 0; $i < 15; $i++) {
            Loan::create([
                'book_id' => $books->random()->id,
                'librarian_id' => $librarians->random()->id,
                'member_id' => $members->random()->id,
                'loan_at' => $faker->dateTimeBetween('-2 months', 'now'),
                'returned_at' => rand(0, 1) ? $faker->dateTimeBetween('-1 months', 'now') : null,
                'note' => $faker->sentence,
            ]);
        }
    }
}
