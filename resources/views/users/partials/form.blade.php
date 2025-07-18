<div class="mb-3">
    <label>Name</label>
    <input type="text" name="name" class="form-control" value="{{ old('name', $user->name ?? '') }}" required>
    @error('name') <small class="text-danger">{{ $message }}</small> @enderror
</div>

<div class="mb-3">
    <label>Email</label>
    <input type="email" name="email" class="form-control" value="{{ old('email', $user->email ?? '') }}" required>
    @error('email') <small class="text-danger">{{ $message }}</small> @enderror
</div>

<div class="mb-3">
    <label>Phone</label>
    <input type="text" name="phone" class="form-control" value="{{ old('phone', $user->phone ?? '') }}">
</div>

<div class="mb-3">
    <label>Address</label>
    <textarea name="address" class="form-control">{{ old('address', $user->address ?? '') }}</textarea>
</div>

<div class="mb-3">
    <label>Role</label>
    <select name="role" class="form-control" required>
        <option value="">-- Select Role --</option>
        @foreach(['librarian', 'member', 'admin'] as $role)
            <option value="{{ $role }}" @selected(old('role', $user->role ?? '') === $role)>
                {{ ucfirst($role) }}
            </option>
        @endforeach
    </select>
    @error('role') <small class="text-danger">{{ $message }}</small> @enderror
</div>

<button type="submit" class="btn btn-success">{{ $submit }}</button>
<a href="{{ route('users.index') }}" class="btn btn-secondary">Cancel</a>
