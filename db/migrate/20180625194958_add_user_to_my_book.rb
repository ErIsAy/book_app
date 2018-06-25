class AddUserToMyBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :my_books, :user, foreign_key: true
  end
end
