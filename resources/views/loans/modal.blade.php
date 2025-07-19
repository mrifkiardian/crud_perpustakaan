<div class="modal fade" id="loanModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <form id="loanForm">
        @csrf
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Peminjaman Buku</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="loan_id">

          <div class="mb-3">
            <label>Buku</label>
            <select class="form-select" id="book_id" name="book_id" required>
              @foreach($books as $book)
              <option value="{{ $book->id }}">{{ $book->title }}</option>
              @endforeach
            </select>
          </div>

          <div class="mb-3">
            <label>Penjaga</label>
            <select class="form-select" id="librarian_id" name="librarian_id" required>
              @foreach($librarians as $librarian)
              <option value="{{ $librarian->id }}">{{ $librarian->name }}</option>
              @endforeach
            </select>
          </div>

          <div class="mb-3">
            <label>Member</label>
            <select class="form-select" id="member_id" name="member_id" required>
              @foreach($members as $member)
              <option value="{{ $member->id }}">{{ $member->name }}</option>
              @endforeach
            </select>
          </div>

          <div class="mb-3">
            <label>Dipinjam Pada</label>
            <input type="datetime-local" id="loan_at" name="loan_at" class="form-control" required>
          </div>

          <div class="mb-3">
            <label>Dikembalikan pada</label>
            <input type="datetime-local" id="returned_at" name="returned_at" class="form-control">
          </div>

          <div class="mb-3">
            <label>Catatan</label>
            <textarea id="note" name="note" class="form-control"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Simpan</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
        </div>
      </div>
    </form>
  </div>
</div>
