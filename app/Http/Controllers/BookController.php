<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use Illuminate\Http\Request;

class BookController extends Controller
{
    public function index()
    {
        return view('books.index');
    }

    public function fetch()
    {
        $books = Book::with('categories')->get();

        return datatables()
            ->of($books)
            ->addColumn('categories', fn ($row) => $row->categories->pluck('name')->implode(', '))
            ->addColumn('actions', fn ($row) => view('books.partials.actions', compact('row'))->render())
            ->rawColumns(['actions'])
            ->toJson();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string',
            'description' => 'nullable|string',
            'authors' => 'nullable|string',
            'isbn' => 'nullable|string',
            'categories' => 'array',
        ]);

        $book = Book::create([
            'title' => $validated['title'],
            'description' => $validated['description'] ?? null,
            'authors' => $validated['authors'] ?? null,
            'isbn' => $validated['isbn'] ?? null,
        ]);

        $book->categories()->sync($validated['categories'] ?? []);

        return response()->json(['success' => true]);
    }

    public function show(Book $book)
    {
        $book->load('categories:id');
        return response()->json($book);
    }

    public function edit(Book $book)
    {
        $book->load('categories:id');
        return response()->json($book);
    }

    public function update(Request $request, Book $book)
    {
        $validated = $request->validate([
            'title' => 'required|string',
            'description' => 'nullable|string',
            'authors' => 'nullable|string',
            'isbn' => 'nullable|string',
            'categories' => 'array',
        ]);

        $book->update([
            'title' => $validated['title'],
            'description' => $validated['description'] ?? null,
            'authors' => $validated['authors'] ?? null,
            'isbn' => $validated['isbn'] ?? null,
        ]);

        $book->categories()->sync($validated['categories'] ?? []);

        return response()->json(['success' => true]);
    }

    public function destroy(Book $book)
    {
        $book->categories()->detach();
        $book->delete();

        return response()->json(['success' => true]);
    }
}
