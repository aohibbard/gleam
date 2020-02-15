class ReviewsController < ApplicationController

    def new
        params[:product_id] && @product = Product.find_by_id(params[:product_id])
        @product.reviews.build
        @review = Review.new
    end 

    def create 
        # binding.pry
        # binding.pry
        params[:product_id] && @product = Product.find_by_id(params[:product_id])
        @review = Review.create(review_params)
        # binding.pry

        if @review.save 
            # @review.update(user_ids: current_user.id)
            redirect_to product_path(@review.product_id)
        else 
            # error msg
            render :new
        end 
    end 

    def show
        @product = Product.find_by(id: params[:product_id])
        @review = Review.find_by(id: params[:id])

    end 

    def edit
        @product = Product.find_by(id: params[:product_id])
        @review = Review.find_by(id: params[:id])
    end 

    def update
        @product = Product.find_by(id: params[:product_id])
        @review = Review.find_by(id: params[:id])
        @review.update(review_params)
        if @review.save
            redirect_to product_path(@review.product_id)
        else 
            # error msg
            render :edit 
        end 
    end 

    private

    def review_params
        params.require(:review).permit(
            :product_id, :rating, :comment, :user_id 
            )
    end 

end
