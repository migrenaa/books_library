class CreateBooks < ActiveRecord::Migration[5.0]
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.text :description

      t.boolean :is_deleted, :default => false
    end
  end

  def down
    drop_table :books
  end
end
