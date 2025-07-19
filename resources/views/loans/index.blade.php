@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">Peminjaman Buku</h1>

    <script>
        window.userRole = '{{ auth()->user()->role }}';
    </script>

    @if(in_array(auth()->user()->role, ['admin', 'librarian']))
        <button class="btn btn-primary mb-3" id="addLoanBtn">Tambah Peminjaman</button>
    @endif

    <div class="table-responsive">
        <table class="table table-bordered" id="loans-table">
            <thead class="table-light">
                <tr>
                    <th>Buku</th>
                    <th>Penjaga</th>
                    <th>Anggota</th>
                    <th>Dipinjam Pada</th>
                    <th>Dikembalikan Pada</th>
                    @if(in_array(auth()->user()->role, ['admin', 'librarian']))
                        <th>Aksi</th>
                    @endif
                </tr>
            </thead>
        </table>
    </div>
</div>

@if(in_array(auth()->user()->role, ['admin', 'librarian']))
    @include('loans.modal')
@endif
@endsection

@push('scripts')
<script src="{{ asset('js/loans.js') }}"></script>
@endpush
