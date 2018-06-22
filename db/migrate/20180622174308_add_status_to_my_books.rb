class AddStatusToMyBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :my_books, :status, :string
  end
end
