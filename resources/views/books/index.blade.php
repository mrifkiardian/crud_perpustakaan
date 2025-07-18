@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Books</h1>
    <button class="btn btn-primary mb-3" id="createBook">Add Book</button>
    <table class="table table-bordered" id="books-table">
        <thead>
            <tr>
                <th>Title</th>
                <th>Authors</th>
                <th>ISBN</th>
                <th>Categories</th>
                <th>Action</th>
            </tr>
        </thead>
    </table>
</div>

@include('books.modal')
@endsection

@push('scripts')
<script src="{{ asset('js/books.js') }}"></script>
@endpush
