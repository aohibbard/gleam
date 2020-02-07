class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  # validations : text is between 10 - 500 words, presence: true
end
