class ManufacturersController < ApplicationController


    
    def show
        @manufacturer = Manufacturer.find_by(id: params[:id])
    end 

end
