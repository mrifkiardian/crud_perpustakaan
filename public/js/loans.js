let table;

$(function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    table = $('#loans-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/loans/ajax',
        columns: [
            { data: 'book', name: 'book.title' },
            { data: 'librarian', name: 'librarian.name' },
            { data: 'member', name: 'member.name' },
            { data: 'loan_at', name: 'loan_at' },
            { data: 'returned_at', name: 'returned_at' },
            ...(window.userRole !== 'member' ? [
                { data: 'actions', name: 'actions', orderable: false, searchable: false }
            ] : [])
        ]
    });

    if (window.userRole !== 'member') {
        $('#addLoanBtn').click(() => {
            $('#loanForm')[0].reset();
            $('#loan_id').val('');
            $('#loanModal').modal('show');
        });

        $('#loanForm').submit(function (e) {
            e.preventDefault();

            let id = $('#loan_id').val();
            let url = id ? `/loans/update/${id}` : `/loans/store`;

            $.ajax({
                url,
                method: 'POST',
                data: $(this).serialize(),
                success() {
                    $('#loanModal').modal('hide');
                    table.ajax.reload();
                }
            });
        });
    }
});

function editLoan(id) {
    if (window.userRole === 'member') return;

    $.get(`/loans/${id}`, function (data) {
        $('#loan_id').val(data.id);
        $('#book_id').val(data.book_id);
        $('#librarian_id').val(data.librarian_id);
        $('#member_id').val(data.member_id);
        $('#loan_at').val(data.loan_at ? data.loan_at.replace(' ', 'T') : '');
        $('#returned_at').val(data.returned_at ? data.returned_at.replace(' ', 'T') : '');
        $('#note').val(data.note);
        $('#loanModal').modal('show');
    });
}

function deleteLoan(id) {
    if (window.userRole === 'member') return;

    if (confirm('Yakin ingin menghapus pinjaman ini?')) {
        $.ajax({
            url: `/loans/delete/${id}`,
            method: 'DELETE',
            data: { _token: $('meta[name=csrf-token]').attr('content') },
            success() {
                table.ajax.reload();
            }
        });
    }
}
