@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Member</h1>

    <button id="addUser" class="btn btn-primary mb-3">Tambah Member</button>

    <table class="table table-bordered" id="users-table">
        <thead>
            <tr>
                <th>Nama</th>
                <th>Email</th>
                <th>Telepon</th>
                <th>Alamat</th>
                <th>Role</th>
                <th>Aksi</th>
            </tr>
        </thead>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="userModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <form id="userForm">
        @csrf
        <input type="hidden" name="id" id="id">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Member</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label>Nama</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Telepon</label>
                    <input type="text" name="phone" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Alamat</label>
                    <input type="text" name="address" class="form-control">
                </div>
                @if(auth()->user()->role === 'admin')
                <div class="mb-3">
                    <label>Role</label>
                    <select name="role" class="form-control">
                        <option value="member">Member</option>
                        <option value="librarian">Librarian</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                @endif
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Simpan</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
            </div>
        </div>
    </form>
  </div>
</div>
@endsection

@push('scripts')
<script>
$(function () {
    let table = $('#users-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: "{{ route('users.data') }}",
        columns: [
            { data: 'name' },
            { data: 'email' },
            { data: 'phone' },
            { data: 'address' },
            { data: 'role' },
            { data: 'action', orderable: false, searchable: false }
        ]
    });

    $('#addUser').click(function(){
        $('#userForm')[0].reset();
        $('#id').val('');
        $('#userModal').modal('show');
    });

    $('#userForm').submit(function(e){
        e.preventDefault();
        $.ajax({
            url: "{{ route('users.store') }}",
            method: 'POST',
            data: $(this).serialize(),
            success: function(){
                $('#userModal').modal('hide');
                table.ajax.reload();
            }
        });
    });

    $('#users-table').on('click', '.edit', function(){
        let id = $(this).data('id');
        $.get("{{ url('users') }}/" + id + "/edit", function(data){
            $('#id').val(data.id);
            $('[name=name]').val(data.name);
            $('[name=email]').val(data.email);
            $('[name=phone]').val(data.phone);
            $('[name=address]').val(data.address);
            if(data.role) $('[name=role]').val(data.role);
            $('#userModal').modal('show');
        });
    });

    $('#users-table').on('click', '.delete', function(){
        if(confirm('Yakin ingin menghapus user ini?')) {
            let id = $(this).data('id');
            $.ajax({
                url: "{{ url('users') }}/" + id,
                method: 'DELETE',
                data: {_token: '{{ csrf_token() }}'},
                success: function(){
                    table.ajax.reload();
                }
            });
        }
    });
});
</script>
@endpush
