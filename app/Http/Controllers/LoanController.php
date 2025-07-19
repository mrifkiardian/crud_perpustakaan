<?php

namespace App\Http\Controllers;

use App\Models\Loan;
use App\Models\Book;
use App\Models\User;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class LoanController extends Controller
{
    /**
     * Display the loans page.
     */
    public function index()
    {
        $user = auth()->user();


        if ($user->role === 'member') {
            // Member hanya butuh halaman & tabel
            return view('loans.index');
        }

        // Librarian/Admin dapatkan data untuk dropdown form
        $books = Book::all();
        $librarians = User::where('role', 'librarian')->get();
        $members = User::where('role', 'member')->get();

        return view('loans.index', compact('books', 'librarians', 'members'));
    }


    public function ajax()
    {
        $user = auth()->user();

        $query = Loan::with(['book', 'librarian', 'member'])->select('loans.*');

        if ($user->role === 'member') {
            $query->where('member_id', $user->id);
        }

        $dataTable = DataTables::eloquent($query)
            ->addColumn('book', fn($loan) => $loan->book->title ?? '-')
            ->addColumn('librarian', fn($loan) => $loan->librarian->name ?? '-')
            ->addColumn('member', fn($loan) => $loan->member->name ?? '-')
            ->editColumn('loan_at', fn($loan) => $loan->loan_at?->format('Y-m-d H:i') ?? '-')
            ->editColumn('returned_at', fn($loan) => $loan->returned_at?->format('Y-m-d H:i') ?? '-');

        if ($user->role !== 'member') {
            $dataTable->addColumn('actions', fn($loan) => view('loans.actions', compact('loan'))->render())
                      ->rawColumns(['actions']);
        }

        return $dataTable->toJson();
    }


    public function store(Request $request)
    {
        abort_if(auth()->user()->role === 'member', 403, 'Anda tidak berhak menambahkan peminjaman.');

        $validated = $request->validate([
            'book_id' => 'required|exists:books,id',
            'librarian_id' => 'required|exists:users,id',
            'member_id' => 'required|exists:users,id',
            'loan_at' => 'required|date',
            'returned_at' => 'nullable|date|after_or_equal:loan_at',
            'note' => 'nullable|string',
        ]);

        Loan::create($validated);

        return response()->json(['success' => true]);
    }


    public function show(Loan $loan)
    {
        $loan->load(['book', 'librarian', 'member']);

        return response()->json($loan);
    }


    public function update(Request $request, Loan $loan)
    {
        abort_if(auth()->user()->role === 'member', 403, 'Anda tidak berhak mengedit peminjaman.');

        $validated = $request->validate([
            'book_id' => 'required|exists:books,id',
            'librarian_id' => 'required|exists:users,id',
            'member_id' => 'required|exists:users,id',
            'loan_at' => 'required|date',
            'returned_at' => 'nullable|date',
            'note' => 'nullable|string',
        ]);

        $loan->update($validated);

        return response()->json(['success' => true]);
    }


    public function destroy(Loan $loan)
    {
        abort_if(auth()->user()->role === 'member', 403, 'Anda tidak berhak menghapus peminjaman.');

        $loan->delete();

        return response()->json(['success' => true]);
    }
}
