<div class="modal fade" id="bookModal" tabindex="-1">
    <div class="modal-dialog">
        @csrf
        <form id="bookForm">
            @csrf
            <input type="hidden" name="_method" id="method" value="POST">
            <input type="hidden" name="book_id" id="book_id">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label>Title</label>
                        <input type="text" name="title" id="title" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label>Authors</label>
                        <input type="text" name="authors" id="authors" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label>ISBN</label>
                        <input type="text" name="isbn" id="isbn" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label>Categories</label>
                        <select name="categories[]" id="categories" class="form-select categories-select" multiple>
                            @foreach(\App\Models\Category::all() as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-3">
                        <label>Description</label>
                        <textarea name="description" id="description" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>
