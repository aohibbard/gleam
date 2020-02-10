class ProductsController < ApplicationController
    # before_action :logged_in?, only: [:new, :create, :edit, :update]

    def new
        @product = Product.new
        @product.build_manufacturer #create empty manufacturer
        # @product.build_bodies
        @product.category.try(:id)
    end 

    def create
        product = Product.find_by(name: params[:product][:name],
            manufacturer_id: params[:product][:manufacturer_id])
        if product
            product.update(user_ids: current_user.id)
            redirect_to product_path(product)
        else 
            @product = Product.create(
                params.require(:product).permit(:name, :price, :category_id,
            :manufacturer_id, manufacturer_attributes: [:name])
            )
            if @product.save 
                @product.update(user_ids: current_user.id) 
                # binding.pry
                redirect_to product_path(@product)
            else 
                # render error message
                redirect_to new_product_path
            end 
        end 
    end 

    def show
        product_helper
    end 

    def edit 
        product_helper
    end 

    def update 
        product_helper
        product_helper.update(product_params)
    end 

    private 

    def product_params
        params.require(:product).permit(:name, :price, :category,
        :body_part, :manufacturer_id, manufacturer_attributes: [:name])
    end 

    def product_helper
        @product = Product.find_by(id: params[:id])
    end 

end
