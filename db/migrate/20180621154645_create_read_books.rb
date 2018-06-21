class CreateReadBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :read_books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.text :image_url
      t.integer :isbn

      t.timestamps
    end
  end
end
