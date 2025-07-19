@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Daftar Buku</h1>

    @if(auth()->user()->role !== 'member')
        <button class="btn btn-primary mb-3" id="createBook">Tambah Buku</button>
    @endif

    <table class="table table-bordered" id="books-table">
        <thead>
            <tr>
                <th>Judul</th>
                <th>Penulis</th>
                <th>ISBN</th>
                <th>Kategori</th>
                @if(auth()->user()->role !== 'member')
                    <th>Aksi</th>
                @endif
            </tr>
        </thead>
    </table>
</div>

@if(auth()->user()->role !== 'member')
    @include('books.modal')
@endif
@endsection

@push('scripts')
<script>
    window.userRole = '{{ auth()->user()->role }}';
</script>
<script src="{{ asset('js/books.js') }}"></script>
@endpush
