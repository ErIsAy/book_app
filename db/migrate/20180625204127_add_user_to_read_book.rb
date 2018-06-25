class AddUserToReadBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :read_books, :user, foreign_key: true
  end
end
