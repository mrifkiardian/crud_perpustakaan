@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Kategori</h1>

    <button class="btn btn-primary mb-3" id="addCategory">Tambah Kategori</button>

    <table class="table table-bordered" id="categories-table">
        <thead>
            <tr>
                <th>Nama</th>
                <th>Dibuat Pada</th>
                <th>Aksi</th>
            </tr>
        </thead>
    </table>
</div>

@include('categories.modal')
@endsection

@push('scripts')
<script src="{{ asset('js/categories.js') }}"></script>
@endpush
