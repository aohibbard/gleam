class ReviewsController < ApplicationController

    def new
        params[:product_id] && @product = Product.find_by_id(params[:product_id])
        @review = Review.new
    end 

    def create 
        # binding.pry
        # binding.pry

        @review = Review.new(params.permit(:product_id, :user_id, :rating, :comment))
        if @review.save 
            # @review.update(user_ids: current_user.id)
            redirect_to product_path(@review.product_id)
        else 
            # error msg
            redirect_to product_path(params:[product_id]), flash: { message: message }
        end 
    end 

    # def show
    # end 

    def edit
    end 

    def update
    end 

    private 

    def review_params
        params.require(:review).permit(:product_id, :user_id, :rating, :comment)
    end 

end
