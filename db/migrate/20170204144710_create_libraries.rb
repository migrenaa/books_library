class CreateLibraries < ActiveRecord::Migration[5.0]
  def up
    create_table "books", force: :cascade do |t|
      t.string  "title"
      t.string  "author"
      t.string  "genre"
      t.text    "description"
    end

    create_table "libraries", force: :cascade do |t|
      t.string  "name"
      t.string  "address"
      t.has_many :books
    end

    create_table "books_in_libraries", force: :cascade do |t|
      t.int "count"
      t.belongs_to :library
      t.belongs_to :books
    end

    create_table "users", force: :cascade do |t|
      t.string "email"
      t.string "password"
      t.string "username"
      t.string "name"
      t.has_many :books
    end
  end

  def down
    drop_table :books
  end
end
