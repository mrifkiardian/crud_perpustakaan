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
        $users = User::query();

        return DataTables::of($users)
            ->addColumn('action', function($user){
                return '
                    <button class="btn btn-primary btn-sm edit" data-id="'.$user->id.'">Edit</button>
                    <button class="btn btn-danger btn-sm delete" data-id="'.$user->id.'">Delete</button>
                ';
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email,' . $request->id,
            'phone' => 'nullable',
            'address' => 'nullable',
            'role' => 'required|in:librarian,member,admin',
        ]);

        $user = User::updateOrCreate(
            ['id' => $request->id],
            $validated
        );

        return response()->json(['success' => true, 'message' => 'User saved']);
    }

    public function edit(User $user)
    {
        return response()->json($user);
    }

    public function destroy(User $user)
    {
        $user->delete();

        return response()->json(['success' => true, 'message' => 'User deleted']);
    }
}
