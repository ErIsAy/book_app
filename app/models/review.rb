class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book_history
end
