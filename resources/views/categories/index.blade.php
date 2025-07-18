@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Categories</h1>

    <button class="btn btn-primary mb-3" id="addCategory">Add Category</button>

    <table class="table table-bordered" id="categories-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Created At</th>
                <th>Action</th>
            </tr>
        </thead>
    </table>
</div>

@include('categories.modal')
@endsection

@push('scripts')
<script src="{{ asset('js/categories.js') }}"></script>
@endpush
