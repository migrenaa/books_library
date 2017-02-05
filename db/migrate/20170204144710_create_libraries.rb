class CreateLibraries < ActiveRecord::Migration[5.0]
  def up
    create_table "users", force: :cascade do |t|
      t.string "password"
      t.string "username"
      t.string "name"
      t.string "role"
    end

    create_table "users_books", force: :cascade do |t|
      t.integer "user_id"
      t.integer "book_in_library_id"
      t.text "date_to_return"
      t.text "date_taken"
    end

    create_table "books", force: :cascade do |t|
      t.string "title"
      t.string "author"
      t.string "genre"
      t.text   "description"
    end

    create_table "books_in_libraries", force: :cascade do |t|
      t.integer "count"
      t.integer "library_id"
      t.integer "book_id"
    end

    create_table "libraries", force: :cascade do |t|
      t.string "name"
      t.string "address"
    end

    create_table "users", force: :cascade do |t|
      t.string "email"
      t.string "password"
      t.string "username"
      t.string "name"
    end

  end

  def down

  end
end
