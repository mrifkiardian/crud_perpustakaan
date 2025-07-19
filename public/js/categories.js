$(document).ready(function () {
    $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
    });

    let table = $('#categories-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/categories/list',
        columns: [
            
            { data: 'name', name: 'name' },
            { data: 'created_at', name: 'created_at' },
            { data: 'action', name: 'action', orderable: false, searchable: false },
        ]
    });

    $('#addCategory').click(function () {
        $('#categoryForm')[0].reset();
        $('#categoryId').val('');
        $('#categoryModal').modal('show');
    });

    $(document).on('click', '.edit', function () {
        let id = $(this).data('id');
        $.get('/categories/' + id, function (data) {
            $('#categoryId').val(data.id);
            $('#categoryName').val(data.name);
            $('#categoryModal').modal('show');
        });
    });

    $('#categoryForm').submit(function (e) {
        e.preventDefault();
        let id = $('#categoryId').val();
        let url = '/categories' + (id ? '/' + id : '');
        let type = id ? 'PUT' : 'POST';

        $.ajax({
            url: url,
            type: type,
            data: $(this).serialize(),
            success: function () {
                $('#categoryModal').modal('hide');
                table.ajax.reload();
            }
        });
    });

    $(document).on('click', '.delete', function () {
        if (!confirm('Are you sure?')) return;
        let id = $(this).data('id');
        $.ajax({
            url: '/categories/' + id,
            type: 'DELETE',
            data: { _token: $('meta[name="csrf-token"]').attr('content') },
            success: function () {
                table.ajax.reload();
            }
        });
    });
});
