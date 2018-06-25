class AddBookHistoryIdFieldToMyBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :my_books, :book_history, foreign_key: true
  end
end
