@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Users</h1>

    <button id="addUser" class="btn btn-primary mb-3">Add User</button>

    <table class="table table-bordered" id="users-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Role</th>
                <th>Action</th>
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
                <h5 class="modal-title">User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label>Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Phone</label>
                    <input type="text" name="phone" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Address</label>
                    <input type="text" name="address" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Role</label>
                    <select name="role" class="form-control" required>
                        <option value="">Select</option>
                        <option value="librarian">Librarian</option>
                        <option value="member">Member</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </div>
    </form>
  </div>
</div>
@endsection

@push('scripts')
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="//cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
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
            $('[name=role]').val(data.role);
            $('#userModal').modal('show');
        });
    });

    $('#users-table').on('click', '.delete', function(){
        if(confirm('Are you sure?')) {
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
