class CreateBooks < ActiveRecord::Migration[5.0]
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.text :description

      t.boolean :is_deleted, :default => false
    end

    create_table :libraries do |t|
      t.string :name
      t.string :address
    end

    create_table :booksToLibrary do |t|
      t.int :bookId
      t.int :libraryId
    end
  end

  def down
    drop_table :books
  end
end
