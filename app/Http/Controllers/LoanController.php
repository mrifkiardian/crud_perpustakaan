<?php

namespace App\Http\Controllers;

use App\Models\Loan;
use App\Models\Book;
use App\Models\User;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class LoanController extends Controller
{
    public function index()
    {
        $books = Book::all();
        $librarians = User::where('role', 'librarian')->get();
        $members = User::where('role', 'member')->get();

        return view('loans.index', compact('books', 'librarians', 'members'));
    }

    public function ajax()
    {
        $query = Loan::with(['book', 'librarian', 'member'])->select('loans.*');

        return DataTables::eloquent($query)
            ->addColumn('book', fn($loan) => $loan->book->title ?? '-')
            ->addColumn('librarian', fn($loan) => $loan->librarian->name ?? '-')
            ->addColumn('member', fn($loan) => $loan->member->name ?? '-')
            ->editColumn('loan_at', fn($loan) => $loan->loan_at?->format('Y-m-d H:i') ?? '-')
            ->editColumn('returned_at', fn($loan) => $loan->returned_at?->format('Y-m-d H:i') ?? '-')
            ->addColumn('actions', fn($loan) => view('loans.actions', compact('loan'))->render())
            ->rawColumns(['actions'])
            ->toJson();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'book_id' => 'required',
            'librarian_id' => 'required',
            'member_id' => 'required',
            'loan_at' => 'required|date',
            'returned_at' => 'nullable|date|after_or_equal:loan_at',
            'note' => 'nullable',
        ]);

        Loan::create($validated);

        return response()->json(['success' => true]);
    }

    public function show(Loan $loan)
    {
        return response()->json($loan->load(['book', 'librarian', 'member']));
    }

    public function update(Request $request, Loan $loan)
    {
        $validated = $request->validate([
            'book_id' => 'required',
            'librarian_id' => 'required',
            'member_id' => 'required',
            'loan_at' => 'required|date',
            'returned_at' => 'nullable|date',
            'note' => 'nullable',
        ]);

        $loan->update($validated);

        return response()->json(['success' => true]);
    }

    public function destroy(Loan $loan)
    {
        $loan->delete();

        return response()->json(['success' => true]);
    }
}
