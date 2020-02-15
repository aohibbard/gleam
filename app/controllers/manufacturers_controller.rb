class ManufacturersController < ApplicationController

    def index 
        @manufacturers = Manufacturer.all.sort
    end

    def search
        if params[:q]
            @manufacturer = Manufacturer.where('manufacturer LIKE ?', "%#{params[:q]}%")
        else
            @manufacturer = Manufacturer.all
        end
    end 

    def show
        @manufacturer = Manufacturer.find_by(id: params[:id])
        @products = Product.alphabetize(@manufacturer.id)
    end 
    
end
