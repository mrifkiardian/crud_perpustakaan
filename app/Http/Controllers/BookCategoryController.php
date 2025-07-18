<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\BookCategory;
use App\Models\Category;
use Illuminate\Http\Request;

class BookCategoryController extends Controller
{
    public function index()
    {
        $bookCategories = BookCategory::with(['book', 'category'])->get();
        return view('book_categories.index', compact('bookCategories'));
    }

    public function create()
    {
        $books = Book::all();
        $categories = Category::all();
        return view('book_categories.create', compact('books', 'categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'book_id' => 'required|exists:books,id',
            'category_id' => 'required|exists:categories,id',
        ]);

        BookCategory::create($request->only(['book_id', 'category_id']));

        return redirect()->route('book_categories.index')->with('success', 'Book-Category relation added successfully.');
    }

    public function edit(BookCategory $bookCategory)
    {
        $books = Book::all();
        $categories = Category::all();
        return view('book_categories.edit', compact('bookCategory', 'books', 'categories'));
    }

    public function update(Request $request, BookCategory $bookCategory)
    {
        $request->validate([
            'book_id' => 'required|exists:books,id',
            'category_id' => 'required|exists:categories,id',
        ]);

        $bookCategory->update($request->only(['book_id', 'category_id']));

        return redirect()->route('book_categories.index')->with('success', 'Book-Category relation updated successfully.');
    }

    public function destroy(BookCategory $bookCategory)
    {
        $bookCategory->delete();

        return redirect()->route('book_categories.index')->with('success', 'Book-Category relation deleted successfully.');
    }
}

