class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :manufacturers, through: :products

  # validations : text is between 10 - 500 words, presence: true

  def rating_avg(prod_key)
    #   sql = <<-SQL
    #   SELECT AVG(rating)
    #   FROM Reviews
    #   WHERE product_id = prod_key
    #   SQL 

    #   DB[:conn].execute(sql).map do |row|
    #     self.new_from_db(row)
    # end 
  end 


  # t.bigint "product_id", null: false
  # t.bigint "user_id", null: false
  # t.float "rating"
  # t.text "comment"
end
