module ManufacturersHelper
    def ratings?
        @manufacturer.products.each do |product|
            if product.reviews.empty?
                "No Ratings"
            else 
                product.avg_rating.round(2)
            end 
        end 
    end 

end
