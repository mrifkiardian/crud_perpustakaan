<?php

namespace Database\Seeders;

use App\Models\BookCategory;
use App\Models\Book;
use App\Models\Category;
use Illuminate\Database\Seeder;

class BookCategoriesTableSeeder extends Seeder
{
    public function run(): void
    {
        $books = Book::all();
        $categories = Category::all();

        foreach ($books as $book) {
            // Randomly assign 1–3 categories per book
            $bookCategories = $categories->random(rand(1, 3));

            foreach ($bookCategories as $category) {
                BookCategory::create([
                    'book_id' => $book->id,
                    'category_id' => $category->id,
                ]);
            }
        }
    }
}
