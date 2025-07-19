<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class UserController extends Controller
{
    public function index()
    {
        return view('users.index');
    }

    public function data()
    {
        $authUser = auth()->user();

        if ($authUser->role === 'admin') {
            $users = User::query(); // admin bisa lihat semua
        } else {
            $users = User::where('role', 'member'); // librarian hanya member
        }

        return DataTables::of($users)
            ->addColumn('action', function ($user) {
                return '
                    <button class="btn btn-primary btn-sm edit" data-id="' . $user->id . '">Edit</button>
                    <button class="btn btn-danger btn-sm delete" data-id="' . $user->id . '">Delete</button>
                ';
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function store(Request $request)
    {
        $authUser = auth()->user();

        $validated = $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email,' . $request->id,
            'phone' => 'nullable',
            'address' => 'nullable',
            'role' => 'nullable|in:librarian,member,admin',
        ]);

        if ($authUser->role !== 'admin') {
            $validated['role'] = 'member';
        }

        User::updateOrCreate(
            ['id' => $request->id],
            $validated
        );

        return response()->json(['success' => true, 'message' => 'User saved']);
    }

    public function edit(User $user)
    {
        if (auth()->user()->role !== 'admin' && $user->role !== 'member') {
            abort(403, 'Hanya bisa edit member');
        }

        return response()->json($user);
    }

    public function destroy(User $user)
    {
        if (auth()->user()->role !== 'admin' && $user->role !== 'member') {
            abort(403, 'Hanya bisa hapus member');
        }

        $user->delete();

        return response()->json(['success' => true, 'message' => 'User deleted']);
    }
}
