@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Loan Detail</h1>

    <div class="mb-3">
        <strong>User:</strong> {{ $loan->user->name }}
    </div>
    <div class="mb-3">
        <strong>Book:</strong> {{ $loan->book->title }}
    </div>
    <div class="mb-3">
        <strong>Loan Date:</strong> {{ $loan->loan_date }}
    </div>
    <div class="mb-3">
        <strong>Return Date:</strong> {{ $loan->return_date }}
    </div>
    <div class="mb-3">
        <strong>Returned:</strong> {{ $loan->is_returned ? 'Yes' : 'No' }}
    </div>

    <a href="{{ route('loans.index') }}" class="btn btn-secondary">Back</a>
</div>
@endsection
