class CreateBooks < ActiveRecord::Migration[5.0]
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.text :description
    end

    create_table :libraries do |t|
      t.string :name
      t.string :address
    end
  end

  def down
    drop_table :books
  end
end
