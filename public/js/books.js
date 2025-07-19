$(function () {
    // deteksi role dari blade
    const userRole = window.userRole;

    const table = $('#books-table').DataTable({
        ajax: '/books/fetch',
        columns: [
            { data: 'title' },
            { data: 'authors' },
            { data: 'isbn' },
            { data: 'categories' },
            ...(userRole !== 'member'
                ? [{ data: 'actions', orderable: false, searchable: false }]
                : [])
        ]
    });

    if (userRole !== 'member') {
        $('#createBook').click(function () {
            $('#bookForm')[0].reset();
            $('#method').val('POST');
            $('#book_id').val('');
            $('#modalTitle').text('Tambah Buku');
            $('#bookModal').modal('show');
        });

        $('#books-table').on('click', '.editBook', function () {
            const id = $(this).data('id');
            $.get(`/books/${id}/edit`, function (data) {
                $('#modalTitle').text('Edit Buku');
                $('#method').val('PUT');
                $('#book_id').val(data.id);
                $('#title').val(data.title);
                $('#authors').val(data.authors);
                $('#isbn').val(data.isbn);
                $('#description').val(data.description);

                // set categories
                $('#categories').val(data.categories.map(c => c.id)).trigger('change');

                $('#bookModal').modal('show');
            });
        });

        $('#bookForm').submit(function (e) {
            e.preventDefault();
            const id = $('#book_id').val();
            const method = $('#method').val();
            const url = id ? `/books/${id}` : '/books';

            $.ajax({
                url,
                method: method,
                data: $(this).serialize(),
                success: function () {
                    $('#bookModal').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        $('#books-table').on('click', '.deleteBook', function () {
            if (confirm('Hapus buku ini?')) {
                const id = $(this).data('id');
                $.ajax({
                    url: `/books/${id}`,
                    method: 'DELETE',
                    data: { _token: $('meta[name="csrf-token"]').attr('content') },
                    success: function () {
                        table.ajax.reload();
                    }
                });
            }
        });

        // inisialisasi Select2 saat modal tampil
        $('#bookModal').on('shown.bs.modal', function () {
            $('.categories-select').select2({
                width: '100%',
                placeholder: 'Pilih kategori',
                allowClear: true
            });
        });
    }
});
