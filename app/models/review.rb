class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :manufacturers, through: :products
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
  validates :comment, length: {in: 10..400} #, message: "Comment must be between 10 and 400 characters"

      # user.where(proudct, best review)

  scope :most_recent, ->(product_id) {order("created_at desc").limit(5)}

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
