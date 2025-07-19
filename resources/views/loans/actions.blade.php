@if(in_array(auth()->user()->role, ['admin', 'librarian']))
    <a href="javascript:void(0);" onclick="editLoan({{ $loan->id }})" class="btn btn-sm btn-primary">Edit</a>

    <button onclick="deleteLoan({{ $loan->id }})" class="btn btn-sm btn-danger">Hapus</button>
@endif
