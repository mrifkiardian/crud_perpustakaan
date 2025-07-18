@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Loans</h1>
    <button class="btn btn-primary mb-3" id="addLoanBtn">Add Loan</button>

    <table class="table table-bordered" id="loans-table">
        <thead>
            <tr>
                <th>Book</th>
                <th>Librarian</th>
                <th>Member</th>
                <th>Loan At</th>
                <th>Returned At</th>
                <th>Actions</th>
            </tr>
        </thead>
    </table>
</div>

@include('loans.modal')
@endsection

@push('scripts')
<script src="{{ asset('js/loans.js') }}"></script>
@endpush
