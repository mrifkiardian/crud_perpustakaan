$(function () {
    let table = $('#users-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: USERS_DATA_URL,
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
            url: USERS_STORE_URL,
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
        $.get(USERS_EDIT_URL.replace(':id', id), function(data){
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
                url: USERS_DELETE_URL.replace(':id', id),
                method: 'DELETE',
                data: {_token: CSRF_TOKEN},
                success: function(){
                    table.ajax.reload();
                }
            });
        }
    });
});
