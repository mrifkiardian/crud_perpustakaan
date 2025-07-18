<div class="mb-3">
    <label for="book_id" class="form-label">Book</label>
    <select name="book_id" id="book_id" class="form-control">
        @foreach($books as $book)
            <option value="{{ $book->id }}" {{ (old('book_id', $loan->book_id ?? '') == $book->id) ? 'selected' : '' }}>
                {{ $book->title }}
            </option>
        @endforeach
    </select>
</div>

<div class="mb-3">
    <label for="librarian_id" class="form-label">Librarian</label>
    <select name="librarian_id" id="librarian_id" class="form-control">
        @foreach($librarians as $librarian)
            <option value="{{ $librarian->id }}" {{ (old('librarian_id', $loan->librarian_id ?? '') == $librarian->id) ? 'selected' : '' }}>
                {{ $librarian->name }}
            </option>
        @endforeach
    </select>
</div>

<div class="mb-3">
    <label for="member_id" class="form-label">Member</label>
    <select name="member_id" id="member_id" class="form-control">
        @foreach($members as $member)
            <option value="{{ $member->id }}" {{ (old('member_id', $loan->member_id ?? '') == $member->id) ? 'selected' : '' }}>
                {{ $member->name }}
            </option>
        @endforeach
    </select>
</div>

<div class="mb-3">
    <label for="loan_at" class="form-label">Loan At</label>
    <input type="datetime-local" name="loan_at" id="loan_at" class="form-control"
        value="{{ old('loan_at', isset($loan->loan_at) ? \Carbon\Carbon::parse($loan->loan_at)->format('Y-m-d\TH:i') : '') }}">
</div>

<div class="mb-3">
    <label for="returned_at" class="form-label">Returned At</label>
    <input type="datetime-local" name="returned_at" id="returned_at" class="form-control"
        value="{{ old('returned_at', isset($loan->returned_at) ? \Carbon\Carbon::parse($loan->returned_at)->format('Y-m-d\TH:i') : '') }}">
</div>

<div class="mb-3">
    <label for="note" class="form-label">Note</label>
    <textarea name="note" id="note" class="form-control">{{ old('note', $loan->note ?? '') }}</textarea>
</div>
