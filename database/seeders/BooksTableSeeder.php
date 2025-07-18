<?php

namespace Database\Seeders;

use App\Models\Book;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class BooksTableSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();

        for ($i = 0; $i < 20; $i++) {
            Book::create([
                'title' => $faker->sentence(3),
                'description' => $faker->paragraph,
                'authors' => $faker->name,
                'isbn' => $faker->isbn13,
            ]);
        }
    }
}
