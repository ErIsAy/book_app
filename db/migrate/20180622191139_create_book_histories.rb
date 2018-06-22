class CreateBookHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_histories do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :image_url
      t.string :isbn

      t.timestamps
    end
  end
end
